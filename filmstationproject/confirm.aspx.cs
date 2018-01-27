using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class confirm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
    SqlConnection con1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
    SqlConnection con2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());
    string body;
    string sub = "Order Placed successfully";
    string eid,uid;
    string oid, odate, oamt, oshipadd, oshipdate;
    int qty;


    protected void Page_Load(object sender, EventArgs e)
    {
       
        qty = Convert.ToInt32(Request.QueryString["qty"]);
        con.Close();
        con.Open();
        con1.Close();
        con1.Open();
        SqlCommand cmd = new SqlCommand("select user_email,user_id from [user_master] where user_id='" + Session["uid"] + "'", con1);
       
        
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
       

        eid = dr.GetValue(0).ToString();
        uid = dr.GetValue(1).ToString();
        dr.Close();
        SqlCommand cmd2 = new SqlCommand("select * from [order] where user_id='" + Session["uid"] + "'", con1);
        SqlDataReader dr1 = cmd2.ExecuteReader();
        dr1.Read();
        
        oid = dr1.GetValue(1).ToString();
        odate = dr1.GetValue(2).ToString();
        oamt = dr1.GetValue(3).ToString();
        oshipadd = dr1.GetValue(4).ToString();
        oshipdate = dr1.GetValue(5).ToString();
        dr1.Close();
        con.Close();
        con1.Close();
        body = @"your order has been placed successfully"+"\nOrder id:"+ oid+"\nOrder Date"+odate+"\nTotal Amount:"+oamt+"\nShipping address:"+oshipadd+"\nExpected Shipping date:"+oshipdate+"\nThank you for shopping with us !";
        Label1.Text = SendEmail(eid, sub, body);
        

        con2.Open();
        SqlCommand cmddelete=new SqlCommand("delete from cart where user_id="+uid,con2);
        cmddelete.ExecuteNonQuery();

        con2.Close();
        
        
        
        
        
        
    }

    public string SendEmail(string toAddress, string subject, string body)
    {
        string result = "Message Sent Successfully..!!";
        string senderID = "filmstation@yahoo.com";// use sender’s email id here..
        const string senderPassword = "SuperPicture"; // sender password here…
        try
        {
            SmtpClient smtp = new SmtpClient
            {
                Host = "smtp.mail.yahoo.com", // smtp server address here…
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                Timeout = 30000,
            };
            MailMessage message = new MailMessage(senderID, toAddress, subject, body);
            smtp.Send(message);
        }
        catch (Exception ex)
        {
            result = "Error sending email.!!!";
        }
        return result;
    }
}