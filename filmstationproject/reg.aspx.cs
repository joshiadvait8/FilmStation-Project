using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;


public partial class reg : System.Web.UI.Page
{

    SqlConnection con; int uid;
    SqlCommand cmd, cmd1;
    SqlDataReader dr;
    string fname, lname, email, ph, add, city, state, pin, country, pass;
    string sub = "Registration Successfull with Film Station..!!";
    string body;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["FilmStationConnectionString"].ToString());


        //autogenerate user_id;
        cmd = new SqlCommand("select count(user_id) from user_master", con);
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            uid = Convert.ToInt32(dr.GetValue(0).ToString());

        }
        uid = uid + 1;
        cmd.Dispose();
        dr.Dispose();
        con.Close();


        //enter the values to user table
        fname = txt_fname.Text;

        lname = txt_lname.Text;

        email = txt_email.Text;

        ph = txt_phno.Text;

        add = txt_addr.Text;

        city = txt_city.Text;

        state = txt_state.Text;

        pin = txt_pincode.Text;

        country =Request.Form["country"];

        pass = txt_pass.Text;
        cmd1 = new SqlCommand("insert into user_master values('" + uid + "','" + fname + "','" + lname + "','" + email + "','" + ph + "','" + add + "','" + city + "','" + state + "','" + pin + "','" + country + "','" + pass + "')", con);
        if (con.State == ConnectionState.Open)
            con.Close();
        con.Open();
        cmd1.ExecuteNonQuery();

        con.Close();
        cmd1.Dispose();
        //lblmsg.Text = "Data Added!!!!";
        //Response.Redirect("Login.aspx");
        body="Username:"+txt_fname.Text+" Password:"+txt_pass.Text+"  Thank you for registering with us..! enjoy shopping with this your credentials.";
       Label1.Text=SendEmail(txt_email.Text,sub,body);

       
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