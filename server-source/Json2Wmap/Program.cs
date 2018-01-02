using System;
using System.IO;
using terrain;

namespace Json2Wmap
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            if (args.Length != 2)
            {
                Console.WriteLine("please execute this in cmd or batch for best results!");
                Console.WriteLine("usage: Json2wmapConv.exe {JsonFile} {WmapFile}");
                Console.WriteLine("{JsonFile}: the path of the Json map file you wish to convert!");
                Console.WriteLine("{WmapFile}: the path of the Wmap file to be created. write a name and the converter will create it in the same directory as itself!");
                Console.ReadLine();
            }
            else
                BeginConvert(args[0], args[1]);
        }

        private static void BeginConvert(string from, string to)
        {
            var success = true;
            try
            {
                var _fileInfo = new FileInfo(from);
                if (_fileInfo.Exists)
                    JsonToWmap.Convert(new XmlData(), from, to);
                else
                {
                    success = false;
                    Console.WriteLine("i didn't find an input file, sorry! :(");
                    Console.WriteLine("==> " + _fileInfo.FullName);
                    Console.ReadLine();
                }
            }
            catch (Exception e)
            {
                success = false;
                Console.WriteLine("Exception Found: " + e);
                Console.ReadLine();
            }

            if (success)
            {
                Console.WriteLine("yay it's done! :)");
                Console.ReadLine();
            }
        }
    }
}