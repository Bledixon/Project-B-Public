using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace svrMonitor
{
    static class Program
    {
        static void Main()
        {
            Launch();
        }

        private static void Launch()
        {
            ProcessStartInfo psi = new ProcessStartInfo();
            psi.FileName = "wServer.exe";

            Process p = new Process();
            p.StartInfo = psi;
            p.EnableRaisingEvents = true;
            p.Exited += LaunchAgain; //C# 2.0 syntax - alternative: p.Exited += new EventHandler(LaunchAgain);
            p.Start();
        }

        private static void LaunchAgain(object o, EventArgs e)
        {
            Launch();
        }
    }
}
