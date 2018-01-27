using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            logout.Visible = false;
            h2.Visible = true;
            h2.NavigateUrl = "Register.aspx";
        }

        if (Session["name"] == null)
        {
            h1.Text = " Login";
            h1.NavigateUrl = "~/Login.aspx";
        }
        else
        {
            h1.Text = " " + Session["name"];

            h1.NavigateUrl = "";
            logout.Text = "Logout";
            logout.Visible = true;
            h2.Visible = false;


        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Session["name"] = null;
        logout.Visible = false;
        Response.Redirect("~/Default.aspx");
    }
}
