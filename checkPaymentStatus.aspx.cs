using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkPaymentStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //String merchantKey = "gSDV#ugYAeeA2Zu4";
        //Dictionary<string, string> parameters = new Dictionary<string, string>();
        //string paytmChecksum = "";
        //foreach (string key in Request.Form.Keys)
        //{
        //    parameters.Add(key.Trim(), Request.Form[key].Trim());
        //}
        //if (parameters.ContainsKey("CHECKSUMHASH"))
        //{
        //    paytmChecksum = parameters["CHECKSUMHASH"];
        //    parameters.Remove("CHECKSUMHASH");
        //}
        //if (paytm.CheckSum.verifyCheckSum(merchantKey, parameters, paytmChecksum))
        //{
        //    string paytmStatus = parameters["STATUS"];
        //    string txnId = parameters["TXNID"];
        //    //pTxnId.InnerText = "Transaction Id : " + txnId;
        //    lblMsg.Text += "Transaction Id : " + txnId;
        //    if (paytmStatus == "TXN_SUCCESS")
        //    {
        //        //h1Message.InnerText = "Your payment is success";
        //        lblMsg.Text += " Your payment is success";
        //        Response.Redirect("orderPlacedSuccess.aspx?txnId=" + txnId, true);
        //    }
        //    else if (paytmStatus == "PENDING")
        //    {
        //        //h1Message.InnerText = "Payment is pending !";
        //        lblMsg.Text += " Payment is pending !";
        //        Response.Redirect("orderPlacedSuccess.aspx?txnId=" + txnId, true);
        //    }
        //    else if (paytmStatus == "TXN_FAILURE")
        //    {
        //        //h1Message.InnerText = "Payment Failure !";
        //        lblMsg.Text += " Payment Failure !";
        //        Response.Redirect("orderFailed.aspx?txnId=" + txnId, true);
        //    }
        //}
        //else
        //{
        //    Response.Write("Checksum MisMatch");
        //    lblMsg.Text += " Checksum MisMatch";
        //}
    }

    protected void btnPaymentSUccess_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderPlacedSuccess.aspx?txnId=ptid", true);
    }

    protected void btnPaymentFailed_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderFailed.aspx??txnId=ptid", true);
    }
}