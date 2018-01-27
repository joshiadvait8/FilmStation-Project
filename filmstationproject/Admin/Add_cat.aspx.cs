using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Add_cat : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand cmd, cmd_prod;
    int c_id, cat_id;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"].ToString() != "admin")
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
        cmd_prod = new SqlCommand("select max(cat_id) from category", con);
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        SqlDataReader dr = cmd_prod.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            c_id = Convert.ToInt32(dr.GetValue(0));
            c_id = c_id + 1;
        }

        dr.Dispose();
        cmd_prod.Dispose();

        cmd = new SqlCommand("insert into category values('" + c_id + "','" + cat_name.Text + "','" + cat_details.Text + "')", con);
        cmd.ExecuteNonQuery();
        con.Close();
        cmd.Dispose();
    }
}