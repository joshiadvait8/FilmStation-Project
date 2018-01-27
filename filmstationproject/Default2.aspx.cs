using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    int i;
    string cartid;
    SqlConnection con = new SqlConnection(@"Data Source=ADVAIT-PC\SQLEXPRESS;Initial Catalog=FilmStation;Integrated Security=True");
    int id;
    int qty;
    String p_name, p_description, p_price, p_quantity, p_image;
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (Request.QueryString["id"] == null) 
        {
            Response.Redirect("Product.aspx");
        }


          id = Convert.ToInt32(Request.QueryString["id"].ToString());
        Label1.Visible = false;

       // get_qty(id);

        if (qty == 0) 
        {
            TextBox1.Visible = false;
            btnAddToCart.Visible = false;
            Label1.Visible = true;
            Label1.Text = "Not Available";
        }*/
    }
   
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        /*id = Convert.ToInt32(Request.QueryString["id"].ToString());
        if (con.State == ConnectionState.Open)
            con.Close();
       
        
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from product where p_id=" + id + "";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            p_name=dr["p_name"].ToString();
            p_description=dr["p_description"].ToString();
            p_price=dr["p_price"].ToString();
            p_quantity = dr["p_quantity"].ToString();
            p_image = dr["p_image"].ToString();
        }


        

        if (Convert.ToInt32(TextBox1.Text) > Convert.ToInt32(p_quantity))
        {
            Label1.Visible = true;
            Label1.Text = "Not in stock";
        }

        else
        {
            if (Request.Cookies["aj"] == null)
            {
                Response.Cookies["aj"].Value = p_name.ToString() + "," + p_description.ToString() + "," + p_price.ToString() + "," + p_price.ToString() + "," + p_image.ToString() + ","+id.ToString() ;
                Response.Cookies["aj"].Expires = DateTime.Now.AddDays(1);
            }
            else
            {
                Response.Cookies["aj"].Value = Request.Cookies["aj"].Value + "|" + p_name.ToString() + "," + p_description.ToString() + "," + p_price.ToString() + "," + p_price.ToString() + "," + p_image.ToString() + "," + id.ToString();
                Response.Cookies["aj"].Expires = DateTime.Now.AddDays(1);
            }

            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "update product set p_quantity=p_quantity-" + TextBox1.Text+"where p_id="+id+"";
            cmd1.ExecuteNonQuery();
            Response.Redirect("Default2.aspx?id="+id.ToString());
        }*/

        string m = Request.QueryString["id"].ToString();
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("select p_id,user_id,cart_id from cart where p_id='" + m + "'", con);
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            try
            {

                if ((Session["uid"].ToString()) == dr.GetValue(1).ToString())
                {
                    i = Convert.ToInt32(dr.GetValue(0));
                    cartid = dr.GetValue(2).ToString();
                }

            }
            catch (Exception em)
            {
                i = 0;

            }
        }
        dr.Dispose();
        cmd.Dispose();
        con.Close();
        if (i == 0)
        {
            Response.Redirect("~/cart.aspx?p=" + m);
        }
        else
        {
            Response.Redirect("~/View_Cart.aspx?p=" + m+"&cid="+cartid);
        }
    }


  /*  public int get_qty(int qid)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from product where p_id=" + id + "";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            qty= Convert.ToInt32(dr["p_quantity"].ToString()); 
            
       }
        return qty;
    }*/

}