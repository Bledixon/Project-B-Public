using System;
using System.Collections.Specialized;
using System.IO;
using System.Text;
using System.Web;
using db;
using System.Xml.Serialization;
using System.Xml;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace server.market
{
    [HttpUrlRequest("/market/list")]
    internal class list : RequestHandler
    {
        protected override void HandleRequest()
        {
            NameValueCollection query;
            using (var rdr = new StreamReader(ListenerContext.Request.InputStream))
                query = HttpUtility.ParseQueryString(rdr.ReadToEnd());

            if (query.AllKeys.Length == 0)
            {
                string queryString = string.Empty;
                string currUrl = ListenerContext.Request.RawUrl; 
                int iqs = currUrl.IndexOf('?');
                if (iqs >= 0)
                {
                    query =
                        HttpUtility.ParseQueryString((iqs < currUrl.Length - 1)
                            ? currUrl.Substring(iqs + 1)
                            : String.Empty);
                }
            }

            OfferList list = new OfferList();
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var acc = db.Verify(GUID, PASS);

                MySqlCommand cmd = db.CreateQuery();
                    cmd.CommandText = "SELECT * FROM market WHERE status=0 ORDER BY id DESC";
                    if (acc != null && NameValueCollection["filter"] == "mine")
                    {
                        cmd.CommandText = "SELECT * FROM market WHERE accId=@accId ORDER BY id DESC";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    }

                    ushort[] offerSearch = new ushort[0];
                    ItemData[] offerSearchD = new ItemData[0];
                    if (NameValueCollection["offerItems"] != null && NameValueCollection["offerItems"] != "")
                    {
                        offerSearch = Utils.FromCommaSepString16(NameValueCollection["offerItems"]);
                        offerSearchD = new ItemData[offerSearch.Length];
                        if (NameValueCollection["offerData"] != "")
                            offerSearchD = ItemDataList.CreateData(NameValueCollection["offerData"]);
                    }

                    ushort[] reqSearch = new ushort[0];
                    ItemData[] reqSearchD = new ItemData[0];
                    if (NameValueCollection["requestItems"] != null && NameValueCollection["requestItems"] != "")
                    {
                        reqSearch = Utils.FromCommaSepString16(NameValueCollection["requestItems"]);
                        reqSearchD = new ItemData[reqSearch.Length];
                        if (NameValueCollection["requestData"] != "")
                            reqSearchD = ItemDataList.CreateData(NameValueCollection["requestData"]);
                    }

                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        if (offerSearch.Length > 0)
                        {
                            List<ushort> offerItems = new List<ushort>(Utils.FromCommaSepString16(rdr.GetString("offerItems")));
                            ItemData[] offerData = ItemDataList.CreateData(rdr.GetString("offerData"));
                            bool success = false;
                            for (int i = 0; i < offerSearch.Length; i++)
                            {
                                int res = -1;
                                if ((res = offerItems.IndexOf(offerSearch[i])) == -1)
                                    continue;
                                if (offerSearchD[i] != null)
                                {
                                    bool offerDataE = offerData[res] != null;
                                    if ((offerSearchD[i].Strange && (!offerDataE || !offerData[res].Strange)) || (!offerSearchD[i].Strange && offerDataE && offerData[res].Strange))
                                        continue;
                                    if (!offerSearchD[i].Strange && offerSearchD[i].NamePrefix != "")
                                        if (!offerDataE || (offerDataE && offerData[res].NamePrefix != offerSearchD[i].NamePrefix))
                                            continue;
                                    if (offerSearchD[i].Effect != "" && (!offerDataE || (offerData[res].Effect != offerSearchD[i].Effect)))
                                        continue;
                                }
                                else if (offerData[res] != null)
                                    if (offerData[res].Strange || offerData[res].NamePrefix != "" || offerData[res].Effect != "")
                                        continue;
                                success = true;
                                break;
                            }
                            if (!success)
                                continue;
                        }

                        if (reqSearch.Length > 0)
                        {
                            List<ushort> reqItems = new List<ushort>(Utils.FromCommaSepString16(rdr.GetString("requestItems")));
                            ItemData[] reqData = ItemDataList.CreateData(rdr.GetString("requestData"));
                            bool success = false;
                            for (int i = 0; i < reqSearch.Length; i++)
                            {
                                int res = -1;
                                if ((res = reqItems.IndexOf(reqSearch[i])) == -1)
                                    continue;
                                if (reqSearchD[i] != null)
                                {
                                    bool reqDataE = reqData[res] != null;
                                    if ((reqSearchD[i].Strange && (!reqDataE || !reqData[res].Strange)) || (!reqSearchD[i].Strange && reqDataE && reqData[res].Strange))
                                        continue;
                                    if (!reqSearchD[i].Strange && reqSearchD[i].NamePrefix != "")
                                        if (!reqDataE || (reqDataE && reqData[res].NamePrefix != reqSearchD[i].NamePrefix))
                                            continue;
                                    if (reqSearchD[i].Effect != "" && (!reqDataE || (reqData[res].Effect != reqSearchD[i].Effect)))
                                        continue;
                                }
                                else if (reqData[res] != null)
                                    if (reqData[res].Strange || reqData[res].NamePrefix != "" || reqData[res].Effect != "")
                                        continue;
                                success = true;
                                break;
                            }
                            if (!success)
                                continue;
                        }

                        list.Offers.Add(new Offer
                        {
                            Id = rdr.GetInt32("id"),
                            AccId = rdr.GetInt32("accId"),

                            Mine = acc != null ? rdr.GetInt32("accId") == acc.AccountId : false,
                            Status = rdr.GetInt32("status"),

                            _OfferItems = rdr.GetString("offerItems"),
                            _OfferData = rdr.GetString("offerData"),

                            _RequestItems = rdr.GetString("requestItems"),
                            _RequestData = rdr.GetString("requestData")
                        });
                    }
                }
            }

            if(NameValueCollection["filter"] != "mine" && NameValueCollection["filter"] != "searched")
                if (list.Offers.Count > 100)
                    list.Offers.RemoveRange(100, list.Offers.Count - 100);

            var ms = new MemoryStream();
            var serializer = new XmlSerializer(list.GetType(),
                new XmlRootAttribute("Offers") { Namespace = "" });

            var xws = new XmlWriterSettings();
            xws.OmitXmlDeclaration = true;
            xws.Encoding = Encoding.UTF8;
            xws.Indent = true;
            XmlWriter xtw = XmlWriter.Create(ListenerContext.Response.OutputStream, xws);
            serializer.Serialize(xtw, list, list.Namespaces);
        }
    }
}
