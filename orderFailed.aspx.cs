using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderFailed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["txnId"] != null)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = null;

            try
            {
                string strSql = "UPDATE ORDERMASTER SET PAYTM_TRANSACTIONID='" + Request.QueryString["txnId"].ToString() + "' WHERE ORDERID='" + Session["cartId"].ToString() + "'";
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
                string strSql = "UPDATE ORDERMASTER SET RAZORPAY_ORDERID='" + Request.QueryString["razorpay_order_id"].ToString() + "',RAZORPAY_PAYMENTID='" + Request.QueryString["razorpay_payment_id"].ToString() + "' WHERE ORDERID='" + Session["cartId"].ToString() + "'";
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
}
