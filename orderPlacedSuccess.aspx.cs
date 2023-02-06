using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class orderPlacedSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            updateOrder();
            //UPDATE ORDERMASTER WITH TRANSACTION ID AND WITH ORDERSTUTS
            if (Session["varCashbackAmount"] != null)
            {
                if (Convert.ToDouble(Session["varCashbackAmount"].ToString()) != 0)
                {
                    increaseWalletBalance();
                }
            }
            if (Session["walletDiscountValid"] != null)
            {
                if (Session["walletDiscountValid"].ToString() == "Yes")
                {
                    decreaseWalletBalance();
                }
            }
        }

        lblTotalDiscount.Text = "Bill sent to youe email!";
    }
    private void updateOrder()
    {
        if (Request.QueryString["txnId"] != null)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = null;

            try
            {
                string strSql = "UPDATE ORDERMASTER SET ORDERSTATUS = '1',PAYTM_TRANSACTIONID='" + Request.QueryString["txnId"].ToString() + "' WHERE ORDERID='" + Session["cartId"].ToString() + "'";
                cmd = new SqlCommand(strSql, con);
                con.Open();
                cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "updateOrder() " + ex.Message;
            }
            finally
            {
                cmd.Dispose();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        if (Request.QueryString["razorpay_order_id"] != null && Request.QueryString["razorpay_payment_id"] != null)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = null;

            try
            {
                string strSql = "UPDATE ORDERMASTER SET ORDERSTATUS = '1',RAZORPAY_ORDERID='" + Request.QueryString["razorpay_order_id"].ToString() + "',RAZORPAY_PAYMENTID='" + Request.QueryString["razorpay_payment_id"].ToString() + "' WHERE ORDERID='" + Session["cartId"].ToString() + "'";
                cmd = new SqlCommand(strSql, con);
                con.Open();
                cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "updateOrder() " + ex.Message;
            }
            finally
            {
                cmd.Dispose();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

    }
    private void increaseWalletBalance()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE CUSTOMERS SET BALANCE = BALANCE+'" + Session["varCashbackAmount"].ToString() + "' WHERE EMAIL ='" + Session["email"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "increaseWalletBalance() " + ex.Message;
        }
        finally
        {
            cmd.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
    private void decreaseWalletBalance()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE CUSTOMERS SET BALANCE = BALANCE-'" + Session["walletDiscountAmount"].ToString() + "' WHERE EMAIL ='" + Session["email"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "decreaseWalletBalance() " + ex.Message;
        }
        finally
        {
            cmd.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
    protected void btnViewOrderDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/orderDetail.aspx?orderId=" + Session["cartId"].ToString(), true);
    }


    //    private void sentMailOrderSuccess()
    //    {
    //        try
    //        {
    //            MailMessage msgs = new MailMessage();
    //            msgs.To.Add(Session["email"].ToString().Trim());
    //            MailAddress address = new MailAddress("info@milknberries.com");
    //            msgs.From = address;
    //            msgs.Subject = "Order Placed Successful";
    //            string htmlBody = @"<div class='rounded m-4'>
    //    <div class='mainDiv' id='invoice' style='margin: 0 !important; padding: 0 !important; background-color: #FFFFFF;' bgcolor='#FFFFFF'>


    //    <div style='display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;'>
    //        For what reason would it be advisable for me to think about business content? That might be little bit risky to have crew member like them.
    //    </div>
    //    <table border='0' cellpadding='0' cellspacing='0' width='100%'>
    //        <tr>
    //            <td align='center' style='background-color: #FFFFFF;' bgcolor='#FFFFFF'>
    //                <table align='center' border='1' cellpadding='0' cellspacing='0' width='100%' style='max-width:600px;'>
    //                    <tr>
    //                        <td align='center' valign='top' style='font-size:0; padding: 35px;' bgcolor='#1f1f1f'>
    //                            <div style='display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;'>
    //                                <table align='left' border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width:300px;'>
    //                                    <tr>
    //                                        <td align='left' valign='top' style='font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;' class='mobile-center'>
    //                                            <img src='images/MB-Logo.svg' width='100' class='shadow' style='background-color: #FFF;' />

    //                                        </td>
    //                                    </tr>
    //                                </table>
    //                            </div>
    //                            <div style='display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;' class='mobile-hide'>
    //                                <table align='left' border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width:300px;'>
    //                                    <tr>
    //                                        <td align='right' valign='top' style='font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;'>
    //                                            <table cellspacing='0' cellpadding='0' border='0' align='right'>
    //                                                <tr>
    //                                                    <a href='orders.aspx' class='btn btn-outline-light rounded-pill mt-4'>Track order 🚚</a>
    //                                                </tr>
    //                                            </table>
    //                                        </td>
    //                                    </tr>
    //                                </table>
    //                            </div>
    //                        </td>
    //                    </tr>
    //                    <tr>
    //                        <td align='center' style='padding: 35px 35px 20px 35px; background-color: #ffffff;' bgcolor='#ffffff'>
    //                            <table align='center' border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width:600px;'>
    //                                <tr>
    //                                    <td align='center' style='font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;'> <img src='https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png' width='125' height='120' style='display: block; border: 0px;' /><br>
    //                                        <h2 style='font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;'> Thank You For Your Order! </h2>
    //                                    </td>
    //                                </tr>
    //                                <tr>
    //                                    <td align='left' style='font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;'>
    //                                        <p style='font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;'> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium iste ipsa numquam odio dolores, nam. </p>
    //                                        <div class='d-flex justify-content-center'>
    //                                            <asp:Button ID='btnViewOrderDetail' runat='server' style='font-size: 18px; font-family: Open Sans, Helvetica, Arial, sans-serif; color: #fff; text-decoration: none; border-radius: 5px; background-color: #1f1f1f; padding: 15px 30px; border: 1px solid #1f1f1f; display: block;' OnClick='btnViewOrderDetail_Click' Text='View Details' />
    //                                        </div>
    //                                    </td>
    //                                </tr>
    //                            </table>
    //                        </td>
    //                    </tr>
    //                    <tr>
    //                        <td align='center' style=' padding: 35px; background-color: #1f1f1f;' bgcolor='#1b9ba3'>
    //                            <table align='center' border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width:600px;'>
    //                                <tr>
    //                                    <td align='center' style='font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;'>
    //                                        <h6 style='font-size: 24px; font-weight: 800; line-height: 30px; color: #ffffff; margin: 0;'> <asp:Label ID='lblTotalDiscount' runat='server' Text=''></asp:Label> </h6>
    //                                    </td>
    //                                </tr>
    //                                <tr>
    //                                    <td align='center' style='padding: 10px 0 15px 0;'>
    //                                        <table border='0' cellspacing='0' cellpadding='0'>
    //                                            <tr>
    //                                                <td align='center' style='border-radius: 5px;' bgcolor='#66b3b7'> 

    //                                                </td>
    //                                            </tr>
    //                                        </table>
    //                                    </td>
    //                                </tr>
    //                            </table>
    //                        </td>
    //                    </tr>
    //                    <tr>
    //                        <td align='center' style='padding: 35px; background-color: #ffffff;' bgcolor='#ffffff'>
    //                            <table align='center' border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width:600px;'>
    //                                <tr>
    //                                    <td align='center'> <img src='images/MB-Logo.svg' class='rounded' width='57' height='37' style='display: block; border: 0px;' /> </td>
    //                                </tr>
    //                                <tr>
    //                                    <td align='center' style='font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px; padding: 5px 0 10px 0;'>
    //                                        <p style='font-size: 14px; font-weight: 800; line-height: 18px; color: #333333;'> 675 Parko Avenue<br> LA, CA 02232 </p>
    //                                    </td>
    //                                </tr>
    //                                <%--<tr>
    //                                    <td align='left' style='font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;'>
    //                                        <p style='font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;'> If you didn't create an account using this email address, please ignore this email or <a href='#' target='_blank' style='color: #777777;'>unsusbscribe</a>. </p>
    //                                    </td>
    //                                </tr>--%>
    //                            </table>
    //                        </td>
    //                    </tr>
    //                </table>
    //            </td>
    //        </tr>
    //    </table>
    //</div>
    //        </div>";
    //            msgs.Body = htmlBody;
    //            msgs.IsBodyHtml = true;
    //            SmtpClient client = new SmtpClient();
    //            client.Host = "relay-hosting.secureserver.net";
    //            client.Port = 25;
    //            client.UseDefaultCredentials = false;
    //            client.Credentials = new System.Net.NetworkCredential("info@milknberries.com", "computer1@");
    //            //Send the msgs  
    //            client.Send(msgs);
    //            //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Verify your account via email');", true);
    //        }
    //        catch (Exception ex)
    //        {
    //            lblMsg.Text = "sentMail() : " + ex;
    //        }
    //    }


}