using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class new_map : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = Server.MapPath("/");
        string file_name = path + "Cerberus/data/maps.txt";

        int count = 1;

        if (File.Exists(file_name))
        {
            string[] lines = File.ReadAllLines(file_name);

            foreach (string line in lines)
            {
                string[] parts = line.Split('=');
                if (parts[0] == "section")
                {
                    ListItem new_item = new ListItem();
                    new_item.Text = "< " + parts[1] + " >";
                    new_item.Value = "0";

                    fm_map.Items.Add(new_item);
                }
                else if (parts[0] == "map")
                {
                    string[] data = parts[1].Split(';');

                    ListItem new_item = new ListItem();
                    new_item.Text = data[1];
                    new_item.Value = data[0];

                    fm_map.Items.Add(new_item);

                    ++count;
                }
            }
        }
    }
}