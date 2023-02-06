using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Razorpay.Api;
using Newtonsoft.Json;
using System.Web.Services;
using System.Net.Mail;
using System.IO;
using System.Net;
using System.Drawing;

public partial class cart : System.Web.UI.Page
{
    //RazorPay 
    private const string _key = "rzp_live_XL0qcIunqqi42p"; //"rzp_test_9ktChaJqqOjpba"; //"rzp_live_XL0qcIunqqi42p";
    private const string _secret = "J8AzKuwMiLZ3iMCcb9RZTQ3e"; //"Dlr0pWlsamAVSaFE4IujBo7H";//"J8AzKuwMiLZ3iMCcb9RZTQ3e";


    //Variables
    int deliveryChargeAmount = 0;
    double percentage = 0;
    string cartId = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        whichPaymentGateway();
        if (!Page.IsPostBack)
        {
            Session["allItemsTotal"] = 0;
            Session["subTotal"] = 0;
            Session["grandTotal"] = 0;
            Session["deliveryChargeAmount"] = 0;

            Session["walletDiscountAmount"] = 0;
            Session["walletBalance"] = 0;
            Session["walletMaxredeemableAmount"] = 0;
            Session["walletDiscountValid"] = "No";

            Session["varCashbackCode"] = "-";
            Session["varCashbackAmount"] = 0;

            Session["varPromocodeName"] = "-";
            Session["varFinalPromocodeAmount"] = 0;
            Session["varPromocodePercentage"] = 0;
            
        }

