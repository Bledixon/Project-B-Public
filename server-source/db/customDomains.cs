namespace db
{
    public class customDomains
    { /*
        I just want to say, that you have to edit the domain link in the crossdomain manually even if you change it in this file! (yoursite.com)
      */
        public static bool enabled = false;

        public static string custom = @"<cross-domain-policy>
     <allow-access-from domain=""*.yoursite.com"" to-ports=""*"" />
</cross-domain-policy>";

        public static string local = @"<cross-domain-policy>
     <allow-access-from domain=""*"" to-ports=""*"" />
</cross-domain-policy>";
    }
}
