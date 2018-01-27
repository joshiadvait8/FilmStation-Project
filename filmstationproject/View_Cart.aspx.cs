using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Specialized;

public partial class View_Cart : System.Web.UI.Page
{
    int up_qty, pid, prices;
    SqlConnection con;
    SqlCommand cmd, cmdd,cmd2;
    string temp;
    
    
    /* string s;
    string t;
    string[] a = new string[6];*/
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null) 
        {
            Response.Redirect("Login.aspx");
        }

        /*DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[7] { new DataColumn("p_name"), new DataColumn("p_description"), new DataColumn("p_price"), new DataColumn("p_quantity"), new DataColumn("p_image"), new DataColumn("p_id"), new DataColumn("product_id") });

        if (Request.Cookies["aj"] != null)
        {
            s = Convert.ToString(Request.Cookies["aj"].Value);
            string[] strArr = s.Split('|');
            for (int i = 0; i < strArr.Length; i++)
            {
                t = Convert.ToString(strArr[i].ToString());
                string[] strArr1 = t.Split(',');
                for (int j = 0; j < strArr1.Length; j++)
                {
                    a[j] = strArr1[j].ToString();
                }
                dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), i.ToString(),a[5].ToString());

            }
        }
        Repeater1.DataSource = dt;
        Repeater1.DataBind();*/

        temp = "active";

        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
        if (GridView1.Rows.Count > 0)
        {
            try
            {
                int i = Convert.ToInt32(Request.QueryString["p"]);
                if (i != 0)
                    lbl_total.Text = "you had already added a product please update quantity";
            }
            catch (Exception rr)
            {

            }
        }
        else
        {
            Payment.Visible = false;
            Remove.Visible = false;
            
            lbl_total.Text = "you have 0 items in cart";

        }


    }


    public static IOrderedDictionary GetValues(GridViewRow row)
    {
        IOrderedDictionary values = new OrderedDictionary();
        foreach (DataControlFieldCell cell in row.Cells)
        {
            if (cell.Visible)
            {
                // Extract values from the cell
                cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
            }
        }
        return values;
    }

  

    protected void edit(int j)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            IOrderedDictionary rowValues = new OrderedDictionary();
            rowValues = GetValues(GridView1.Rows[i]);
            TextBox prid = new TextBox();
            prid = (TextBox)GridView1.Rows[i].FindControl("pidu");
            TextBox pri = new TextBox();
            pri = (TextBox)GridView1.Rows[i].FindControl("quanty");
            up_qty = Convert.ToInt32(pri.Text);

            pid = Convert.ToInt32(prid.Text);
            Label prida = (Label)GridView1.Rows[i].FindControl("proprice");
            
            prices = Convert.ToInt32(prida.Text);
            int pp = prices * up_qty;
            string status = "shopping";






            CheckBox cbRemove = new CheckBox();
            cbRemove = (CheckBox)GridView1.Rows[i].FindControl("chb");
            if (cbRemove.Checked)
            {
                if (j == 1)
                {
                    if (up_qty >= 1)
                    {

                        cmd = new SqlCommand("update cart set p_quantity='" + up_qty + "',p_price='" + prices + "',amount=" + up_qty*prices + " where p_id='" + pid + "' and user_id='" + Session["uid"] + "' and status='" + status + "'", con);
                        if (con.State == ConnectionState.Open)
                            con.Close();
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        con.Open();
                        SqlCommand cmdyour = new SqlCommand("update your set amount="+up_qty*prices+"where p_id="+pid+"and user_id="+Session["uid"]+"",con);
                        cmdyour.ExecuteNonQuery();

                        con.Close();


                    }
                }
                else
                {
                    con.Open();
                    cmd = new SqlCommand("delete from cart where p_id=" + pid + "and user_id=" + Session["uid"], con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    con.Open();
                   SqlCommand cmddeleyour= new SqlCommand("delete from your where p_id=" + pid + "and user_id=" + Session["uid"], con);
                   cmddeleyour.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        edit(1);
        GridView1.DataSourceID = "SqlDataSource1";
        GridView1.DataBind();

        //payment
        string s = "shopping";
        SqlCommand cmd = new SqlCommand("Select amount,p_quantity,p_id from cart where user_id='" + Session["uid"].ToString() + "' and status='" + s + "'", con);
        SqlDataReader dr;
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        dr = cmd.ExecuteReader();
        dr.Read();

        //

        //
        int qty = Convert.ToInt32(dr.GetValue(1).ToString());
        dr.Dispose();
        cmd.Dispose();
        con.Close();


        con.Open();
        SqlCommand cmd3 = new SqlCommand("Select sum(amount) from cart where user_id='" + Session["uid"].ToString() + "' and status='" + s + "'", con);
        SqlDataReader dr3;
        dr3 = cmd3.ExecuteReader();
        dr3.Read();
        int total = Convert.ToInt32(dr3.GetValue(0).ToString());
        dr3.Dispose();
        con.Close();

        con.Open();
        //orderid autogenerate
        SqlCommand cmd2 = new SqlCommand("select max(order_id)+1 from [order]", con);
        SqlDataReader dr1 = cmd2.ExecuteReader();
        dr1.Read();
       
        int oid = Convert.ToInt16(dr1.GetValue(0));
        Response.Redirect("~/prepay.aspx?total=" + total + "&oid=" + oid + "&qty=" + qty + "");

    }

    protected void remove_Click(object sender, EventArgs e)
    {
        edit(2);
        GridView1.DataSourceID = "SqlDataSource1";
        GridView1.DataBind();
        if (GridView1.Rows.Count > 0)
        {

        }
        else
        {
            Payment.Visible = false;
            Remove.Visible = false;
           
            lbl_total.Text = "you have 0 items in cart";

        }
    }


    /*protected void pay_Click(object sender, EventArgs e)
    {
        string s = "shopping";
        SqlCommand cmd = new SqlCommand("Select amount,p_quantity,p_id from cart where user_id='" + Session["uid"].ToString() + "' and status='" + s + "'", con);
        SqlDataReader dr;
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        dr = cmd.ExecuteReader();
        dr.Read();

        //
                       
        //
       int qty = Convert.ToInt32( dr.GetValue(1).ToString());
        dr.Dispose();
        cmd.Dispose();
        con.Close();

        
        con.Open();
        SqlCommand cmd3 = new SqlCommand("Select sum(amount) from cart where user_id='" + Session["uid"].ToString() + "' and status='" + s + "'", con);
        SqlDataReader dr3;
        dr3=cmd3.ExecuteReader();
        dr3.Read();
        int total = Convert.ToInt32(dr3.GetValue(0).ToString());
        dr3.Dispose();
        con.Close();

        con.Open();
        //orderid autogenerate
        SqlCommand cmd2 = new SqlCommand("select max(order_id)+1 from [order]", con);
        SqlDataReader dr1 = cmd2.ExecuteReader();
        dr1.Read();
        int oid = Convert.ToInt16(dr1.GetValue(0));
        Response.Redirect("~/prepay.aspx?total=" + total + "&oid=" + oid + "&qty="+qty+"");
    }*/
   
}