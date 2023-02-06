using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class invoice : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["state"] = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            try
            {
                string strSql = "SELECT ORDERMASTER.ORDERID,CONVERT(VARCHAR(11), [ORDERDATE], 106) AS ORDERDATE,TOTALGST,DELIVERYCHARGE,WALLETDISCOUNT+PROMOCODEDISCOUNT AS TOTALDISCOUNT,GRANDTOTAL,FIRSTNAME,LASTNAME,EMAIL,ADDRESS,PHONE,STATE,WITHOUTGSTSUBTOTAL,EMAIL FROM ORDERMASTER INNER JOIN ORDERADDRESS ON ORDERMASTER.ORDERID = ORDERADDRESS.ORDERID INNER JOIN CUSTOMERS ON ORDERMASTER.CUSTOMEREMAIL = CUSTOMERS.EMAIL WHERE ORDERMASTER.ORDERID  = '" + Request.QueryString["orderId"].ToString() + "' ";
                cmd = new SqlCommand(strSql, con);

                con.Open();

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    lblOrderId.Text = dr["ORDERID"].ToString();
                    lblOrderDate.Text = dr["ORDERDATE"].ToString();
                    lblTotalGst.Text = dr["TOTALGST"].ToString();
                    lblDeliveryCharge.Text = dr["DELIVERYCHARGE"].ToString();
                    lblTotalDiscount.Text = dr["TOTALDISCOUNT"].ToString();
                    lblGrandTotal.Text = dr["GRANDTOTAL"].ToString();
                    lblFirstName.Text = dr["FIRSTNAME"].ToString();
                    lblLastName.Text = dr["LASTNAME"].ToString();
                    //lblTotalGst.Text = dr["PRICE"].ToString(); 
                    lblAddress.Text = dr["ADDRESS"].ToString();
                    lblMobileNumber.Text = dr["PHONE"].ToString();
                    Session["state"]  = dr["STATE"].ToString();
                    lblWithoutGstSubTotal.Text = dr["WITHOUTGSTSUBTOTAL"].ToString();
                    lblEmail.Text = dr["EMAIL"].ToString();
                }
                else
                {
                    lblMsg.Text = "Cannot able to load details";
                }
                con.Close();

                string strSql2 = "SELECT ORDERPRODUCTS.PRODUCTNO,HSNORSAC,NAME,TITLE,QTY,WITHOUTGSTPRICE,WITHOUTGSTPRICE* QTY AS ITEMTOTAL, CGST*QTY AS CGST, SGST*QTY AS SGST, IGST*QTY AS IGST FROM PRODUCTS INNER JOIN ORDERPRODUCTS ON PRODUCTS.PRODUCTNO = ORDERPRODUCTS.PRODUCTNO WHERE ORDERID = '" + Request.QueryString["orderId"].ToString() + "' ";
                
                cmd = new SqlCommand(strSql2, con);
                con.Open();
                da.SelectCommand = cmd;
                da.Fill(ds);
                ListView1.DataSource = ds;
                ListView1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "When loading  : " + ex;
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
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lbl,lbl1,lbl2;

        lbl = (Label)e.Item.FindControl("IGSTLabel");
        lbl1 = (Label)e.Item.FindControl("CGSTLabel");
        lbl2 = (Label)e.Item.FindControl("SGSTLabel");
        
        if (Session["state"].ToString() == "Gujarat")
        {
            lbl.Text = "-";
        }
        else
        {
            lbl1.Text = "-";
            lbl2.Text = "-";
        }

    }
}