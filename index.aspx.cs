using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _index : System.Web.UI.Page
{


    List<string> panelMaster = new List<string>();

    List<string> titles = new List<string>();
    List<string> SubTitles = new List<string>();
    List<string> buttonTexts = new List<string>();
    List<string> buttonLinks = new List<string>();
    List<string> imgLinks = new List<string>();


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

    private void getPanel()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT * FROM PANELMASTER";
            cmd = new SqlCommand(strSql, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {

                while (dr.Read())
                {
                    panelMaster.Add(dr["MAINTITLE"].ToString());
                    panelMaster.Add(dr["ISACTIVE"].ToString());
                }
                //dr["ID"].ToString();



            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "getPanel() : " + ex;
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
    private void clearPanelMaster()
    {
        panelMaster.Clear();
    }
    private void fillAllData()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT * FROM PANEL";
            cmd = new SqlCommand(strSql, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    titles.Add(dr["TITLE"].ToString());
                    SubTitles.Add(dr["SUBTITLE"].ToString());
                    buttonTexts.Add(dr["BUTTONTEXT"].ToString());
                    buttonLinks.Add(dr["BUTTONLINK"].ToString());
                    imgLinks.Add(dr["IMAGELINK"].ToString());
                }
                //dr["ID"].ToString();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "fillAllData() : " + ex;
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
    private void clearAll()
    {
        titles.Clear();
        SubTitles.Clear();
        buttonTexts.Clear();
        buttonLinks.Clear();
        imgLinks.Clear();
    }
    private void setAnimationText()
    {
        string firstText = "", secondText = "", firstTextIsActive = "", secondTextActive = "";

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            string strSql = "SELECT * FROM ANIMATIONTEXTS";
            cmd = new SqlCommand(strSql, con);
            con.Open();

            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (dr["ID"].ToString() == "1")
                    {
                        firstText = dr["ANIMATIONTEXT"].ToString();
                        firstTextIsActive = dr["ISACTIVE"].ToString();
                    }
                    if (dr["ID"].ToString() == "2")
                    {
                        secondText = dr["ANIMATIONTEXT"].ToString();
                        secondTextActive = dr["ISACTIVE"].ToString();
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

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "applyText('" + firstText + "','" + secondText + "','" + firstTextIsActive + "','" + secondTextActive + "')", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            storeUserIp();
            setAnimationText();
            if (Session["email"] != null)
            {
                if (Session["email"].ToString() != "")
                {
                    lbAccount.Text = Server.HtmlDecode("<i class='fal fa-user'></i> " + Session["firstName"].ToString());
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
            fillAllData();
            getPanel();
            //PANEL1
            if (Convert.ToInt32(panelMaster[1].ToString()) == 1)
            {

                lblPanel1_1Title.Text = titles[0].ToString();
                lblPanel1_2Title.Text = titles[1].ToString();
                lblPanel1_3Title.Text = titles[2].ToString();

                lblPanel1_1SubTitle.Text = SubTitles[0].ToString();
                lblPanel1_2SubTitle.Text = SubTitles[1].ToString();
                lblPanel1_3SubTitle.Text = SubTitles[2].ToString();

                lbPanel1_1.Text = buttonTexts[0].ToString();
                lbPanel1_2.Text = buttonTexts[1].ToString();
                lbPanel1_3.Text = buttonTexts[2].ToString();

                lbPanel1_1.PostBackUrl = buttonLinks[0].ToString();
                lbPanel1_2.PostBackUrl = buttonLinks[1].ToString();
                lbPanel1_3.PostBackUrl = buttonLinks[2].ToString();

                imgPanel1_1.ImageUrl = imgLinks[0].ToString();
                imgPanel1_2.ImageUrl = imgLinks[1].ToString();
                imgPanel1_3.ImageUrl = imgLinks[2].ToString();

                imgPanel1_1.PostBackUrl = buttonLinks[0].ToString();
                imgPanel1_2.PostBackUrl = buttonLinks[1].ToString();
                imgPanel1_3.PostBackUrl = buttonLinks[2].ToString();

            }
            else
            {
                Panel1.Attributes.Add("class", "d-none");
            }
            //PANEL1

            //PANEL2
            if (Convert.ToInt32(panelMaster[3].ToString()) == 1)
            {
                panel2Title.InnerText = panelMaster[2].ToString();

                lblPanel2_1Title.Text = titles[3].ToString();
                lblPanel2_2Title.Text = titles[4].ToString();
                lblPanel2_3Title.Text = titles[5].ToString();
                lblPanel2_4Title.Text = titles[6].ToString();

                lblPanel2_1SubTitle.Text = SubTitles[3].ToString();
                lblPanel2_2SubTitle.Text = SubTitles[4].ToString();
                lblPanel2_3SubTitle.Text = SubTitles[5].ToString();
                lblPanel2_4SubTitle.Text = SubTitles[6].ToString();

                lbPanel2_1.Text = buttonTexts[3].ToString();
                lbPanel2_2.Text = buttonTexts[4].ToString();
                lbPanel2_3.Text = buttonTexts[5].ToString();
                lbPanel2_4.Text = buttonTexts[6].ToString();

                lbPanel2_1.PostBackUrl = buttonLinks[3].ToString();
                lbPanel2_2.PostBackUrl = buttonLinks[4].ToString();
                lbPanel2_3.PostBackUrl = buttonLinks[5].ToString();
                lbPanel2_4.PostBackUrl = buttonLinks[6].ToString();

                imgPanel2_1.ImageUrl = imgLinks[3].ToString();
                imgPanel2_2.ImageUrl = imgLinks[4].ToString();
                imgPanel2_3.ImageUrl = imgLinks[5].ToString();
                imgPanel2_4.ImageUrl = imgLinks[6].ToString();

                imgPanel2_1.PostBackUrl = buttonLinks[3].ToString();
                imgPanel2_2.PostBackUrl = buttonLinks[4].ToString();
                imgPanel2_3.PostBackUrl = buttonLinks[5].ToString();
                imgPanel2_4.PostBackUrl = buttonLinks[6].ToString();

                /////////////////////////////////////////////////////

                lblPanelMobile2_1Title.Text = titles[3].ToString();
                lblPanelMobile2_2Title.Text = titles[4].ToString();
                lblPanelMobile2_3Title.Text = titles[5].ToString();
                lblPanelMobile2_4Title.Text = titles[6].ToString();

                lblPanelMobile2_1SubTitle.Text = SubTitles[3].ToString();
                lblPanelMobile2_2SubTitle.Text = SubTitles[4].ToString();
                lblPanelMobile2_3SubTitle.Text = SubTitles[5].ToString();
                lblPanelMobile2_4SubTitle.Text = SubTitles[6].ToString();

                lbPanelMobile2_1.Text = buttonTexts[3].ToString();
                lbPanelMobile2_2.Text = buttonTexts[4].ToString();
                lbPanelMobile2_3.Text = buttonTexts[5].ToString();
                lbPanelMobile2_4.Text = buttonTexts[6].ToString();

                lbPanelMobile2_1.PostBackUrl = buttonLinks[3].ToString();
                lbPanelMobile2_2.PostBackUrl = buttonLinks[4].ToString();
                lbPanelMobile2_3.PostBackUrl = buttonLinks[5].ToString();
                lbPanelMobile2_4.PostBackUrl = buttonLinks[6].ToString();

                imgPanelMobile2_1.ImageUrl = imgLinks[3].ToString();
                imgPanelMobile2_2.ImageUrl = imgLinks[4].ToString();
                imgPanelMobile2_3.ImageUrl = imgLinks[5].ToString();
                imgPanelMobile2_4.ImageUrl = imgLinks[6].ToString();

                imgPanelMobile2_1.PostBackUrl = buttonLinks[3].ToString();
                imgPanelMobile2_2.PostBackUrl = buttonLinks[4].ToString();
                imgPanelMobile2_3.PostBackUrl = buttonLinks[5].ToString();
                imgPanelMobile2_4.PostBackUrl = buttonLinks[6].ToString();

            }
            else
            {
                Panel2.Attributes.Add("class", "d-none");
                clearPanelMaster();
            }

            //PANEL2

            //PANEL3
            if (Convert.ToInt32(panelMaster[5].ToString()) == 1)
            {
                panel3Title.InnerText = panelMaster[4].ToString();

                lblPanel3_1Title.Text = titles[7].ToString();
                lblPanel3_2Title.Text = titles[8].ToString();
                lblPanel3_3Title.Text = titles[9].ToString();
                lblPanel3_4Title.Text = titles[10].ToString();

                lblPanel3_1SubTitle.Text = SubTitles[7].ToString();
                lblPanel3_2SubTitle.Text = SubTitles[8].ToString();
                lblPanel3_3SubTitle.Text = SubTitles[9].ToString();
                lblPanel3_4SubTitle.Text = SubTitles[10].ToString();

                lbPanel3_1.Text = buttonTexts[7].ToString();
                lbPanel3_2.Text = buttonTexts[8].ToString();
                lbPanel3_3.Text = buttonTexts[9].ToString();
                lbPanel3_4.Text = buttonTexts[10].ToString();

                lbPanel3_1.PostBackUrl = buttonLinks[7].ToString();
                lbPanel3_2.PostBackUrl = buttonLinks[8].ToString();
                lbPanel3_3.PostBackUrl = buttonLinks[9].ToString();
                lbPanel3_4.PostBackUrl = buttonLinks[10].ToString();

                imgPanel3_1.ImageUrl = imgLinks[7].ToString();
                imgPanel3_2.ImageUrl = imgLinks[8].ToString();
                imgPanel3_3.ImageUrl = imgLinks[9].ToString();
                imgPanel3_4.ImageUrl = imgLinks[10].ToString();

                imgPanel3_1.PostBackUrl = buttonLinks[7].ToString();
                imgPanel3_2.PostBackUrl = buttonLinks[8].ToString();
                imgPanel3_3.PostBackUrl = buttonLinks[9].ToString();
                imgPanel3_4.PostBackUrl = buttonLinks[10].ToString();

                /////////////////////////////////////////////////////

                lblPanelMobile3_1Title.Text = titles[7].ToString();
                lblPanelMobile3_2Title.Text = titles[8].ToString();
                lblPanelMobile3_3Title.Text = titles[9].ToString();
                lblPanelMobile3_4Title.Text = titles[10].ToString();

                lblPanelMobile3_1SubTitle.Text = SubTitles[7].ToString();
                lblPanelMobile3_2SubTitle.Text = SubTitles[8].ToString();
                lblPanelMobile3_3SubTitle.Text = SubTitles[9].ToString();
                lblPanelMobile3_4SubTitle.Text = SubTitles[10].ToString();

                lbPanelMobile3_1.Text = buttonTexts[7].ToString();
                lbPanelMobile3_2.Text = buttonTexts[8].ToString();
                lbPanelMobile3_3.Text = buttonTexts[9].ToString();
                lbPanelMobile3_4.Text = buttonTexts[10].ToString();

                lbPanelMobile3_1.PostBackUrl = buttonLinks[7].ToString();
                lbPanelMobile3_2.PostBackUrl = buttonLinks[8].ToString();
                lbPanelMobile3_3.PostBackUrl = buttonLinks[9].ToString();
                lbPanelMobile3_4.PostBackUrl = buttonLinks[10].ToString();

                imgPanelMobile3_1.ImageUrl = imgLinks[7].ToString();
                imgPanelMobile3_2.ImageUrl = imgLinks[8].ToString();
                imgPanelMobile3_3.ImageUrl = imgLinks[9].ToString();
                imgPanelMobile3_4.ImageUrl = imgLinks[10].ToString();

                imgPanelMobile3_1.PostBackUrl = buttonLinks[7].ToString();
                imgPanelMobile3_2.PostBackUrl = buttonLinks[8].ToString();
                imgPanelMobile3_3.PostBackUrl = buttonLinks[9].ToString();
                imgPanelMobile3_4.PostBackUrl = buttonLinks[10].ToString();

            }
            else
            {
                Panel3.Attributes.Add("class", "d-none");
            }
            //PANEL3

            //PANEL4
            if (Convert.ToInt32(panelMaster[7].ToString()) == 1)
            {
                panel4Title.InnerText = panelMaster[6].ToString();

                lblPanel4_1Title.Text = titles[11].ToString();
                lblPanel4_2Title.Text = titles[12].ToString();
                lblPanel4_3Title.Text = titles[13].ToString();

                lblPanel4_1SubTitle.Text = SubTitles[11].ToString();
                lblPanel4_2SubTitle.Text = SubTitles[12].ToString();
                lblPanel4_3SubTitle.Text = SubTitles[13].ToString();

                lbPanel4_1.Text = buttonTexts[10].ToString();
                lbPanel4_2.Text = buttonTexts[11].ToString();
                lbPanel4_3.Text = buttonTexts[11].ToString();

                lbPanel4_1.PostBackUrl = buttonLinks[11].ToString();
                lbPanel4_2.PostBackUrl = buttonLinks[12].ToString();
                lbPanel4_3.PostBackUrl = buttonLinks[13].ToString();

                imgPanel4_1.ImageUrl = imgLinks[11].ToString();
                imgPanel4_2.ImageUrl = imgLinks[12].ToString();
                imgPanel4_3.ImageUrl = imgLinks[13].ToString();

                imgPanel4_1.PostBackUrl = buttonLinks[11].ToString();
                imgPanel4_2.PostBackUrl = buttonLinks[12].ToString();
                imgPanel4_3.PostBackUrl = buttonLinks[13].ToString();

            }
            else
            {
                Panel4.Attributes.Add("class", "d-none");
                clearPanelMaster();
            }
            //PANEL4

            //PANEL5
            if (Convert.ToInt32(panelMaster[9].ToString()) == 1)
            {
                panel5Title.InnerText = panelMaster[8].ToString();

                lblPanel5_1Title.Text = titles[14].ToString();
                lblPanel5_2Title.Text = titles[15].ToString();
                lblPanel5_3Title.Text = titles[16].ToString();
                lblPanel5_4Title.Text = titles[17].ToString();

                lblPanel5_1SubTitle.Text = SubTitles[14].ToString();
                lblPanel5_2SubTitle.Text = SubTitles[15].ToString();
                lblPanel5_3SubTitle.Text = SubTitles[16].ToString();
                lblPanel5_4SubTitle.Text = SubTitles[17].ToString();

                lbPanel5_1.Text = buttonTexts[14].ToString();
                lbPanel5_2.Text = buttonTexts[15].ToString();
                lbPanel5_3.Text = buttonTexts[16].ToString();
                lbPanel5_4.Text = buttonTexts[17].ToString();

                lbPanel5_1.PostBackUrl = buttonLinks[14].ToString();
                lbPanel5_2.PostBackUrl = buttonLinks[15].ToString();
                lbPanel5_3.PostBackUrl = buttonLinks[16].ToString();
                lbPanel5_4.PostBackUrl = buttonLinks[17].ToString();

                imgPanel5_1.ImageUrl = imgLinks[14].ToString();
                imgPanel5_2.ImageUrl = imgLinks[15].ToString();
                imgPanel5_3.ImageUrl = imgLinks[16].ToString();
                imgPanel5_4.ImageUrl = imgLinks[17].ToString();

                imgPanel5_1.PostBackUrl = buttonLinks[14].ToString();
                imgPanel5_2.PostBackUrl = buttonLinks[15].ToString();
                imgPanel5_3.PostBackUrl = buttonLinks[16].ToString();
                imgPanel5_4.PostBackUrl = buttonLinks[17].ToString();

                ///////////////////////////////////////////////////
                lblPanelMobile5_1Title.Text = titles[14].ToString();
                lblPanelMobile5_2Title.Text = titles[15].ToString();
                lblPanelMobile5_3Title.Text = titles[16].ToString();
                lblPanelMobile5_4Title.Text = titles[17].ToString();

                lblPanelMobile5_1SubTitle.Text = SubTitles[14].ToString();
                lblPanelMobile5_2SubTitle.Text = SubTitles[15].ToString();
                lblPanelMobile5_3SubTitle.Text = SubTitles[16].ToString();
                lblPanelMobile5_4SubTitle.Text = SubTitles[17].ToString();

                lbPanelMobile5_1.Text = buttonTexts[14].ToString();
                lbPanelMobile5_2.Text = buttonTexts[15].ToString();
                lbPanelMobile5_3.Text = buttonTexts[16].ToString();
                lbPanelMobile5_4.Text = buttonTexts[17].ToString();

                lbPanelMobile5_1.PostBackUrl = buttonLinks[14].ToString();
                lbPanelMobile5_2.PostBackUrl = buttonLinks[15].ToString();
                lbPanelMobile5_3.PostBackUrl = buttonLinks[16].ToString();
                lbPanelMobile5_4.PostBackUrl = buttonLinks[17].ToString();

                imgPanelMobile5_1.ImageUrl = imgLinks[14].ToString();
                imgPanelMobile5_2.ImageUrl = imgLinks[15].ToString();
                imgPanelMobile5_3.ImageUrl = imgLinks[16].ToString();
                imgPanelMobile5_4.ImageUrl = imgLinks[17].ToString();

                imgPanelMobile5_1.PostBackUrl = buttonLinks[14].ToString();
                imgPanelMobile5_2.PostBackUrl = buttonLinks[15].ToString();
                imgPanelMobile5_3.PostBackUrl = buttonLinks[16].ToString();
                imgPanelMobile5_4.PostBackUrl = buttonLinks[17].ToString();

            }
            else
            {
                Panel5.Attributes.Add("class", "d-none");
            }
            //PANEL5

            //PANEL6
            if (Convert.ToInt32(panelMaster[11].ToString()) == 1)
            {
                panel6Title.InnerText = panelMaster[10].ToString();

                lblPanel6_1Title.Text = titles[18].ToString();
                lblPanel6_2Title.Text = titles[19].ToString();
                lblPanel6_3Title.Text = titles[20].ToString();

                lblPanel6_1SubTitle.Text = SubTitles[18].ToString();
                lblPanel6_2SubTitle.Text = SubTitles[19].ToString();
                lblPanel6_3SubTitle.Text = SubTitles[20].ToString();

                lbPanel6_1.Text = buttonTexts[18].ToString();
                lbPanel6_2.Text = buttonTexts[19].ToString();
                lbPanel6_3.Text = buttonTexts[20].ToString();

                lbPanel6_1.PostBackUrl = buttonLinks[18].ToString();
                lbPanel6_2.PostBackUrl = buttonLinks[19].ToString();
                lbPanel6_3.PostBackUrl = buttonLinks[20].ToString();

                imgPanel6_1.Style.Add(HtmlTextWriterStyle.BackgroundImage, "url('" + imgLinks[18].ToString() + "')");
                imgPanel6_1.Style.Add("background-size", "cover");
                imgPanel6_2.Style.Add(HtmlTextWriterStyle.BackgroundImage, "url('" + imgLinks[19].ToString() + "')");
                imgPanel6_2.Style.Add("background-size", "cover");
                imgPanel6_3.Style.Add(HtmlTextWriterStyle.BackgroundImage, "url('" + imgLinks[20].ToString() + "')");
                imgPanel6_3.Style.Add("background-size", "cover");

                wLbPanel6_1.PostBackUrl = buttonLinks[18].ToString();
                wLbPanel6_2.PostBackUrl = buttonLinks[19].ToString();
                wLbPanel6_3.PostBackUrl = buttonLinks[20].ToString();

                wLbPanel6_1.Style.Add(HtmlTextWriterStyle.TextDecoration, "none");
                wLbPanel6_2.Style.Add(HtmlTextWriterStyle.TextDecoration, "none");
                wLbPanel6_3.Style.Add(HtmlTextWriterStyle.TextDecoration, "none");

                lblPanelMobile6_1Title.Text = titles[18].ToString();
                lblPanelMobile6_2Title.Text = titles[19].ToString();
                lblPanelMobile6_3Title.Text = titles[20].ToString();

                lblPanelMobile6_1SubTitle.Text = SubTitles[18].ToString();
                lblPanelMobile6_2SubTitle.Text = SubTitles[19].ToString();
                lblPanelMobile6_3SubTitle.Text = SubTitles[20].ToString();

                lbPanelMobile6_1.Text = buttonTexts[18].ToString();
                lbPanelMobile6_2.Text = buttonTexts[19].ToString();
                lbPanelMobile6_3.Text = buttonTexts[20].ToString();

                lbPanelMobile6_1.PostBackUrl = buttonLinks[18].ToString();
                lbPanelMobile6_2.PostBackUrl = buttonLinks[19].ToString();
                lbPanelMobile6_3.PostBackUrl = buttonLinks[20].ToString();

                imgPanelMobile6_1.Style.Add(HtmlTextWriterStyle.BackgroundImage, "url('" + imgLinks[18].ToString() + "')");
                imgPanelMobile6_1.Style.Add("background-size", "cover");
                imgPanelMobile6_2.Style.Add(HtmlTextWriterStyle.BackgroundImage, "url('" + imgLinks[19].ToString() + "')");
                imgPanelMobile6_2.Style.Add("background-size", "cover");
                imgPanelMobile6_3.Style.Add(HtmlTextWriterStyle.BackgroundImage, "url('" + imgLinks[20].ToString() + "')");
                imgPanelMobile6_3.Style.Add("background-size", "cover");

                wLbPanelMobile6_1.PostBackUrl = buttonLinks[18].ToString();
                wLbPanelMobile6_2.PostBackUrl = buttonLinks[19].ToString();
                wLbPanelMobile6_3.PostBackUrl = buttonLinks[20].ToString();

                wLbPanelMobile6_1.Style.Add(HtmlTextWriterStyle.TextDecoration, "none");
                wLbPanelMobile6_2.Style.Add(HtmlTextWriterStyle.TextDecoration, "none");
                wLbPanelMobile6_3.Style.Add(HtmlTextWriterStyle.TextDecoration, "none");
            }
            else
            {
                Panel6.Attributes.Add("class", "d-none");
            }
            //PANEL6

            //PANEL7
            if (Convert.ToInt32(panelMaster[13].ToString()) == 1)
            {
                lblPanel7_1Title.Text = titles[21].ToString();

                lblPanel7_1SubTitle.Text = SubTitles[21].ToString();

                lbPanel7_1.Text = buttonTexts[21].ToString();

                lbPanel7_1.PostBackUrl = buttonLinks[21].ToString();

                imgPanel7_1.ImageUrl = imgLinks[21].ToString();
                imgPanel7_1.PostBackUrl = buttonLinks[21].ToString();

            }
            else
            {
                Panel7.Attributes.Add("class", "d-none");
            }
            //PANEL7

            //PANEL8
            if (Convert.ToInt32(panelMaster[15].ToString()) == 1)
            {

                lblPanel8_1Title.Text = titles[22].ToString();
                lblPanel8_2Title.Text = titles[23].ToString();
                lblPanel8_3Title.Text = titles[24].ToString();

                lblPanel8_1SubTitle.Text = SubTitles[22].ToString();
                lblPanel8_2SubTitle.Text = SubTitles[23].ToString();
                lblPanel8_3SubTitle.Text = SubTitles[24].ToString();

                imgPanel8_1.ImageUrl = imgLinks[22].ToString();
                imgPanel8_2.ImageUrl = imgLinks[23].ToString();
                imgPanel8_3.ImageUrl = imgLinks[24].ToString();

                clearAll();
                clearPanelMaster();
            }
            else
            {
                Panel8.Attributes.Add("class", "d-none");
                clearPanelMaster();
            }
            //PANEL8
        }
        //background - image: url(''); background - size:cover;
        //imgPanel6_1.Style.Add(HtmlTextWriterStyle.BackgroundImage, "");

        //panel2Title.InnerText = "xx";
    }

    protected void imgLogo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("index.aspx", true);
    }
    private void storeUserIp()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERTVISITEDPEOPLE", con);
        HttpRequest request = HttpContext.Current.Request;
        try
        {
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("IP", request.UserHostAddress);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "storeUserIp() : " + ex.Message;
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