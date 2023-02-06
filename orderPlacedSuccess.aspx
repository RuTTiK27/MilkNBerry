<%@ Page Title="Milk And Berries - Order Placed Successful!" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="orderPlacedSuccess.aspx.cs" Inherits="orderPlacedSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        mainDiv,
        table,
        td,
        a {
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }

        table,
        td {
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        img {
            -ms-interpolation-mode: bicubic;
        }

        img {
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }

        table {
            border-collapse: collapse !important;
        }

        body {
            height: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
        }

        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        @media screen and (max-width: 480px) {
            .mobile-hide {
                display: none !important;
            }

            .mobile-center {
                text-align: center !important;
            }
        }

        div[style*="margin: 16px 0;"] {
            margin: 0 !important;
        }
    </style>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.1/html2pdf.bundle.min.js" integrity="sha512-1qLXyA3x0VSWeM+8vOotn6+KIRGdcQ8QMzsNeDXmdJsUAnoDGjzlxzqAuUGJGrGkGrtOrq4buDoAHxR89D9PWA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    <div class="rounded m-4">
        <div class="mainDiv" id="invoice" style="margin: 0 !important; padding: 0 !important; background-color: #FFFFFF;" bgcolor="#FFFFFF">


            <div style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;">
                For what reason would it be advisable for me to think about business content? That might be little bit risky to have crew member like them.
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center" style="background-color: #FFFFFF;" bgcolor="#FFFFFF">
                        <table align="center" border="1" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                            <tr>
                                <td align="center" valign="top" style="font-size: 0; padding: 35px;" bgcolor="#1f1f1f">
                                    <div style="display: inline-block; max-width: 50%; min-width: 100px; vertical-align: top; width: 100%;">
                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 300px;">
                                            <tr>
                                                <td align="left" valign="top" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;" class="mobile-center">
                                                    <img src="images/MB-Logo.svg" width="100" class="shadow" style="background-color: #FFF;" />

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="display: inline-block; max-width: 50%; min-width: 100px; vertical-align: top; width: 100%;" class="mobile-hide">
                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 300px;">
                                            <tr>
                                                <td align="right" valign="top" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;">
                                                    <table cellspacing="0" cellpadding="0" border="0" align="right">
                                                        <tr>
                                                            <a href="orders.aspx" class="btn btn-outline-light rounded-pill mt-4">Track order 🚚</a>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding: 35px 35px 20px 35px; background-color: #ffffff;" bgcolor="#ffffff">
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                                        <tr>
                                            <td align="center" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;">
                                                <img src="https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png" width="125" height="120" style="display: block; border: 0px;" /><br>
                                                <h2 style="font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;">Thank You For Your Order! </h2>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;">
                                                <p style="font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;"></p>
                                                <div class="d-flex justify-content-center">
                                                    <asp:Button ID="btnViewOrderDetail" runat="server" style="font-size: 18px; font-family: Open Sans, Helvetica, Arial, sans-serif; color: #fff; text-decoration: none; border-radius: 5px; background-color: #1f1f1f; padding: 15px 30px; border: 1px solid #1f1f1f; display: block;" OnClick="btnViewOrderDetail_Click" Text="View Details" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding: 35px; background-color: #1f1f1f;" bgcolor="#1b9ba3">
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                                        <tr>
                                            <td align="center" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;">
                                                <h6 style="font-size: 24px; font-weight: 800; line-height: 30px; color: #ffffff; margin: 0;">
                                                    <asp:Label ID="lblTotalDiscount" runat="server" Text=""></asp:Label>
                                                </h6>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="padding: 10px 0 15px 0;">
                                                <table border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td align="center" style="border-radius: 5px;" bgcolor="#66b3b7"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding: 35px; background-color: #ffffff;" bgcolor="#ffffff">
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                                        <tr>
                                            <td align="center">
                                                <img src="images/MB-Logo.svg" class="rounded" width="57" height="37" style="display: block; border: 0px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px; padding: 5px 0 10px 0;">
                                                <p style="font-size: 14px; font-weight: 800; line-height: 18px; color: #333333;">216 Gajanan Business Hub Near Elecon Garden Anand Lambvel Road<br>
                                                    Anand - 388 001 </p>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                    <td align="left" style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;">
                                        <p style="font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;"> If you didn't create an account using this email address, please ignore this email or <a href="#" target="_blank" style="color: #777777;">unsusbscribe</a>. </p>
                                    </td>
                                </tr>--%>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script>
        window.onload = function () {
            if (window.history.previous) {
                //window.navigate('https://www.google.co.in/');
                window.location.href = 'page_to_go_back_to.html';
            }
            document.getElementById("download")
                .addEventListener("click", () => {
                    const invoice = this.document.getElementById("invoice");

                    var element = document.getElementById('download');
                    element.style.display = 'none'

                    console.log(invoice);
                    console.log(window);
                    var opt = {
                        margin: 1,
                        filename: 'invoice.pdf',
                        image: { type: 'jpeg', quality: 0.98 },
                        html2canvas: { scale: 2 },
                        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
                    };
                    html2pdf().from(invoice).set(opt).save();
                })
            return false;
        }

    </script>
</asp:Content>

