using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class prepay : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
    int oid;
    int uid;
    int qty;
    Int64 total;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            oid = Convert.ToInt16(Request.QueryString["oid"]);
            uid = Convert.ToInt16(Session["uid"]);
            total = Convert.ToInt64(Request.QueryString["total"]);
            txtcid.Text = uid.ToString();
            txtid.Text = oid.ToString();
            txtamount.Text = total.ToString();
        }
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        oid = Convert.ToInt16(Request.QueryString["oid"]);
        qty = Convert.ToInt16(Request.QueryString["qty"]);
        uid = Convert.ToInt16(Session["uid"]);
        total = Convert.ToInt64(Request.QueryString["total"]);
        string tdate = DateTime.Now.ToShortDateString();
        string sdate = DateTime.Now.Date.AddDays(5).ToShortDateString();
        string sadd = txtadd.Text;

        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("insert into [order] values('" + uid + "','" + oid + "','" + tdate + "','" + total + "','" + sadd + "','" + sdate + "')", con);
        cmd1.ExecuteNonQuery();

        con.Close();
        //string resoiult = RadioButtonList1.SelectedItem.ToString();
        //if (result == "AmericanExpress")
        //{
        //    Response.Redirect("~/pay.aspx?bid=" + txtid.Text + "&cid=" + txtcid.Text + "&amount=" + txtamount.Text);
        //}
        //else if (result == "Master")
        //{
        //    Response.Redirect("~/master.aspx?bid=" + txtid.Text + "&cid=" + txtcid.Text + "&amount=" + txtamount.Text);
        //}
        //else
        //{
        //    Response.Redirect("~/visacc.aspx?bid=" + txtid.Text + "&cid=" + txtcid.Text + "&amount=" + txtamount.Text);
        //}

        string card_type, bank_name;
        if (cc.Checked == true)
        {
            card_type = "Credit Card";
            bank_name = RadioButtonList1.SelectedItem.ToString();
            
        }
        else
        {
            card_type = "Debit Card";
            bank_name = RadioButtonList2.SelectedItem.ToString();
           
        }
        con.Open();
        SqlCommand cmdcard = new SqlCommand("insert into [payment] values('" + oid + "','" + total + "','" + card_type + "')", con);
        cmdcard.ExecuteNonQuery();
        con.Close();

        Response.Redirect("~/card.aspx?bid=" + txtid.Text + "&cid=" + txtcid.Text + "&amount=" + txtamount.Text + "&qs_card_type=" + card_type + "&qs_bank_name=" + bank_name+"&qty="+qty+"");
    }
    protected void cc_CheckedChanged(object sender, EventArgs e)
    {
        creditcard.Visible = true;
        PlaceHolder1.Visible = false;
    }
    protected void dc_CheckedChanged(object sender, EventArgs e)
    {
        creditcard.Visible = false;
        PlaceHolder1.Visible = true;
    }
}