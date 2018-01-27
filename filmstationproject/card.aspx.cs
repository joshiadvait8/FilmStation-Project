using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class card : System.Web.UI.Page
{
    string var_card_type, var_bank_name;
    int qty;
    protected void Page_Load(object sender, EventArgs e)
    {

       

        String amount = Request.QueryString["amount"];
         qty =Convert.ToInt32( Request.QueryString["qty"]);
        String bid = Request.QueryString["bid"];
        String cid = Request.QueryString["cid"];
        // String radio = Request.QueryString[3];
        lblamount.Text = Request.QueryString["amount"];

        //  msg.Text = radio;
        if (!IsPostBack)
        {
            var_card_type = Request.QueryString["qs_card_type"].ToString();
            var_bank_name = Request.QueryString["qs_bank_name"].ToString();

            if (Request.QueryString["qs_bank_name"] == "AmericanExpress")
            {
                REV_For_All.ValidationExpression = "^3[47][0-9]{13}$";
                REV_cre.ValidationExpression = @"\d{4}";
            }
            if (Request.QueryString["qs_bank_name"] == "Master")
            {
                REV_For_All.ValidationExpression = "^5[1-5][0-9]{14}$";
                REV_cre.ValidationExpression = @"\d{4}";
            }
            if (Request.QueryString["qs_bank_name"] == "Visa")
            {
                REV_For_All.ValidationExpression = "^4[0-9]{12}(?:[0-9]{3})?$";
                REV_cre.ValidationExpression = @"\d{4}";
            }
            if (Request.QueryString["qs_bank_name"] == "Yes Bank")
            {
                REV_For_All.ValidationExpression = @"\d{4}\-\d{4}\-\d{4}\-\d{4}";
                REV_cre.ValidationExpression = @"\d{3}";
            }
            if (Request.QueryString["qs_bank_name"] == "SBI")
            {
                REV_For_All.ValidationExpression = @"\d{4}\-\d{4}\-\d{4}\-\d{4}";
                REV_cre.ValidationExpression = @"\d{3}";
            }
            if (Request.QueryString["qs_bank_name"] == "IDBI Bank")
            {
                REV_For_All.ValidationExpression = @"\d{4}\-\d{4}\-\d{4}\-\d{4}";
                REV_cre.ValidationExpression = @"\d{3}";
            }
        }
    }
    protected void btnpayment_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/confirm.aspx?qty="+qty);
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/cancel.aspx");
    }
}