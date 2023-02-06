using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.EnterpriseServices;

public partial class products : System.Web.UI.Page
{
    private void totalProducts()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        //SqlDataReader dr = null;

        try
        {
            string strSql = "SELECT COUNT(*) FROM PRODUCTS";
            con.Open();
            cmd = new SqlCommand(strSql, con);
            object obj = cmd.ExecuteScalar();
            Session["totaNumberOfProducts"] = obj.ToString();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "getstar() " + ex.Message;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd.Dispose();
        }
    }

    private void loadProducts(string sql)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        try
        {
            string strSql = sql;
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



    protected void Page_Load(object sender, EventArgs e)
    {
        totalProducts();
        if (!Page.IsPostBack)
        {
            //LinkButton lbProducts = (LinkButton)Master.FindControl("lbProducts");
            //lbProducts.Style.Add(HtmlTextWriterStyle.Color, "#FFF");

            if (Request.QueryString["PNO"] != null)
            {
                showProduct(Request.QueryString["PNO"].ToString());
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction4()", true);

            }

            if (Request.QueryString["CID"] != null)
            {
                if (Request.QueryString["CID"].ToString() == "2")
                {
                    rbl.SelectedValue = "1";
                    lblProductCategory.Text = "Hair ";
                    loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 2");
                    rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
                }
                if (Request.QueryString["CID"].ToString() == "3")
                {
                    rbl.SelectedValue = "2";
                    lblProductCategory.Text = "Facial ";
                    loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 3");
                    rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
                }
                if (Request.QueryString["CID"].ToString() == "4")
                {
                    rbl.SelectedValue = "3";
                    lblProductCategory.Text = "Body ";
                    loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 4");
                    rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
                }
            }
            else
            {
                rbl.SelectedValue = "0";
                rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
                loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1");
            }
            Session["falg"] = "1";
            Session["value"] = "1";

        }
        //lblMsg.Text = "lbl: "+Session["falg"].ToString();
    }


    public void openProductModal(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        string argument = btn.CommandArgument.ToString();

        showProduct(argument);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction4()", true);
        rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
    }

    private void applyFilter(String str)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        try
        {
            string strSql = str;
            cmd = new SqlCommand(strSql, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            lv.DataSource = ds;
            lv.DataBind();
            //lvShops = "No Shop is there!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "applyFilter() " + ex.Message;
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

    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl.SelectedValue == "0")
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        if (ddl.SelectedValue == "1")
        {
            if (lblProductCategory.Text == "Hair ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 2 ORDER BY PRICE");
            }
            if (lblProductCategory.Text == "Facial ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 3 ORDER BY PRICE");
            }
            if (lblProductCategory.Text == "Body ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 4 ORDER BY PRICE");
            }

            if (lblProductCategory.Text == "All ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 ORDER BY PRICE");
            }

        }

        if (ddl.SelectedValue == "2")
        {
            if (lblProductCategory.Text == "Hair ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 2 ORDER BY PRICE DESC");
            }
            if (lblProductCategory.Text == "Facial ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 3 ORDER BY PRICE DESC");
            }
            if (lblProductCategory.Text == "Body ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 4 ORDER BY PRICE DESC");
            }

            if (lblProductCategory.Text == "All ")
            {
                applyFilter("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL] FROM [PRODUCTS] WHERE ISACTIVE = 1 ORDER BY PRICE DESC");
            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function(){changeClass();});", true);
        }

        //if (ddl.SelectedValue == "3")
        //{
        //    applyFilter("RATE DESC");
        //}
        rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
    }
    protected void rbl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl.SelectedValue == "0")
        {
            lblProductCategory.Text = "All ";
            loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1");
            rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
        }

        if (rbl.SelectedValue == "1")
        {
            lblProductCategory.Text = "Hair ";
            loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 2");
            rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
        }

        if (rbl.SelectedValue == "2")
        {
            lblProductCategory.Text = "Facial ";
            loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 3");
            rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
        }

        if (rbl.SelectedValue == "3")
        {
            lblProductCategory.Text = "Body ";
            loadProducts("SELECT [PRODUCTNO], [NAME], [PRICE], [RATE], [MAINIMAGEURL],[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] FROM [PRODUCTS] WHERE ISACTIVE = 1 AND CATEGORYID = 4");
            rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
        }
    }
    //protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
    //{
    //    Label mylabel,firstStart, secondStar, thirdStar, fourthStar, fifthStar;
    //    mylabel = (Label)e.Item.FindControl("productNo");

    //    firstStart = (Label)e.Item.FindControl("firstStar");
    //    secondStar = (Label)e.Item.FindControl("secondStar");
    //    thirdStar = (Label)e.Item.FindControl("thirdStar");
    //    fourthStar = (Label)e.Item.FindControl("fourthStar");
    //    fifthStar = (Label)e.Item.FindControl("fifthStar");

    //    float star = (float)getstar(mylabel.Text);
    //    if (star == 1)
    //    {
    //        firstStart.CssClass = "fa-solid fa-star";
    //        secondStar.CssClass = "fa-regular fa-star";
    //        thirdStar.CssClass = "fa-regular fa-star";
    //        fourthStar.CssClass = "fa-regular fa-star";
    //        fifthStar.CssClass = "fa-regular fa-star";
    //    }

    //    if (star == 2)
    //    {
    //        firstStart.CssClass = "fa-solid fa-star";
    //        secondStar.CssClass = "fa-solid fa-star";
    //        thirdStar.CssClass = "fa-regular fa-star";
    //        fourthStar.CssClass = "fa-regular fa-star";
    //        fifthStar.CssClass = "fa-regular fa-star";
    //    }

    //    if (star == 3)
    //    {
    //        firstStart.CssClass = "fa-solid fa-star";
    //        secondStar.CssClass = "fa-solid fa-star";
    //        thirdStar.CssClass = "fa-solid fa-star";
    //        fourthStar.CssClass = "fa-regular fa-star";
    //        fifthStar.CssClass = "fa-regular fa-star";
    //    }

    //    if (star == 4)
    //    {
    //        firstStart.CssClass = "fa-solid fa-star";
    //        secondStar.CssClass = "fa-solid fa-star";
    //        thirdStar.CssClass = "fa-solid fa-star";
    //        fourthStar.CssClass = "fa-solid fa-star";
    //        fifthStar.CssClass = "fa-regular fa-star";
    //    }

    //    if (star == 5)
    //    {
    //        firstStart.CssClass = "fa-solid fa-star";
    //        secondStar.CssClass = "fa-solid fa-star";
    //        thirdStar.CssClass = "fa-solid fa-star";
    //        fourthStar.CssClass = "fa-solid fa-star";
    //        fifthStar.CssClass = "fa-solid fa-star";
    //    }

    //}

    //private float getstar(string productNo)
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    //    SqlCommand cmd = null;
    //    //SqlDataReader dr = null;

    //    float star = 0;
    //    try
    //    {
    //        string strSql = "SELECT [RATE] FROM PRODUCTS where PRODUCTNO = '" + productNo + "'";
    //        con.Open();
    //        cmd = new SqlCommand(strSql, con);
    //        object obj = cmd.ExecuteScalar();
    //        star = (float)Convert.ToDouble(obj);
    //    }
    //    catch (Exception ex)
    //    {
    //        lblMsg.Text = "getstar() " + ex.Message;
    //    }
    //    finally
    //    {
    //        if (con.State == ConnectionState.Open)
    //        {
    //            con.Close();
    //        }
    //        cmd.Dispose();

    //    }
    //    return star;
    //}

    //--------------------------
    private void showProduct(string productCode)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string loginQuery = "select PRODUCTNO,NAME,TITLE,DESCRITION,PRICE,RATE,MAINIMAGEURL,IMAGEURL2,IMAGEURL3,[DISCOUNTPERCENTAGE],[AFTERDISCOUNTPRICE] from PRODUCTS where PRODUCTNO = '" + productCode + "' ";
            cmd = new SqlCommand(loginQuery, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                productNo.Text = dr["PRODUCTNO"].ToString();
                productName.Text = dr["NAME"].ToString();
                lblProductNameBold.Text = dr["NAME"].ToString();
                productTitle.Text = dr["TITLE"].ToString();
                productDescription.Text = dr["DESCRITION"].ToString();
                productMrp.Text = dr["PRICE"].ToString();
                productPrice.Text = dr["AFTERDISCOUNTPRICE"].ToString();
                discountPercentage.Text = dr["DISCOUNTPERCENTAGE"].ToString();

                string RATE = dr["RATE"].ToString();
                Image1.ImageUrl = dr["MAINIMAGEURL"].ToString();
                //Image2.ImageUrl = dr["IMAGEURL2"].ToString();
                //Image3.ImageUrl = dr["IMAGEURL3"].ToString();
            }
            else
            {
                lblMsg.Text = "Cannot able to load product";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "showProduct() : " + ex;
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
    private string checkIfItemAlreadythere(string cartid, string productCode)
    {
        string qty = "";

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT QTY,PRODUCTNO FROM CART where CARTID = '" + cartid + "' and PRODUCTNO = '" + productCode + "'";
            cmd = new SqlCommand(strSql, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                qty = dr["QTY"].ToString();
            }
            else
            {
                qty = "";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "showProduct() : " + ex;
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

        return qty;
    }

    private void updateQuantity(string qty, string cartid, string productNo, string subTotal,string mrp,string discount)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = null;

        try
        {
            if (Convert.ToInt32(qty) > 10)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction3()", true);
            }
            else
            {
                string strSql = "UPDATE CART SET QTY = '" + qty + "',SUBTOTAL = '" + subTotal + "',TOTALMRP='"+mrp+"',TOTALDISCOUNT='"+discount+"' WHERE CARTID = '" + cartid + "' and PRODUCTNO = '" + productNo + "'";
                cmd = new SqlCommand(strSql, con);
                con.Open();
                cmd.ExecuteReader();
                Response.Redirect("products.aspx", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction2()", true);
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = "updateQuantity() " + ex.Message;
        }
        finally
        {
            if (cmd != null)
            {
                cmd.Dispose();
            }
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }

    private string getCartIdIfEmailAlreadyExist()
    {
        string cartid = "";

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT CARTID,CUSTOMEREMAIL FROM CART where CUSTOMEREMAIL = '" + Session["email"].ToString() + "'";
            cmd = new SqlCommand(strSql, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                cartid = dr["CARTID"].ToString();
            }
            else
            {
                cartid = "";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "showProduct() : " + ex;
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

        return cartid;
    }

    private void addItem(String cartid, string subtotal,string mrp,string discount)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERTCART", con);

        con.Open();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CARTID", cartid);
            cmd.Parameters.AddWithValue("CUSTOMEREMAIL", Session["email"].ToString());
            cmd.Parameters.AddWithValue("PRODUCTNO", productNo.Text);
            cmd.Parameters.AddWithValue("PRICE", productPrice.Text);
            cmd.Parameters.AddWithValue("QTY", txtQuantity.Text);
            cmd.Parameters.AddWithValue("SUBTOTAL", subtotal);
            cmd.Parameters.AddWithValue("TOTALMRP", mrp);
            cmd.Parameters.AddWithValue("TOTALDISCOUNT", discount);

            cmd.ExecuteNonQuery();
            Response.Redirect("products.aspx", true);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction2()", true);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "addItem() : " + ex;
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

    protected void btnAddtoCart_Click(object sender, EventArgs e)
    {

        if (Session["email"] != null)
        {
            if (Session["email"].ToString() != "")
            {
                string cartid = getCartIdIfEmailAlreadyExist();
                double subtotal = 0,mrp=0,discount=0;
                subtotal = Convert.ToInt32(Math.Round(Convert.ToDouble(productPrice.Text))) * Convert.ToInt32(txtQuantity.Text);
                mrp = Convert.ToInt32(Math.Round(Convert.ToDouble(productMrp.Text)) * Convert.ToInt32(txtQuantity.Text));
                discount = (((Convert.ToDouble(productMrp.Text) * Convert.ToDouble(discountPercentage.Text)) / 100))* Convert.ToInt32(txtQuantity.Text);
                
                if (cartid == "")
                {
                    DateTime dt = DateTime.Now;
                    cartid = dt.ToString("ddMMyyyhhmmssms");
                    addItem(cartid,subtotal.ToString(), mrp.ToString(), discount.ToString());
                }
                else
                {

                    String qty = checkIfItemAlreadythere(cartid, productNo.Text);
                    if (qty == "")
                    {
                        addItem(cartid, subtotal.ToString(), mrp.ToString(), discount.ToString());
                    }
                    else
                    {
                        int totalQuantity = Convert.ToInt32(txtQuantity.Text) + Convert.ToInt32(qty);
                        int subTotal = totalQuantity * Convert.ToInt32(Math.Round(Convert.ToDouble(productPrice.Text)));
                        qty = totalQuantity.ToString();

                        updateQuantity(qty, cartid, productNo.Text, subTotal.ToString(),mrp.ToString(), discount.ToString());
                    }

                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction()", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction()", true);
        }
        rbl.SelectedItem.Attributes.Add("class", "btn btn-dark rounded-pill");
    }

    protected void btnGotoLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/account.aspx", true);
    }

    protected void btnGotoCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/cart.aspx", true);
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Session["value"] = Session["falg"];
    }


    protected void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lbl;
        lbl = (Label)e.Item.FindControl("Price");
        double Price = Convert.ToInt32(lbl.Text);
        lbl.Text = "₹" + Price.ToString();
    }

}