using System.IO;

namespace Json2Wmap_Converter.Objects
{
    internal class SelectedMapsObject
    {
        public string Filename { get; set; }
        public string Filepath { get; set; }
        public string WmapName
        {
            get { return Path.ChangeExtension(Filename, "wmap"); }
        }

        public SelectedMapsObject(string filename, string filepath)
        {
            Filename = filename;
            Filepath = filepath;
        }

        public override string ToString()
        {
            return string.Format("Filename: {0} :: Wmapname: {1} :: Filepath: {2}", Filename, WmapName, Filepath);
        }
    }
}
