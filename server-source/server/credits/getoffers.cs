using db;
using System.Net;
using System.Text;

namespace server.credits
{
    [HttpUrlRequest("/credits/getoffers")]
    internal class getoffers : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] res = Encoding.UTF8.GetBytes(@"<Offers>
    <Tok>WUT</Tok>
    <Exp>STH</Exp>
    <Offer>
        <Id>0</Id>
        <Price>5</Price>
        <RealmGold>500</RealmGold>
        <CheckoutJWT>500</CheckoutJWT>
        <Data>YO</Data>
        <Currency>HKD</Currency>
    </Offer>
    <Offer>
        <Id>1</Id>
        <Price>10</Price>
        <RealmGold>1200</RealmGold>
        <CheckoutJWT>1200</CheckoutJWT>
        <Data>YO</Data>
        <Currency>USD</Currency>
    </Offer>
</Offers>");
            ListenerContext.Response.OutputStream.Write(res, 0, res.Length);
        }
    }
}