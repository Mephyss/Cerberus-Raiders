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
        string map_flag = Request.Form["new_map_flag"];

        if (map_flag == "1")
        {
            string map_map = Request.Form["new_map_map"];

            LoadMap(map_map);
        }
        else
        {
            LoadMap(@"img/missing.png");
        }

        if (!Page.IsPostBack)
        {
            LoadTools(@"data/basic_tools.txt");
        }
    }

    private void LoadMap(string file_name)
    {
        /*
         * Look in the file to see the map
         */

        string script_map = "<script>LoadMap(\"img/" + file_name + "\");</script>";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), script_map, false);
    }

    private void LoadTools(string file_name)
    {
        string path = Server.MapPath("/");
        file_name = path + "Cerberus/" + file_name;

        int count = 1;

        if (File.Exists(file_name))
        {
            string[] lines = File.ReadAllLines(file_name);

            foreach (string line in lines)
            {
                string[] parts = line.Split('=');
                if (parts[0] == "section")
                {
                    raid_icons.Text += "<br><br>" +parts[1]+ "<br>";
                }
                else if (parts[0] == "icon")
                {
                    string[] data = parts[1].Split(';');

                    string src = "img/" + data[0];
                    if (!File.Exists(path + "Cerberus/" + src))
                    {
                        src = "img/missing.png";
                    }

                    raid_icons.Text += "<img class='icon' src='" + src + "' title='" + data[1]+ "' onclick='SelectToken(\"" + data[0] + "\", " + count + ")' />";
                    ++count;
                }
            }
        }
    }
}