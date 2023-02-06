using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private void itemCount()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd2 = new SqlCommand(); //For Cart Items Count
        string strSql2 = "SELECT COUNT(*) FROM [CART] WHERE [CUSTOMEREMAIL] = '" + Session["email"].ToString() + "' "; //For Cart Items Count

        con.Open();
        cmd2 = new SqlCommand(strSql2, con);
        object obj = cmd2.ExecuteScalar();
        lblCartProductsCount.Text = Convert.ToDouble(obj).ToString();
        con.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            if (Session["email"].ToString() != "")
            {
                lbAccount.Text = Server.HtmlDecode("<i class='fal fa-user'></i> "+ Session["firstName"].ToString());
                itemCount();
            }
            else
            {
                lbAccount.Text = Server.HtmlDecode("<i class='fal fa-user'></i> Login");
            }
        }
        else
        {
            lbAccount.Text = Server.HtmlDecode("<i class='fal fa-user'></i> Login");
        }
    }

    protected void imgLogo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("index.aspx", true);
    }
}
