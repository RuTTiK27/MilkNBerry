using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //
        if (!Page.IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();

            try
            {
                string strSql = "SELECT[ORDERID], CONVERT(VARCHAR(11), [DELIVERYDATE], 106) AS DELIVERYDATE, [ORDERSTATUS] FROM[ORDERMASTER] WHERE [CUSTOMEREMAIL] = '"+ Session["email"].ToString() + "' AND ORDERSTATUS!='0' ORDER BY ORDERMASTER.ID DESC";
                cmd = new SqlCommand(strSql, con);
                da.SelectCommand = cmd;
                da.Fill(ds);
                lv.DataSource = ds;
                lv.DataBind();
                //lvShops = "No Shop is there!";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Page load :  " + ex.Message;
            }
            finally
            {
                cmd.Dispose();
                da.Dispose();
                ds.Dispose();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }

    protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label mylabel, firstStart, secondStar, thirdStar, fourthStar;
        mylabel = (Label)e.Item.FindControl("orderStatus");

        firstStart = (Label)e.Item.FindControl("Label1");
        secondStar = (Label)e.Item.FindControl("Label2");
        thirdStar = (Label)e.Item.FindControl("Label3");
        fourthStar = (Label)e.Item.FindControl("Label4");

        int star = Convert.ToInt32(mylabel.Text);
        if (star == 1)
        {
            firstStart.CssClass = "active step0";
            secondStar.CssClass = "step0";
            thirdStar.CssClass = "step0";
            fourthStar.CssClass = "step0";
        }

        if (star == 2)
        {
            firstStart.CssClass = "active step0";
            secondStar.CssClass = "active step0";
            thirdStar.CssClass = "step0";
            fourthStar.CssClass = "step0";
        }

        if (star == 3)
        {
            firstStart.CssClass = "active step0";
            secondStar.CssClass = "active step0";
            thirdStar.CssClass = "active step0";
            fourthStar.CssClass = "step0";
        }

        if (star == 4)
        {
            firstStart.CssClass = "active step0";
            secondStar.CssClass = "active step0";
            thirdStar.CssClass = "active step0";
            fourthStar.CssClass = "active step0";
        }

    }

    protected void btnViewOrder_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string argument = btn.CommandArgument;
        //lblMsg.Text = argument;

        Response.Redirect("~/orderDetail.aspx?orderId="+argument, true);
    }
}