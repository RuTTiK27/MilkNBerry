using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //LinkButton lbContact = (LinkButton)Master.FindControl("lbContact");
        //lbContact.Style.Add(HtmlTextWriterStyle.Color, "#FFF");
        
        successMessage.Attributes.Add("class", "alert alert-success d-flex align-items-center d-none");
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERTMESSAGE", con);
        
        con.Open();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("NAME", txtName.Text);
            cmd.Parameters.AddWithValue("EMAIL", txtEmail.Text);
            cmd.Parameters.AddWithValue("PHONE", txtPhone.Text);
            cmd.Parameters.AddWithValue("MESSAGE", txtMessage.Text);
            cmd.Parameters.AddWithValue("ISACTIVE", 0);
            cmd.Parameters.AddWithValue("RESPONSE", "");

            cmd.ExecuteNonQuery();
            successMessage.Attributes.Remove("class");
            successMessage.Attributes.Add("class", "alert alert-success d-flex align-items-center");

            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtMessage.Text = "";

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Submit Message : " + ex;
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
}