        panelZeroProducts.Visible = false;
        panelBeforeLogin.Visible = false;
        panelAfterLogin.Visible = false;
        panelForPayment.Visible = false;
        panelForAuthentication.Visible = false;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        if (Session["email"] != null)
        {
            if (Session["email"].ToString() != "")
            {
                forPromoCode.Attributes.Add("class", "list-group-item d-flex justify-content-between lh-sm d-none");
                forDeliveryCharge.Attributes.Add("class", "list-group-item d-flex justify-content-between lh-sm  d-none");
                forCashbackDiscount.Attributes.Add("class", "list-group-item d-flex justify-content-between lh-sm d-none");

                deliveryChargeAmount = 0;

                try
                {

                    //For Cart Items Count
                    SqlCommand cmd2 = new SqlCommand(); //For Cart Items Count
                    string strSql2 = "SELECT COUNT(*) FROM [CART] WHERE [CUSTOMEREMAIL] = '" + Session["email"].ToString() + "' "; //For Cart Items Count

                    con.Open();
                    cmd2 = new SqlCommand(strSql2, con);
                    object obj = cmd2.ExecuteScalar();
                    totalProducts.Text = Convert.ToDouble(obj).ToString();
                    Session["totalProducts"] = totalProducts.Text;
                    con.Close();
                    if (Convert.ToInt32(totalProducts.Text) <= 0)
                    {
                        panelForPayment.Visible = false;
                        panelAfterLogin.Visible = false;
                        panelBeforeLogin.Visible = false;
                        panelZeroProducts.Visible = true;
                        panelForAuthentication.Visible = false;
                    }
                    else
                    {
                        panelZeroProducts.Visible = false;
                        panelBeforeLogin.Visible = false;
                        panelForPayment.Visible = false;
                        panelAfterLogin.Visible = true;
                        panelForAuthentication.Visible = false;
                    }

                    //For loading cart products
                    SqlCommand cmd = new SqlCommand();
                    string strSql = "SELECT CART.ID,CART.CARTID,CART.PRODUCTNO,NAME,TITLE,CART.PRICE,QTY,SUBTOTAL,PRODUCTS.PRICE AS MRP,DISCOUNTPERCENTAGE FROM CART inner join PRODUCTS ON CART.PRODUCTNO = PRODUCTS.PRODUCTNO WHERE CUSTOMEREMAIL = '" + Session["email"].ToString() + "' ORDER BY ID"; //For loading cart products
                    cmd = new SqlCommand(strSql, con);

                    SqlDataAdapter da = new SqlDataAdapter();
                    DataSet ds = new DataSet();

                    da.SelectCommand = cmd;
                    da.Fill(ds);
                    lv.DataSource = ds;
                    lv.DataBind();



                    //For loading Promo Codes
                    SqlCommand cmd3 = new SqlCommand(); //For Promo Codes
                    string strSql3 = "SELECT * FROM [PROMOCODES] WHERE ISACTIVE = 1"; //For Promo Codes

                    cmd3 = new SqlCommand(strSql3, con);
                    SqlDataAdapter da2 = new SqlDataAdapter(); //For Promo Codes
                    DataSet ds2 = new DataSet(); //For Promo Codes

                    da2.SelectCommand = cmd3;
                    da2.Fill(ds2);
                    lvForPromocodes.DataSource = ds2;
                    lvForPromocodes.DataBind();


                    //For ALL ITEM SUBTOTAL AND TOTALMRP AND TOTAL DISCOUNT
                    SqlCommand cmd4 = new SqlCommand();
                    SqlDataReader dr = null;
                    string strSql4 = "SELECT SUM(SUBTOTAL) AS ALLITEMSUBTOTAL,SUM(TOTALMRP) AS TOTALMRP, SUM(TOTALDISCOUNT) AS TOTALDISCOUNT FROM CART WHERE CUSTOMEREMAIL = '" + Session["email"].ToString() + "'"; //For ALL ITEM SUBTOTAL
                    cmd4 = new SqlCommand(strSql4, con);
                    con.Open();

                    dr = cmd4.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        Session["allItemsTotal"] = dr["ALLITEMSUBTOTAL"].ToString();
                        Session["walletMaxredeemableAmount"] = dr["ALLITEMSUBTOTAL"].ToString();
                        lblMaxRedeemableAmount.Text = "Max redeemable for this transaction is: ₹" + Session["allItemsTotal"].ToString();
                        lblTotal.Text = dr["ALLITEMSUBTOTAL"].ToString();
                        lblSubTotal.Text = dr["TOTALMRP"].ToString();
                        lblFlatDiscount.Text = dr["TOTALDISCOUNT"].ToString();
                        lblFinalPayment.Text = dr["ALLITEMSUBTOTAL"].ToString();
                    }
                    dr.Close();
                    cmd4.Dispose();
                    con.Close();


                    //For Customer Details
                    SqlCommand cmd6 = new SqlCommand(); //For CUSTOMER DETAILS
                    string strSql6 = "SELECT FIRSTNAME,LASTNAME,EMAIL,BALANCE FROM [CUSTOMERS] WHERE EMAIL = '" + Session["email"].ToString() + "'"; //FOR CUSTOMER DETAILS

                    SqlDataReader dr2 = null; //For CUSTOMER DETAILS

                    con.Open();
                    cmd6 = new SqlCommand(strSql6, con);
                    dr2 = cmd6.ExecuteReader();
                    if (dr2.HasRows)
                    {
                        dr2.Read();
                        firstName.Text = dr2["FIRSTNAME"].ToString();
                        lastName.Text = dr2["LASTNAME"].ToString();
                        email.Text = dr2["EMAIL"].ToString();
                        lblWalletBalance.Text = "Wallet Balance: ₹" + dr2["BALANCE"].ToString();
                        Session["walletBalance"] = dr2["BALANCE"].ToString();
                    }
                    dr2.Close();
                    cmd6.Dispose();
                    con.Close();

                }
                catch (Exception ex)
                {
                    if (ex.Message.ToString() == "Object cannot be cast from DBNull to other types.")
                    {

                    }
                    else
                    {
                        lblMsg.Text = "When loading :  " + ex.Message;
                    }

                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                }

                //---
                //FOR CartId
                SqlCommand cmdCart = new SqlCommand(); //For Cartid
                string strSqlCart = "SELECT [CARTID] FROM [CART] WHERE CUSTOMEREMAIL = '" + Session["email"].ToString() + "'";
                SqlDataReader drCart = null;
                con.Open();
                cmdCart = new SqlCommand(strSqlCart, con);
                drCart = cmdCart.ExecuteReader();
                if (drCart.HasRows)
                {
                    drCart.Read();
                    cartId = drCart["CARTID"].ToString();
                    Session["cartId"] = drCart["CARTID"].ToString();
                }
                drCart.Close();
                cmdCart.Dispose();
                con.Close();
                //---

            }
        }
        else
        {
            panelZeroProducts.Visible = false;
            panelForPayment.Visible = false;
            panelAfterLogin.Visible = false;
            panelBeforeLogin.Visible = true;
            panelForAuthentication.Visible = false;
        }


    }
    protected void btnRemoveIcon_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string argument = btn.CommandArgument;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();
        string strSql = "DELETE FROM CART WHERE PRODUCTNO = '" + argument + "' AND CUSTOMEREMAIL = '" + Session["email"].ToString() + "'";

        con.Open();
        cmd = new SqlCommand(strSql, con);
        object obj = cmd.ExecuteScalar();
        con.Close();
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }

    private int deliveryCharge(string state)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand();

        string strSql = "SELECT CHARGE FROM [DELIVERYCHARGE] WHERE [STATE] = '" + state + "' AND ISACTIVE = 1";

        con.Open();
        cmd = new SqlCommand(strSql, con);
        object obj = cmd.ExecuteScalar();
        deliveryChargeAmount = Convert.ToInt32(obj);
        con.Close();

        return deliveryChargeAmount;
    }

    private void updateGrandTotal()
    {
        /*
            As the name suggest this method will update the grand total.
            But that is not all this method also enable and disable the panels of

            1> Promocode
            2> Cash Discount(Wallet Discount)
            3> Delivery charge
            
            Now, for what reason i am doing that means updating this or enable and disable this
            because when applying promocode or applying wallet balance or changing state then the panels
            automatically disable so for enabling all three things i have to write code three times but for
            avoid that ihave created this method.
        */

        //subTotal = (allItemsTotal - cashbackDiscount);
        //grandTotal = ((subtotal - PromocodeAmount) + Delivery Charge);

        Session["grandTotal"] = Convert.ToDouble(Session["allItemsTotal"].ToString()) + Convert.ToDouble(Session["deliveryChargeAmount"].ToString());

        if (Session["walletDiscountValid"].ToString() == "Yes")
        {
            forCashbackDiscount.Attributes.Add("class", "list-group-item d-flex justify-content-between lh-sm");
            Session["grandTotal"] = ((Convert.ToDouble(Session["allItemsTotal"].ToString()) - Convert.ToDouble(Session["walletDiscountAmount"].ToString())) + Convert.ToDouble(Session["deliveryChargeAmount"].ToString()));

            lblCashbackDiscountAmount.Text = Session["walletDiscountAmount"].ToString();
            promocodeAmount.Text = Session["varFinalPromocodeAmount"].ToString();
            lblTotal.Text = Session["grandTotal"].ToString();
            lblFinalPayment.Text = Session["grandTotal"].ToString();

        }
        if (Convert.ToDouble(Session["varFinalPromocodeAmount"].ToString()) != 0)
        {
            forPromoCode.Attributes.Add("class", "list-group-item d-flex justify-content-between lh-sm");
            if (Convert.ToDouble(Session["subTotal"].ToString()) == 0)
            {
                Session["grandTotal"] = ((Convert.ToDouble(Session["allItemsTotal"].ToString()) - Convert.ToDouble(Session["varFinalPromocodeAmount"].ToString())) + Convert.ToDouble(Session["deliveryChargeAmount"].ToString()));
            }
            else
            {
                Session["grandTotal"] = ((Convert.ToDouble(Session["subTotal"].ToString()) - Convert.ToDouble(Session["varFinalPromocodeAmount"].ToString())) + Convert.ToDouble(Session["deliveryChargeAmount"].ToString()));
            }
            lblTotal.Text = Session["grandTotal"].ToString();
            lblFinalPayment.Text = Session["grandTotal"].ToString();
        }
        if (Convert.ToDouble(Session["deliveryChargeAmount"].ToString()) != 0)
        {
            forDeliveryCharge.Attributes.Add("class", "list-group-item d-flex justify-content-between lh-sm");
            lblDeliveryCharge.Text = Session["deliveryChargeAmount"].ToString();
            lblTotal.Text = Session["grandTotal"].ToString();
            lblFinalPayment.Text = Session["grandTotal"].ToString();
        }

    }

    public void MyBtnHandler(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string[] arguments = btn.CommandArgument.ToString().Split(',');

        percentage = Convert.ToDouble(arguments[0]);
        double minamount = Convert.ToDouble(arguments[2]);

        if (minamount <= Convert.ToDouble(Session["allItemsTotal"].ToString()))
        {
            Session["varPromocodePercentage"] = Convert.ToDouble(arguments[0]);
            if (Convert.ToDouble(Session["subTotal"].ToString()) == 0)
            {
                Session["varFinalPromocodeAmount"] = ((Convert.ToDouble(Session["allItemsTotal"].ToString()) * percentage) / 100);
            }
            else
            {
                Session["varFinalPromocodeAmount"] = ((Convert.ToDouble(Session["subTotal"].ToString().ToString()) * percentage) / 100);
            }

            promocodeAmount.Text = Session["varFinalPromocodeAmount"].ToString();
            promocodeName.Text = arguments[1].ToString();
            Session["varPromocodeName"] = arguments[1].ToString();

            updateGrandTotal();
            txtCashback.Enabled = false;
            btnCashback.Enabled = false;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction(" + minamount + ")", true);
        }



        //lblMsg.Text = arguments[0].ToString() + " " + arguments[1].ToString();
    }

    protected void State_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (State.SelectedValue.ToString() == "Select")
        {
            lblForNotSelectedState.Text = "Please select State";
            Session["deliveryChargeAmount"] = 0;
        }
        else
        {
            deliveryChargeAmount = deliveryCharge(State.SelectedValue.ToString());
            Session["deliveryChargeAmount"] = deliveryChargeAmount;

            updateGrandTotal();
            lblTotal.Text = Session["grandTotal"].ToString();
            lblFinalPayment.Text = Session["grandTotal"].ToString();
            lblForNotSelectedState.Text = "";
        }
        if (Session["varCashbackAmount"].ToString() != "0")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "disableListView(" + lvForPromocodes.Items.Count.ToString() + ")", true);
        }
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (State.SelectedValue.ToString() == "Select")
            {
                lblForNotSelectedState.Text = "Please select State";
            }
            else
            {
                Session["txtPhone"] = txtPhone.Text;
                Session["txtAddress"] = txtAddress.Text;
                Session["State_SelectedValue"] = State.SelectedValue.ToString();
                Session["city"] = city.Text;
                Session["pincode"] = pincode.Text;
                panelZeroProducts.Visible = false;
                panelBeforeLogin.Visible = false;
                panelAfterLogin.Visible = false;
                //panelForAuthentication.Visible = true;
                panelForPayment.Visible = true;
                //updatePin();

            }
        }
    }

    protected void btnCashback_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT * FROM CASHBACK where CASHBACKCODE = '" + txtCashback.Text + "' AND ISACTIVE = 1";

            con.Open();

            cmd = new SqlCommand(strSql, con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["varCashbackCode"] = dr["CASHBACKCODE"].ToString();
                Session["varCashbackAmount"] = Convert.ToDouble(dr["CASHBACKAMOUNT"].ToString());
                lblCashbackIsValidOrNot.Text = "✔ Cashback code is applied ";
                lblCashbackIsValidOrNot.ForeColor = System.Drawing.Color.Green;
                cashbackToolTip.Attributes.Add("data-bs-toggle", "tooltip");
                cashbackToolTip.Attributes.Add("data-bs-placement", "right");
                cashbackToolTip.Attributes.Add("title", "Cashback amount will added in your wallet");
                cashbackToolTip.Attributes.Add("class", "text-success far fa-info-circle");


                lvForPromocodes.Enabled = false;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "disableListView(" + lvForPromocodes.Items.Count.ToString() + ")", true);
            }
            else
            {
                lblCashbackIsValidOrNot.Text = "❌ Invalid cashback code ";
                lblCashbackIsValidOrNot.ForeColor = System.Drawing.Color.Red;
            }
            updateGrandTotal();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "cashbackCode : " + ex.Message;
        }
        finally
        {
            dr.Dispose();
            cmd.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        Session["walletDiscountAmount"] = txtWallet.Text;

        if (Convert.ToDouble(Session["walletDiscountAmount"].ToString()) <= Convert.ToDouble(Session["walletBalance"].ToString()))
        {
            if (Convert.ToDouble(Session["walletDiscountAmount"].ToString()) <= Convert.ToDouble(Session["walletMaxredeemableAmount"].ToString()))
            {
                lblWallet.Text = "✔ Cashback is applied";
                lblWallet.ForeColor = System.Drawing.Color.Green;
                Session["walletDiscountValid"] = "Yes";

                Session["subTotal"] = Convert.ToDouble(Session["allItemsTotal"].ToString()) - Convert.ToDouble(Session["walletDiscountAmount"].ToString());

                if (Convert.ToDouble(Session["varFinalPromocodeAmount"].ToString()) != 0)
                {

                    if (Convert.ToDouble(Session["subTotal"].ToString()) == 0)
                    {
                        Session["varFinalPromocodeAmount"] = ((Convert.ToDouble(Session["allItemsTotal"].ToString()) * Convert.ToDouble(Session["varPromocodePercentage"].ToString())) / 100);
                    }
                    else
                    {
                        Session["varFinalPromocodeAmount"] = ((Convert.ToDouble(Session["subTotal"].ToString().ToString()) * Convert.ToDouble(Session["varPromocodePercentage"].ToString())) / 100);
                    }
                }
                updateGrandTotal();
            }
            else
            {
                lblWallet.Text = "❌ Amount is greater then Max Redeemable Amount";
                lblWallet.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblWallet.Text = "❌ Amount is greater then wallet balance";
            lblWallet.ForeColor = System.Drawing.Color.Red;
        }
    }


    //------------------------------------------------------
    //protected void btnPaymentReceived_Click(object sender, EventArgs e)
    //{
    //    orderMaster();//razorpay_order_id, razorpay_payment_id
    //    orderAddress();
    //    orderProducts();
    //    deleteFromCart();
    //    if (Convert.ToDouble(Session["varCashbackAmount"].ToString()) != 0)
    //    {
    //        increaseWalletBalance();
    //    }
    //    if (Session["walletDiscountValid"].ToString() == "Yes")
    //    {
    //        decreaseWalletBalance();
    //    }

    //    Response.Redirect("orderPlacedSuccess.aspx?orderId=" + cartId.ToString() + "&totalDiscount=" + (Convert.ToDouble(Session["varFinalPromocodeAmount"].ToString()) + Convert.ToDouble(Session["walletDiscountAmount"].ToString())), true);
    //}
    //------------------------------------------------------

    //protected void btnPaymentFaild_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("orderFailed.aspx", true);
    //}
    //------------------------------------------------------

    private void updatePin()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        string pin = CommonFunctions.GetRandomCode1(6);

        try
        {
            string strSql = "UPDATE LOGIN SET PIN = " + pin + " WHERE EMAIL ='" + Session["email"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            sentMailForPin(pin);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "updatePin() " + ex.Message;
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
    private void UpdateVerifyStatus()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE LOGIN SET ISVERIFIED = 'Y' WHERE EMAIL ='" + Session["email"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "UpdateVerifyStatus() " + ex.Message;
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

    private void verfy()
    {
        string userPIN = TextBox1.Text + TextBox2.Text + TextBox3.Text + TextBox4.Text + TextBox5.Text + TextBox6.Text;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            string query = "SELECT PIN FROM LOGIN WHERE EMAIL = '" + Session["email"].ToString() + "';";
            cmd = new SqlCommand(query, con);
            con.Open();
            dr = cmd.ExecuteReader();
            string pin = "";
            if (dr.HasRows)
            {
                dr.Read();
                pin = dr["PIN"].ToString();
            }
            if (userPIN == pin)
            {
                UpdateVerifyStatus();
                panelZeroProducts.Visible = false;
                panelBeforeLogin.Visible = false;
                panelAfterLogin.Visible = false;
                panelForAuthentication.Visible = false;
                panelForPayment.Visible = true;
                lblMsg.Text = "";
            }
            else
            {
                panelZeroProducts.Visible = false;
                panelBeforeLogin.Visible = false;
                panelAfterLogin.Visible = false;
                panelForAuthentication.Visible = true;
                panelForPayment.Visible = false;
                lblMsg.Text = "Entered OTP was wrong!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "verfy() " + ex.Message;
            throw;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd.Dispose();
            dr.Close();
        }
    }
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        verfy();
    }

    protected void resendButton_Click(object sender, EventArgs e)
    {
        updatePin();
        lblMsg.Text = "New PIN successfully sent to your account!";
        lblMsg.ForeColor = System.Drawing.Color.Orange;
    }
    private void sentMailForPin(string pin)
    {
        try
        {
            MailMessage msgs = new MailMessage();
            msgs.To.Add(Session["email"].ToString().Trim());
            MailAddress address = new MailAddress("info@milknberries.com");
            msgs.From = address;
            msgs.Subject = "Your PIN";
            string htmlBody = @"<div style='font - family: Helvetica,Arial,sans - serif; min - width:1000px; overflow: auto; line - height:2'>
                                <div style='margin:50px auto;width:70%;padding:20px 0'>
                                <div style='border-bottom:1px solid #eee'>
                                <a href='milknberries.com' style='font-size:1.4em;color: #000;text-decoration:none;font-weight:600'> Milk And Berries </a>
                                </div>
                                <p style ='font-size:1.1em'> Hi,</p>
                                <p> Thank you for choosing Milk And Berries.Use the following OTP to complete your Order process.</p>
                                <h2 style='background: #000;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;'>" + pin + "</h2>" +
                                "<p style = 'font-size:0.9em;'> Regards,<br/> Milkn And Berries </p> <hr style='border:none;border-top:1px solid #eee'/> <div style= 'float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300'> </div></div></div> ";
            msgs.Body = htmlBody;
            msgs.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("info@milknberries.com", "computer1@");
            //Send the msgs  
            client.Send(msgs);
            //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Verify your account via email');", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "sentMail() : " + ex;
        }
    }
    private void removeSessions()
    {
        Session.Remove("allItemsTotal");
        Session.Remove("subTotal");
        //Session.Remove("grandTotal");
        Session.Remove("deliveryChargeAmount");

        //Session.Remove("walletDiscountAmount");
        Session.Remove("walletBalance");
        Session.Remove("walletMaxredeemableAmount");
        Session.Remove("walletDiscountValid");

        Session.Remove("varCashbackCode");
        //Session.Remove("varCashbackAmount");

        Session.Remove("varPromocodeName");
        Session.Remove("varFinalPromocodeAmount");
        Session.Remove("varPromocodePercentage");

        Session.Remove("totalProducts");

        Session.Remove("txtPhone");
        Session.Remove("txtAddress");
        Session.Remove("State_SelectedValue");
        Session.Remove("city");
        Session.Remove("pincode");
    }
    protected void btnPayWithRazorPay_Click(object sender, EventArgs e)
    {
        //lblMsg.Text = "Order ID : " + Session["cartId"].ToString() + "<br />" + "Transaction ID : " + Request.QueryString["txnId"].ToString();
        //*Request.QueryString["razorpay_order_id"].ToString()*/, /*Request.QueryString["razorpay_payment_id"].ToString()*/,
        orderMaster();
        orderAddress();
        orderProducts();
        deleteFromCart();
        sentMailOfOrderPlaced();
        removeSessions();

        decimal amountinSubunits = Convert.ToDecimal(Session["grandTotal"].ToString()) * 100;
        string currency = "INR";
        string name = "Milknberries";
        string description = "Razorpay Payment Gateway";
        string imageLogo = "";
        string profileName = firstName.Text + " " + lastName.Text;
        string profileMobile = txtPhone.Text;
        string profileEmail = email.Text;
        Dictionary<string, string> notes = new Dictionary<string, string>()
        {
            { "note 1", "this is a payment note" }, { "note 2", "here another note, you can add max 15 notes" }
        };

        string orderId = CreateOrder(amountinSubunits, currency, notes);

        //string jsFunction = "OpenPaymentWindow('" + _key + "', '" + amountinSubunits + "', '" + currency + "', '" + name + "', '" + description + "', '" + imageLogo + "', '" + orderId + "', '" + profileName + "', '" + profileEmail + "', '" + profileMobile + "', '" + JsonConvert.SerializeObject(notes) + "')";

        //ClientScript.RegisterStartupScript(this.GetType(), "OpenPaymentWindow", jsFunction, true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "OpenPaymentWindow('" + _key + "', '" + amountinSubunits + "', '" + currency + "', '" + name + "', '" + description + "', '" + imageLogo + "', '" + orderId + "', '" + profileName + "', '" + profileEmail + "', '" + profileMobile + "', '" + JsonConvert.SerializeObject(notes) + "')", true);

    }

    private string CreateOrder(decimal amountInSubunits, string currency, Dictionary<string, string> notes)
    {
        try
        {
            int paymentCapture = 1;

            RazorpayClient client = new RazorpayClient(_key, _secret);
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amountInSubunits);
            options.Add("currency", currency);
            options.Add("payment_capture", paymentCapture);
            options.Add("notes", notes);

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            System.Net.ServicePointManager.Expect100Continue = false;

            Order orderResponse = client.Order.Create(options);
            var orderId = orderResponse.Attributes["id"].ToString();
            return orderId;
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    protected void btnPayWithPaytm_Click(object sender, EventArgs e)
    {
        //lblMsg.Text = "Order ID : " + Session["cartId"].ToString() + "<br />" + "Transaction ID : " + Request.QueryString["txnId"].ToString();
        //*Request.QueryString["razorpay_order_id"].ToString()*/, /*Request.QueryString["razorpay_payment_id"].ToString()*/,
        orderMaster();
        orderAddress();
        orderProducts();
        deleteFromCart();
        sentMailOfOrderPlaced();
        removeSessions();
        Response.Redirect("checkPaymentStatus.aspx");
        //        /* initialize a TreeMap object */
        //        Dictionary<string, string> paytmParams = new Dictionary<string, string>();

        //        /* Find your MID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
        //        paytmParams.Add("MID", "kYeQul94385220760309");

        //        /* Find your WEBSITE in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
        //        paytmParams.Add("WEBSITE", "DEFAULT");

        //        /* Find your INDUSTRY_TYPE_ID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
        //        paytmParams.Add("INDUSTRY_TYPE_ID", "Retail");

        //        /* WEB for website and WAP for Mobile-websites or App */
        //        paytmParams.Add("CHANNEL_ID", "WEB");

        //        /* Enter your unique order id */
        //        paytmParams.Add("ORDER_ID", Session["cartId"].ToString());

        //        /* unique id that belongs to your customer */
        //        paytmParams.Add("CUST_ID", Session["email"].ToString());

        //        /* customer's mobile number */
        //        paytmParams.Add("MOBILE_NO", txtPhone.Text);

        //        /* customer's email */
        //        paytmParams.Add("EMAIL", Session["email"].ToString());

        //        /**
        //        * Amount in INR that is payble by customer
        //        * this should be numeric with optionally having two decimal points
        //*/
        //        paytmParams.Add("TXN_AMOUNT", Session["grandTotal"].ToString());

        //        /* on completion of transaction, we will send you the response on this URL */
        //        paytmParams.Add("CALLBACK_URL", "https://milknberries.com/checkPaymentStatus.aspx");

        //        /**
        //        * Generate checksum for parameters we have
        //        * You can get Checksum DLL from https://developer.paytm.com/docs/checksum/
        //        * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
        //*/
        //        string checksum = paytm.CheckSum.generateCheckSum("gSDV#ugYAeeA2Zu4", paytmParams);

        //        /* for Staging */
        //        //string url = "https://securegw-stage.paytm.in/order/process";

        //        /* for Production */
        //        string url = "https://securegw.paytm.in/order/process";

        //        /* Prepare HTML Form and Submit to Paytm */
        //        string outputHtml = "";
        //        outputHtml += "<html>";
        //        outputHtml += "<head>";
        //        outputHtml += "<title>Merchant Checkout Page</title>";
        //        outputHtml += "</head>";
        //        outputHtml += "<body>";
        //        outputHtml += "<center><h1>Please do not refresh this page...</h1></center>";
        //        outputHtml += "<form method='post' action='" + url + "' name='paytm_form'>";
        //        foreach (string key in paytmParams.Keys)
        //        {
        //            outputHtml += "<input type='hidden' name='" + key + "' value='" + paytmParams[key] + "'>";
        //        }
        //        outputHtml += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
        //        outputHtml += "</form>";
        //        outputHtml += "<script type='text/javascript'>";
        //        outputHtml += "document.paytm_form.submit();";
        //        outputHtml += "</script>";
        //        outputHtml += "</body>";
        //        outputHtml += "</html>";
        //        Response.Write(outputHtml);

    }
    private void orderMaster()//string razorpay_order_id, string razorpay_payment_id,
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd2 = new SqlCommand();
        SqlDataReader dr = null;

        Session["totalGst"] = "";
        Session["withoutGstSubTotal"] = "";
        Session["totalCgst"] = "";
        Session["totalSgst"] = "";
        Session["totalIgst"] = "";

        try
        {
            string strSql2 = "select SUM(IGST*QTY) AS TOTALGST,SUM(WITHOUTGSTPRICE*QTY) AS WITHOUTGSTSUBTOTAL,SUM(CGST*QTY) AS TOTALCGST,SUM(SGST*QTY) AS TOTALSGST,SUM(IGST*QTY) AS TOTALIGST from PRODUCTS INNER JOIN CART ON CART.PRODUCTNO = PRODUCTS.PRODUCTNO WHERE CARTID = '" + Session["cartId"].ToString() + "'";

            con.Open();

            cmd2 = new SqlCommand(strSql2, con);
            dr = cmd2.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["totalGst"] = dr["TOTALGST"].ToString();
                Session["withoutGstSubTotal"] = dr["WITHOUTGSTSUBTOTAL"].ToString();
                Session["totalCgst"] = dr["TOTALCGST"].ToString();
                Session["totalSgst"] = dr["TOTALSGST"].ToString();
                Session["totalIgst"] = dr["TOTALIGST"].ToString();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "cashbackCode : " + ex.Message;
        }
        finally
        {
            dr.Dispose();
            cmd2.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        DateTime orderDate = DateTime.Now;
        DateTime deliveryDate = orderDate.AddDays(6);

        SqlCommand cmd = new SqlCommand("INSERTORDER", con);

        con.Open();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ORDERID", Session["cartId"].ToString());
            cmd.Parameters.AddWithValue("ORDERDATE", orderDate.ToString("MM/dd/yyyy H:mm:ss"));
            cmd.Parameters.AddWithValue("DELIVERYDATE", deliveryDate.ToString("dd/MMM/yyyy"));
            cmd.Parameters.AddWithValue("ORDERSTATUS", 0);
            cmd.Parameters.AddWithValue("CUSTOMEREMAIL", Session["email"].ToString());
            cmd.Parameters.AddWithValue("TOTALPRODUCTS", Convert.ToInt32(Session["totalProducts"].ToString()));

            cmd.Parameters.AddWithValue("WITHOUTGSTSUBTOTAL", Session["withoutGstSubTotal"].ToString());
            cmd.Parameters.AddWithValue("TOTALCGST", Session["totalCgst"].ToString());
            cmd.Parameters.AddWithValue("TOTALSGST", Session["totalSgst"].ToString());
            cmd.Parameters.AddWithValue("TOTALIGST", Session["totalIgst"].ToString());
            cmd.Parameters.AddWithValue("TOTALGST", Session["totalGst"].ToString());

            cmd.Parameters.AddWithValue("SUBTOTAL", Session["allItemsTotal"].ToString());

            cmd.Parameters.AddWithValue("WALLETDISCOUNT", Session["walletDiscountAmount"].ToString());

            cmd.Parameters.AddWithValue("PROMOCODEDISCOUNT", Session["varFinalPromocodeAmount"].ToString());
            cmd.Parameters.AddWithValue("PROMOCODE", Session["varPromocodeName"].ToString());

            cmd.Parameters.AddWithValue("CASHBACK", Session["varCashbackAmount"].ToString());
            cmd.Parameters.AddWithValue("CASHBACKCODE", Session["varCashbackCode"].ToString());

            cmd.Parameters.AddWithValue("DELIVERYCHARGE", Convert.ToInt32(Session["deliveryChargeAmount"]));
            cmd.Parameters.AddWithValue("GRANDTOTAL", Session["grandTotal"].ToString());
            cmd.Parameters.AddWithValue("PAYMENTMODE", 1);
            cmd.Parameters.AddWithValue("ISSEEN", 0);

            cmd.Parameters.AddWithValue("RAZORPAY_ORDERID", "-");//razorpay_order_id
            cmd.Parameters.AddWithValue("RAZORPAY_PAYMENTID", "-"); //razorpay_payment_id
            cmd.Parameters.AddWithValue("PAYTM_TRANSACTIONID", "-"); //PAYTM_TRANSACTIONID
            cmd.ExecuteNonQuery();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "orderMaster() : " + ex;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }

    public void orderAddress()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERTORDERADDRESS", con);

        con.Open();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ORDERID", Session["cartId"].ToString());
            cmd.Parameters.AddWithValue("PHONE", Session["txtPhone"].ToString());
            cmd.Parameters.AddWithValue("ADDRESS", Session["txtAddress"].ToString());
            cmd.Parameters.AddWithValue("STATE", Session["State_SelectedValue"].ToString());
            cmd.Parameters.AddWithValue("CITY", Session["city"].ToString());
            cmd.Parameters.AddWithValue("PINCODE", Session["pincode"].ToString());
            cmd.ExecuteNonQuery();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "orderAddress() : " + ex;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        finally
        {
            //if (con.State == ConnectionState.Open)
            //{
            //    con.Close();
            //}
        }
    }

    private void orderProducts()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        try
        {
            string strSql = "INSERT INTO ORDERPRODUCTS(PRODUCTNO,QTY,ORDERID) select PRODUCTNO,QTY,CARTID from cart WHERE CUSTOMEREMAIL = '" + Session["email"].ToString() + "'";
            con.Open();
            cmd = new SqlCommand(strSql, con);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "orderProducts() : " + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
    private void deleteFromCart()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        try
        {
            string strSql = "Delete from cart where CUSTOMEREMAIL = '" + Session["email"].ToString() + "'";
            con.Open();
            cmd = new SqlCommand(strSql, con);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "deleteFromCart() : " + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }

    private void whichPaymentGateway()
    {
       
            string paytmPaymentGateway = "", razorpayPaymentGateway = "", paytmIsActive = "", razorpayIsActive = "";

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr = null;
            try
            {
                string strSql = "SELECT * FROM PAYMENTGATEWAYS";
                cmd = new SqlCommand(strSql, con);
                con.Open();

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (dr["ID"].ToString() == "1")
                        {
                            paytmPaymentGateway = dr["PAYMENTGATEWAYNAME"].ToString();
                            paytmIsActive = dr["ISACTIVE"].ToString();
                        }
                        if (dr["ID"].ToString() == "2")
                        {
                            razorpayPaymentGateway = dr["PAYMENTGATEWAYNAME"].ToString();
                            razorpayIsActive = dr["ISACTIVE"].ToString();
                        }

                    }
                    //dr["ID"].ToString();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "setAnimationText() : " + ex;
            }
            finally
            {
                dr.Close();
                cmd.Dispose();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "paymentGateway('" + paytmPaymentGateway + "','" + razorpayPaymentGateway + "','" + paytmIsActive + "','" + razorpayIsActive + "')", true);

            
    }
    private void sentMailOfOrderPlaced()
    {
        try
        {
            MailMessage msgs = new MailMessage();
            msgs.To.Add(Session["email"].ToString().Trim());//registerEmail.Text.Trim()
            MailAddress address = new MailAddress("info@milknberries.com");
            msgs.From = address;
            msgs.Subject = "Order Received";
            string htmlBody = @"<div style='font - family: Helvetica,Arial,sans - serif; min - width:1000px; overflow: auto; line - height:2'>
            <div style='margin:50px auto;width:70%;padding:20px 0'>
            <div style='border-bottom:1px solid #eee'>
            <a href='milknberries.com' style='font-size:1.4em;color: #000;text-decoration:none;font-weight:600'> Milk And Berries </a>
            </div>
            <p style ='font-size:1.1em'> Hello, Your order successfully placed!</p>
            <p> Thank you for choosing Milk And Berries.Use the following link to get your invoice of this order</p>   
            <p style = 'font-size:0.9em;'> Regards,<br/> Milkn And Berries </p> <hr style='border:none;border-top:1px solid #eee'/> <div style= 'float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300'> </div></div></div> ";
            msgs.Body = htmlBody;
            msgs.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = "relay-hosting.secureserver.net";//smtpout.secureserver.net
            client.Port = 25;
            //smtpout.secureserver.net
            //client.Port = 465;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("info@milknberries.com", "computer1@");
            //Send the msgs  
            client.Send(msgs);
            //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Verify your account via email');", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "sentMail() : " + ex;
        }
    }
}
