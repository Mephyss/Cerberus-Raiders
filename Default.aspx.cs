using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadTools(@"data/basic_tools.txt");
        LoadMap(@"img/antorus-argus.png");
    }

    private void LoadMap(string file_name)
    {
        map.Text += "<img src='" + file_name + "'/>";
    }

    private void LoadTools(string file_name)
    {
        string path = Server.MapPath("/");
        file_name = path + "Cerberus/" + file_name;

        if (File.Exists(file_name))
        {
            string[] lines = File.ReadAllLines(file_name);

            foreach (string line in lines)
            {
                string[] parts = line.Split('=');
                if (parts[0] == "section")
                {
                    raid_icons.Text += "<br><br>" +parts[1]+ "<br><br>";
                }
                else if (parts[0] == "icon")
                {
                    string[] data = parts[1].Split(';');

                    string src = "img/" + data[0];
                    if (!File.Exists(path + "Cerberus/" + src))
                    {
                        src = "img/missing.png";
                    }

                    raid_icons.Text += "<img width='30px' height='30px' src='" + src + "' title='" + data[1]+ "' />";
                }
            }
        }
    }
}