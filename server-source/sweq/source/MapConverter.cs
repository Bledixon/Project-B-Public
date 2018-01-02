using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using Json2Wmap_Converter.Objects;
using terrain;

namespace Json2Wmap_Converter
{
    public partial class MapConverter : Form
    {
        private readonly List<SelectedMapsObject> _selectedMapsObjectses;
        private readonly XmlData _xmldata;

        public MapConverter()
        {
            InitializeComponent();

            _selectedMapsObjectses = new List<SelectedMapsObject>();

            using (var ofd = new FolderBrowserDialog())
            {
                ofd.Description = "Select your 'data' folder path! (Close to use default)";
                _xmldata = ofd.ShowDialog() != DialogResult.OK ? new XmlData() : new XmlData(ofd.SelectedPath);
            }
        }

        private void MapConverter_Load(object sender, EventArgs e)
        {
            new ToolTip().SetToolTip(button1, "Clear the list!");
        }

        private void addmaps_Click(object sender, EventArgs e)
        {
            using (var fo = new OpenFileDialog())
            {
                fo.Filter = "JM Map (*.jm)|*.jm|Json Map (*.json)|*.json";
                fo.Title = "Select Map(s)";
                fo.Multiselect = true;

                if (fo.ShowDialog() != DialogResult.OK) return;
                foreach (var file in fo.FileNames.Where(file => file != null))
                {
                    _selectedMapsObjectses.Add(new SelectedMapsObject(Path.GetFileName(file), file));
                    selectedmaps.Items.Add(Path.GetFileName(file));
                }
            }
        }

        private void startconversion_Click(object sender, EventArgs e)
        {
            var savePath = string.Empty;

            if (_selectedMapsObjectses == null || _selectedMapsObjectses.Count <= 0)
            {
                return;
            }

            using (var sod = new FolderBrowserDialog())
            {
                sod.Description = "Select a folder to save WMaps";

                if (sod.ShowDialog() == DialogResult.OK)
                {
                    savePath = sod.SelectedPath;
                }
            }

            if (savePath == string.Empty) return;
            foreach (var map in _selectedMapsObjectses)
            {
                Json2Wmap.Convert(_xmldata, map.Filepath, Path.Combine(savePath, map.WmapName));
            }

            savePath = string.Empty;
            MessageBox.Show("Finished converting the things :D");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var alert = MessageBox.Show("Are you sure you wish to empty the list?", "Are you sure?",
                MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);

            if (alert != DialogResult.Yes) return;
            _selectedMapsObjectses.Clear();
            selectedmaps.Items.Clear();
        }
    }
}
