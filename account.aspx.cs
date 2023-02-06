using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
        lblForForgorPassword.Style.Remove("display");
        lblForForgorPassword.Style.Add("display", "none");

        if (Session["email"] != null)
        {
            if (Session["email"].ToString() != "")
            {
                panelBeforeLogin.Visible = false;
                panelAfterLogin.Visible = true;
                //lblFirstName.Text = Session["firstName"].ToString();
                //lblLastName.Text = Session["lastName"].ToString();
                lblEmail.Text = Session["email"].ToString();
                lblFullName.Text = Session["firstName"].ToString() + " " + Session["lastName"].ToString();
                //lblBalance.Text = "Balance: ₹" + Session["balance"].ToString();
                updatedBalance();
            }
        }
        else
        {
            if (Request.QueryString["fromRegister"] != null)
            {
                if (Request.QueryString["fromRegister"] == "Y")
                {
                    setCustomer(Request.QueryString["email"].ToString());
                    Response.Redirect("index.aspx", true);
                }

            }
            panelAfterLogin.Visible = false;
            panelBeforeLogin.Visible = true;
        }
    }
    private void updatedBalance()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string setWalletBalanceQuery = "SELECT BALANCE FROM CUSTOMERS WHERE EMAIL = '" + Session["email"].ToString() + "';";
            cmd = new SqlCommand(setWalletBalanceQuery, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["balance"] = dr["BALANCE"].ToString();
                lblBalance.Text = Session["balance"].ToString();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "updatedBalance() : " + ex;
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
    }
    private void setCustomer(String email)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            Session["email"] = email;
            string setCustomerQuery = "SELECT EMAIL,FIRSTNAME,LASTNAME,BALANCE FROM CUSTOMERS WHERE EMAIL = '" + email + "';";
            cmd = new SqlCommand(setCustomerQuery, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["firstName"] = dr["FIRSTNAME"].ToString();
                Session["lastName"] = dr["LASTNAME"].ToString();
                Session["balance"] = dr["BALANCE"].ToString();

                //lblFirstName.Text = Session["firstName"].ToString();
                //lblLastName.Text = Session["lastName"].ToString();
                lblEmail.Text = Session["email"].ToString();
                lblFullName.Text = Session["firstName"].ToString() + " " + Session["lastName"].ToString();
                lblBalance.Text = Session["balance"].ToString();

                LinkButton lbAccount = (LinkButton)Master.FindControl("lbAccount");
                lbAccount.Text = Server.HtmlDecode("<i class='fal fa-user'></i> " + dr["FIRSTNAME"].ToString());

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "setCustomer() : " + ex;
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
    }

    //REGISTRATION PART STARTS HERE
    private int checkEmailAlreadyExist()
    {
        int emailcount = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            string strSql = "SELECT COUNT(*) FROM LOGIN where EMAIL = '" + registerEmail.Text.Replace("'", "''") + "'";

            cmd = new SqlCommand(strSql, con);
            con.Open();

            object obj = cmd.ExecuteScalar();

            if (Convert.ToInt32(obj) > 0)
            {
                emailcount = Convert.ToInt32(obj);
            }
        }

        catch (Exception ex)
        {
            lblMsg.Text = "checkEmailAlreadyExist() " + ex.Message;
        }
        finally
        {
            cmd.Dispose();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        return emailcount;
    }
    string pin = CommonFunctions.GetRandomCode1(6);
    private void registerCustomer()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERTUSER", con);
        SqlCommand cmd2 = new SqlCommand("INSERTCUSTOMER", con);
        try
        {
            con.Open();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd2.CommandType = CommandType.StoredProcedure;
            if (checkEmailAlreadyExist() > 0)
            {
                alreadyExistEmail.Style.Remove("display");
                alreadyExistEmail.Style.Add("display", "block");
            }
            else
            {
                cmd.Parameters.AddWithValue("EMAIL", registerEmail.Text);
                cmd.Parameters.AddWithValue("PASSWORD", registerPassword.Text);
                cmd.Parameters.AddWithValue("PIN", pin);
                cmd.Parameters.AddWithValue("ISVERIFIED", "N");
                cmd.Parameters.AddWithValue("PERMANENTBAN", "N");



                cmd2.Parameters.AddWithValue("EMAIL", registerEmail.Text);
                cmd2.Parameters.AddWithValue("FIRSTNAME ", firstName.Text);
                cmd2.Parameters.AddWithValue("LASTNAME ", lastName.Text);
                cmd2.Parameters.AddWithValue("BALANCE ", 0);
                cmd2.Parameters.AddWithValue("CUSTOMERTYPE ", 0);
                int rowaffected = cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                if (rowaffected > 0)
                {
                    sentMail();
                    Response.Redirect("~/verifyOTP.aspx?email=" + registerEmail.Text, true);
                }
                else
                {
                    lblMsg.Text = "Something went wrong";
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "registerCustomer() : " + ex.Message;
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

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        registerCustomer();
    }

    private void loginCustomer()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string loginQuery = "SELECT EMAIL,PASSWORD,ISVERIFIED,PERMANENTBAN FROM LOGIN WHERE EMAIL = '" + txtLoginEmail.Text + "';";
            cmd = new SqlCommand(loginQuery, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                string email = dr["EMAIL"].ToString();
                string password = dr["PASSWORD"].ToString();
                string isverified = dr["ISVERIFIED"].ToString();
                string permanentBan = dr["PERMANENTBAN"].ToString();
                if (email == txtLoginEmail.Text && password == txtLoginPassword.Text)
                {
                    if (isverified == "Y")
                    {
                        if (permanentBan == "N")
                        {
                            setCustomer(txtLoginEmail.Text);
                            panelBeforeLogin.Visible = false;
                            panelAfterLogin.Visible = true;
                            Response.Redirect("index.aspx", true);
                        }
                        else
                        {
                            permenentBan.Style.Remove("display");
                            permenentBan.Style.Add("display", "block");
                        }

                    }
                    else
                    {
                        Response.Redirect("~/verifyOTP.aspx?email=" + txtLoginEmail.Text, true);
                    }
                }
                else
                {
                    wrongEmailOrPassword.Style.Remove("display");
                    wrongEmailOrPassword.Style.Add("display", "block");
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "loginCustomer() : " + ex;
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
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        loginCustomer();
    }

    protected void btnForgotPassword_Click(object sender, EventArgs e)
    {
        if (txtLoginEmail.Text != "")
        {
            Response.Redirect("~/resetPassword.aspx?email=" + txtLoginEmail.Text, true);
        }
        else
        {
            lblForForgorPassword.Style.Remove("display");
            lblForForgorPassword.Style.Add("display", "block");
        }

    }

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/resetPassword.aspx?email=" + txtLoginEmail.Text, true);
    }

    protected void btnOrders_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/orders.aspx", true);
    }

    protected void btnCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/cart.aspx", true);
    }

    protected void btnSignOut_Click1(object sender, EventArgs e)
    {
        Session.Abandon();
        panelAfterLogin.Visible = false;
        panelBeforeLogin.Visible = true;

        LinkButton lbAccount = (LinkButton)Master.FindControl("lbAccount");
        lbAccount.Text = Server.HtmlDecode("<i class='fal fa-user'></i> Login");
    }

    private void sentMail()
    {
        try
        {
            MailMessage msgs = new MailMessage();
            msgs.To.Add(registerEmail.Text.Trim());//"rutvikpandya00@gmail.com"
            MailAddress address = new MailAddress("info@milknberries.com");
            msgs.From = address;
            msgs.Subject = "Your PIN";
            string htmlBody = @"<div style='font - family: Helvetica,Arial,sans - serif; min - width:1000px; overflow: auto; line - height:2'>
  <div style='margin:50px auto;width:70%;padding:20px 0'>
    <div style='border-bottom:1px solid #eee'>
      <a href='milknberries.com' style='font-size:1.4em;color: #000;text-decoration:none;font-weight:600'> Milk And Berries </a>
    </div>
    <p style ='font-size:1.1em'> Hi,</p>
    <p> Thank you for choosing Milk And Berries.Use the following OTP to complete your Sign Up procedures.</p>
    <h2 style='background: #000;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;'>" + pin + "</h2>" +
    "<p style = 'font-size:0.9em;'> Regards,<br/> Milkn And Berries </p> <hr style='border:none;border-top:1px solid #eee'/> <div style= 'float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300'> </div></div></div> ";
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