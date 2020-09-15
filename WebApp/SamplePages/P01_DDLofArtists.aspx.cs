using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.SamplePages
{
    public partial class P01_DDLofArtists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DisplaySelectedInfo1_Click(object sender, EventArgs e)
        {
            {
                var selectedindex = DDLofArtists1.SelectedIndex;
                var selectedvalue = DDLofArtists1.SelectedValue;
                var selecteditem = DDLofArtists1.SelectedItem;
                MessageLabel.Text = $"SelectedIndex:{selectedindex} " +
                                    $" SelectedValue:{selectedvalue} " +
                                    $" SelectedItem:{selecteditem}";
            }
        }

        protected void DisplaySelectedInfo2_Click(object sender, EventArgs e)
        {
            {
                var selectedindex = DDLofArtists2.SelectedIndex;
                var selectedvalue = DDLofArtists2.SelectedValue;
                var selecteditem = DDLofArtists2.SelectedItem;
                MessageLabel.Text = $"SelectedIndex:{selectedindex} " +
                                    $" SelectedValue:{selectedvalue} " +
                                    $" SelectedItem:{selecteditem}";
            }
        }
    }
}