using System;
using System.IO;
using System.Text;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Encodings;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.OpenSsl;

namespace wServer.networking
{
    public class RSA
    {
        public static readonly RSA Instance = new RSA(@"
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAzRQGnNw5kEaIpych+U4JZtuLnMJuQKEyU1FfcyHISNkYhy1j
mSMPav+7D3Qg1R6exeeM6LtXvUEQ6Fgris1JUVDr5gjII0ti98LvIsF/hgTk2VOv
m2QK/1OpyAxni4RZuR8OE0p0Co0yUwhTVjfN5Ooh4hntfuwVtk1AZEFudA9oOqdU
bNwi98M9VIf+9vJWnx2zAx+1r7Ja/JDeM3FbYW9awMw4d0fpGoN/PfZGqKdgd4jj
XLuhatSu13sAU39aPZAI2ku3MQRMQcUBLxDIHyEq1NA+BztASjpYr3w+bX85bWZw
POBN95O3z6hbDTv/FZj5tpkVqaVhxqBeEbaRywIDAQABAoIBAQCFKCCXDyNNO48V
QYJ8tp/CKoE/OruNuVzM3oQkZGYAbv3PH7iQwUQMjJmwEg4TcztScuN6ZdI1bx8E
TeOPz3VwmCNjjIYu7I8JIohVP+CGa30QY5cdRVsip/cQjoVZAImlerWP7wLjqwRn
B3vc+oT0wtVXUtBzXeVHJmfN8PI/5msVguKo6HbjRh7tUbVGfcoLg6hMvnMPCuhN
IdUB0UejPLIOHlfSHSMuVhV1VI1ansSgd5X7hyjUk290PQFcBh3yIygeIqv+bMFW
6PE9Vi0jIQPRbvUc51IGKUD+/V5KGCRP7lxF9n11QjMr/kGv7c+raISy+Zd1m5PI
17OevTxBAoGBAPKNoVO9LnqphnGwV/y7NyNjUgQqKowxBVtRNykMZ02sNg7OaFXF
qSJPsckZy0fRS70k19rHzQQXSfVR7iaeMg5SNf1E8TIsO/rB1E/aaFgsHe0vCo6J
acBzFGtze0puneG/iWrZWXGtxEkmZ6QqFHT8x8Xu28RZxSy38Sziv8TrAoGBANhy
irWNpqTcKVm4Hu6BbTFu1l/lkZqioj75yueDx9aiU1H7Zliwftd4y4pP4V4B+xRK
YdLk4NLbyQbIDfsY1AaSMY/WhsdbWT7xPQRi464nNPCE9k9NU5o3wgL2evZkqzhJ
fnKn6x10l6GLJWEm3KFahGCAGt0+XOk/M1+czK6hAoGBALrLNe3OaMgQXDibzPcW
mt0G9Te93Wx/qBduUWOsaLYZpLv8W7+KbLm+1DUCR1n0pjZw9EdJzeqToOJriVN2
SyhaSbfV60ZvaHWx5jblBay5tQZfTur8ilOqjJQ/qDhnPfGH12VRI5/3aY3IJNL5
kS2TKqqVS+xIEiBhPDwMGBGnAoGBAKEhhAlsDiakj1PvMXe0eilWrdht+lr3v3jK
VDbNb7Nk3EonsSVNHuAhWMT6eneVWejdBr4NDSFr5Ndbjqzi6tSJeMPvnB5E7sdg
p1/gjkZTgaGcGhEnK5me8JtsClXq01vvumZ4gxtGdKsZ/xW37H9h9zIvq9AQYPJy
zjfbbrSBAoGAD0EtX85BQpNSt3FE+DrjYJ0wAUnQ1Tk+zo09xE0o5sIhUmVv67vU
05SP8TTP3itYkvZM6hETaLUlN/IbqI02RczyftTPQAYV6UAKiH1OY7NHrmvZ3XmL
jOpcCGE1NcERNuOan8ch2HsPcG3sY6d9ala3g9ZyBrGbyC347EVR7k8=
-----END RSA PRIVATE KEY-----");

        private readonly RsaEngine engine;
        private readonly AsymmetricKeyParameter key;

        private RSA(string privPem)
        {
            key = (new PemReader(new StringReader(privPem.Trim())).ReadObject() as AsymmetricCipherKeyPair).Private;
            engine = new RsaEngine();
            engine.Init(true, key);
        }

        public string Decrypt(string str)
        {
            if (string.IsNullOrEmpty(str)) return "";
            byte[] dat = Convert.FromBase64String(str);
            var encoding = new Pkcs1Encoding(engine);
            encoding.Init(false, key);
            return Encoding.UTF8.GetString(encoding.ProcessBlock(dat, 0, dat.Length));
        }

        public string Encrypt(string str)
        {
            if (string.IsNullOrEmpty(str)) return "";
            byte[] dat = Encoding.UTF8.GetBytes(str);
            var encoding = new Pkcs1Encoding(engine);
            encoding.Init(true, key);
            return Convert.ToBase64String(encoding.ProcessBlock(dat, 0, dat.Length));
        }
    }
}