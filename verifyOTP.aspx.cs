using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class verifyOTP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    private void updatePin()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        string pin = CommonFunctions.GetRandomCode1(6);

        try
        {
            string strSql = "UPDATE LOGIN SET PIN = " + pin + " WHERE EMAIL ='" + Request.QueryString["email"].ToString() + "' ";
            cmd = new SqlCommand(strSql, con);
            con.Open();
            cmd.ExecuteReader();
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
            string strSql = "UPDATE LOGIN SET ISVERIFIED = 'Y' WHERE EMAIL ='" + Request.QueryString["email"].ToString() + "' ";
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

    private void verfy() {
        string userPIN = TextBox1.Text + TextBox2.Text + TextBox3.Text + TextBox4.Text + TextBox5.Text + TextBox6.Text;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        try
        {
            string query = "SELECT PIN FROM LOGIN WHERE EMAIL = '"+ Request.QueryString["email"].ToString() +"';";
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
                Response.Redirect("~/account.aspx?fromRegister=Y&email=" + Request.QueryString["email"].ToString() + "", true);
                
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
        finally {
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
}