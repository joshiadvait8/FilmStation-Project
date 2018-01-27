using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Product : System.Web.UI.Page
{   SqlConnection con = new SqlConnection(@"Data Source=ADVAIT-PC\SQLEXPRESS;Initial Catalog=FilmStation;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd=con.CreateCommand();
        cmd.CommandType=CommandType.Text;
        if (Request.QueryString["search"] != null)
        {
            cmd.CommandText = "select * from product where p_name like('%" + Request.QueryString["search"].ToString() + "%')";
        }
        else if (Request.QueryString["sort"] != null && Request.QueryString["sort"]=="high-low")
        {
            cmd.CommandText = "select * from product order by p_price desc";
        }
        else if (Request.QueryString["sort"] != null && Request.QueryString["sort"]=="low-high")
        {
            cmd.CommandText = "select * from product order by p_price";
        }
        else
        {
            cmd.CommandText = "select * from product";
        }
        cmd.ExecuteNonQuery();
        DataTable dt =new DataTable();
        SqlDataAdapter da= new SqlDataAdapter(cmd);
        da.Fill(dt);
        Repeater1.DataSource=dt;
        Repeater1.DataBind();
        

        con.Close();
    }
 
}