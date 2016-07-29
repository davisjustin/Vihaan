using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vihaan_online
{
    public partial class magnum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pwdOK_Click(object sender, EventArgs e)
        {
            if (pwd.Text == "predator") { onlineView.SelectCommand = "SELECT * FROM [rehan] ORDER BY [RegID] DESC"; regData.Visible = true; }
            else { Response.Redirect("http://vihaan2k15.tk"); }
        }

        protected void pwdWork_Click(object sender, EventArgs e)
        {
            if (pwd.Text == "predator") { onlineView.SelectCommand = "SELECT * FROM [rework] ORDER BY [RegID] DESC"; regData.Visible = true; }
            else { Response.Redirect("http://vihaan2k15.tk"); }
        }

        protected void pwdAcco_Click(object sender, EventArgs e)
        {
            if (pwd.Text == "predator") { onlineView.SelectCommand = "SELECT * FROM [reco] ORDER BY [RegID] DESC"; regData.Visible = true; }
            else { Response.Redirect("http://vihaan2k15.tk"); }
        }

    }
}