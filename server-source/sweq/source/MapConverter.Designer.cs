namespace Json2Wmap_Converter
{
    partial class MapConverter
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.addmaps = new System.Windows.Forms.Button();
            this.selectedmaps = new System.Windows.Forms.ListBox();
            this.startconversion = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // addmaps
            // 
            this.addmaps.Location = new System.Drawing.Point(13, 13);
            this.addmaps.Name = "addmaps";
            this.addmaps.Size = new System.Drawing.Size(136, 23);
            this.addmaps.TabIndex = 0;
            this.addmaps.Text = "Add Jm Map(s)";
            this.addmaps.UseVisualStyleBackColor = true;
            this.addmaps.Click += new System.EventHandler(this.addmaps_Click);
            // 
            // selectedmaps
            // 
            this.selectedmaps.FormattingEnabled = true;
            this.selectedmaps.Location = new System.Drawing.Point(13, 43);
            this.selectedmaps.Name = "selectedmaps";
            this.selectedmaps.Size = new System.Drawing.Size(173, 160);
            this.selectedmaps.TabIndex = 2;
            // 
            // startconversion
            // 
            this.startconversion.Location = new System.Drawing.Point(13, 209);
            this.startconversion.Name = "startconversion";
            this.startconversion.Size = new System.Drawing.Size(173, 23);
            this.startconversion.TabIndex = 3;
            this.startconversion.Text = "Start Conversion";
            this.startconversion.UseVisualStyleBackColor = true;
            this.startconversion.Click += new System.EventHandler(this.startconversion_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(155, 14);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(35, 23);
            this.button1.TabIndex = 4;
            this.button1.Text = "X";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // MapConverter
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(202, 241);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.startconversion);
            this.Controls.Add(this.selectedmaps);
            this.Controls.Add(this.addmaps);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "MapConverter";
            this.Text = "Jm to Wmap Convter";
            this.Load += new System.EventHandler(this.MapConverter_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button addmaps;
        private System.Windows.Forms.ListBox selectedmaps;
        private System.Windows.Forms.Button startconversion;
        private System.Windows.Forms.Button button1;
    }
}

