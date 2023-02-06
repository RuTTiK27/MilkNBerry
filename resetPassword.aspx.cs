using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
public partial class resetPassword : System.Web.UI.Page
{
    
    private void updatePin() {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string pin = CommonFunctions.GetRandomCode1(6);
            string strSql = "UPDATE LOGIN SET PIN = "+ pin + " WHERE EMAIL ='" + Request.QueryString["email"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
            sentMail(pin);
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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            newPasswordPanel.Visible = false;
            otpVerifyPanel.Visible = true;
            updatePin();
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
            string query = "SELECT PIN FROM LOGIN WHERE EMAIL = '" + Request.QueryString["email"].ToString() + "';";
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
                otpVerifyPanel.Visible = false;
                newPasswordPanel.Visible = true;
            }
            else
            {
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

    private void updatePassword()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            string strSql = "UPDATE LOGIN SET PASSWORD = '" + newPassowrd.Text + "' WHERE EMAIL ='" + Request.QueryString["email"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "updatePassword() " + ex.Message;
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

    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {
        updatePassword();
        Response.Redirect("~/account.aspx", true);
    }


    protected void btnResend_Click(object sender, EventArgs e)
    {
        updatePin();
        lblMsg.Text = "New Pin sent to your email!";
        lblMsg.ForeColor = System.Drawing.Color.Orange;
    }
    private void sentMail(string pin)
    {
        try
        {
            MailMessage msgs = new MailMessage();
            msgs.To.Add(Request.QueryString["email"].ToString());//registerEmail.Text.Trim()
            MailAddress address = new MailAddress("info@milknberries.com");
            msgs.From = address;
            msgs.Subject = "Your PIN";
            string htmlBody = @"<div style='font - family: Helvetica,Arial,sans - serif; min - width:1000px; overflow: auto; line - height:2'>
  <div style='margin:50px auto;width:70%;padding:20px 0'>
    <div style='border-bottom:1px solid #eee'>
      <a href='milknberries.com' style='font-size:1.4em;color: #000;text-decoration:none;font-weight:600'> Milk And Berries </a>
    </div>
    <p style ='font-size:1.1em'> Hi,</p>
    <p> Use the following OTP to complete your forgot password procedures.</p>
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
