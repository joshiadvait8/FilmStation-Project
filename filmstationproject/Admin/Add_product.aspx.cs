using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Add_product : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd, cmd_prod;
    int prod_id, cat_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"].ToString() != "admin")
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentLength > 5000000)
            {
                nofile.Text = "file size must be less than 5mb";
            }
            else
            {
                con = new SqlConnection(WebConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
                cmd_prod = new SqlCommand("select max(p_id) from product", con);
                if (con.State == ConnectionState.Open)
                    con.Close();
                con.Open();
                SqlDataReader dr = cmd_prod.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    prod_id = Convert.ToInt32(dr.GetValue(0));
                    prod_id = prod_id + 1;
                }

                dr.Dispose();
                cmd_prod.Dispose();
                cat_id = (Convert.ToInt32(DropDownList1.SelectedIndex) + 1);
                cmd = new SqlCommand("insert into product values('" + prod_id + "','" + name.Text + "','" + desc.Text + "','" + price.Text + "','" + cat_id + "','" + brand.Text + "','" + FileUpload1.FileName + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                cmd.Dispose();
                FileUpload1.SaveAs(Server.MapPath("~/imagess/" + FileUpload1.FileName));
                nofile.Text = "uploaded successfully!!!.Thank you";


            }

        }
        else
        {
            nofile.Text = "Please upload an image";
        }
    }
}