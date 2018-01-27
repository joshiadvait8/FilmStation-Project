using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class cart : System.Web.UI.Page
{
    String s, name, desc, cat_id, brand, model, image, total = "shopping";
    int cid, price, qnty, disc, uid;
    SqlConnection con;
    SqlCommand cmd, cmd1;


    protected void Page_Load(object sender, EventArgs e)
    {
        s = Request.QueryString["p"].ToString();
        qnty = 1; disc = 0;
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
        //session["name"] null hai ya nei if null agar null hai toh tera user_id kuch b ek value for eg temp else uid voh tera user id hua
        if (Session["name"] == null)
        {
            Response.Redirect("~/Login.aspx?p=" + s);

        }
        else
        {
            uid = Convert.ToInt32(Session["uid"]);
        }

        //reuest.querrystring se p ka value nikal which is product id

        //p k info se product table uska sara value nikalney ka
        SqlCommand cmd2 = new SqlCommand("Select * from product where p_id=" + s, con);
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        SqlDataReader dr = cmd2.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            name = dr.GetValue(1).ToString();
            desc = dr.GetValue(2).ToString();
            price = Convert.ToInt32(dr.GetValue(3));
            cat_id = dr.GetValue(4).ToString();
            brand = dr.GetValue(5).ToString();
           
            image = dr.GetValue(6).ToString();


        }
        dr.Dispose();
        con.Close();
        cmd2.Dispose();


        //cartid autogenerate karney ka


        //autogenerate user_id;

        cmd = new SqlCommand("select max(cart_id) from cart", con);
        if (con.State ==ConnectionState.Open )
            con.Close();
        con.Open();
        SqlDataReader drr = cmd.ExecuteReader();
        if (drr.HasRows)
        {
            drr.Read();
            try
            {
                cid = Convert.ToInt32(drr.GetValue(0).ToString());
            }
            catch (Exception em)
            {
                cid = 0;
            }

        }
        cid = cid + 1;
        cmd.Dispose();
        drr.Dispose();
        con.Close();

        //insert querry fire karney ka to cart table
        cmd1 = new SqlCommand("insert into cart values('" + cid + "','" + uid + "','" + s + "','" + name + "','" + qnty + "','" + cat_id + "','" + price + "','" + image + "','" + desc + "','" + total +"','"+ (qnty*price)+ "')", con);
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        cmd1.ExecuteNonQuery();
        cmd1.Dispose();
        con.Close();

        con.Open();
        SqlCommand cmd3 = new SqlCommand("insert into your values('" + uid + "','" + name+ "','" + image + "','" + (qnty * price) + "','" + s +"','"+total+ "')", con);
        cmd3.ExecuteNonQuery();
        con.Close();

        //response.redirect to my cart naam ka page
        Response.Redirect("~/View_cart.aspx");
    }
}