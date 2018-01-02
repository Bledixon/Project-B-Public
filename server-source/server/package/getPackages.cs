using db;
using System.Net;
using System.Text;

namespace server.package
{
    [HttpUrlRequest("/package/getPackages")]
    internal class getPackages : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] res = Encoding.UTF8.GetBytes(@"<PackageResponse>
    <Packages>
        <Package id='2'>
            <Name>Store More Package</Name>
            <Price>1850</Price>
            <Quantity>-1</Quantity>
            <MaxPurchase>-1</MaxPurchase>
            <Weight>0</Weight>
            <BgURL>http://i.imgur.com/yMyjdWA.png</BgURL>
            <EndDate>04/24/2014 12:59:00 GMT-0800</EndDate>
        </Package>
        <Package id='2'>
            <Name>Super Dungeon Pack</Name>
            <Price>2100</Price>
            <Quantity>-1</Quantity>
            <MaxPurchase>-1</MaxPurchase>
            <Weight>0</Weight>
            <BgURL>http://i.imgur.com/IAmXMcl.png</BgURL>
            <EndDate>04/24/2014 12:59:00 GMT-0800</EndDate>
        </Package>
        <Package id='4'>
            <Name>Ambrosia Pack</Name>
            <Price>4000</Price>
            <Quantity>-1</Quantity>
            <MaxPurchase>-1</MaxPurchase>
            <Weight>0</Weight>
            <BgURL>http://i.imgur.com/jxbGruE.png</BgURL>
            <EndDate>04/24/2014 12:59:00 GMT-0800</EndDate>
        </Package>
    </Packages>
    <History>
        <Package id='1'>
            <Count>2</Count>
        </Package>
    </History>
</PackageResponse>");
            ListenerContext.Response.OutputStream.Write(res, 0, res.Length);
        }
    }
}