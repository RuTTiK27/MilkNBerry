<%@ Page Title="Milk And Berries - Cahback & Offers" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cashback.aspx.cs" Inherits="cashback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .wrap {
          display: flex;
          justify-content: space-around;
          align-items: center;
          box-sizing: border-box;
          height: 100vh;
          padding: 2rem;
          background-color: #eee;
        }

        .containerTermsAndConditions {
          display: flex;
          flex-direction: column;
          box-sizing: border-box;
          padding: 1rem;
          background-color: #fff;
          width: 768px;
          height: 100%;
          border-radius: 0.25rem;
          box-shadow: 0rem 1rem 2rem -0.25rem rgba(0, 0, 0, 0.25);
        }
        .container__heading {
          padding: 1rem 0;
          border-bottom: 1px solid #ccc;
          text-align: center;
        }
        .container__heading > h2 {
          font-size: 1.75rem;
          line-height: 1.75rem;
          margin: 0;
        }
        .container__content {
          flex-grow: 1;
          overflow-y: scroll;
        }
        .container__nav {
          border-top: 1px solid #ccc;
          text-align: right;
          padding: 2rem 0 1rem;
        }
        .container__nav > .button {
          background-color: #444499;
          box-shadow: 0rem 0.5rem 1rem -0.125rem rgba(0, 0, 0, 0.25);
          padding: 0.8rem 2rem;
          border-radius: 0.5rem;
          color: #fff;
          text-decoration: none;
          font-size: 0.9rem;
          transition: transform 0.25s, box-shadow 0.25s;
        }
        .container__nav > .button:hover {
          box-shadow: 0rem 0rem 1rem -0.125rem rgba(0, 0, 0, 0.25);
          transform: translateY(-0.5rem);
        }
        .container__nav > small {
          color: #777;
          margin-right: 1rem;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main class="wrap">
      <section class="containerTermsAndConditions">
        <div class="container__heading">
          <h2>Cahback & Offers</h2>
        </div>
        <div class="container__content">
          
            <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
line-height:normal;mso-outline-level:3;background:white'><span lang=EN-GB
style='font-size:13.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
"Times New Roman";mso-bidi-font-family:"Times New Roman";color:black;
mso-color-alt:windowtext;mso-fareast-language:EN-GB'>ABOUT CASHBACK</span><span
lang=EN-GB style='font-size:13.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
"Times New Roman";mso-bidi-font-family:"Times New Roman";mso-fareast-language:
EN-GB'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
line-height:normal;background:white'><span lang=EN-GB style='font-size:11.5pt;
font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";color:black;mso-color-alt:windowtext;
mso-fareast-language:EN-GB'>Cashback will be credited in the user’s wallet
account after 7 days of a successful transaction or once the Return period will
be over. The cashback will be in the form of a discount. Please see the Terms
and Conditions below for more details:</span><span lang=EN-GB style='font-size:
11.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
mso-bidi-font-family:"Times New Roman";mso-fareast-language:EN-GB'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
line-height:normal;mso-outline-level:3;background:white'><span lang=EN-GB
style='font-size:13.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
"Times New Roman";mso-bidi-font-family:"Times New Roman";color:black;
mso-color-alt:windowtext;mso-fareast-language:EN-GB'>HOW TO AVAIL THE OFFER</span><span
lang=EN-GB style='font-size:13.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
"Times New Roman";mso-bidi-font-family:"Times New Roman";mso-fareast-language:
EN-GB'><o:p></o:p></span></p>

<ol start=1 type=1>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l2 level1 lfo5;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>Create
     your new account with milk and berries on&nbsp;www.milknberries.com or
     login using your existing milk and berries account.</span><span
     lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l2 level1 lfo5;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>Proceed
     to the payments page and select Wallet cashback as your payment option.</span><span
     lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l2 level1 lfo5;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>If you
     are eligible for Cashback, the same will be added as a Cashback in your
     Wallet.</span><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l2 level1 lfo5;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>You will
     also receive an Email notifying you about the cashback credited in your
     account.</span><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
</ol>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
line-height:normal;mso-outline-level:3;background:white'><span lang=EN-GB
style='font-size:13.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
"Times New Roman";mso-bidi-font-family:"Times New Roman";color:black;
mso-color-alt:windowtext;mso-fareast-language:EN-GB'>TERMS AND CONDITIONS</span><span
lang=EN-GB style='font-size:13.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
"Times New Roman";mso-bidi-font-family:"Times New Roman";mso-fareast-language:
EN-GB'><o:p></o:p></span></p>

<ol start=1 type=1>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>Offer
     valid for India users only.</span><span lang=EN-GB style='font-size:11.5pt;
     font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
     mso-bidi-font-family:"Times New Roman";mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>The
     cashback will be in the <span class=GramE>form<span
     style='mso-spacerun:yes'>  </span>Wallet</span> cash which can be redeemed
     with your next Transaction/ Shopping with us.</span><span lang=EN-GB
     style='font-size:11.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
     "Times New Roman";mso-bidi-font-family:"Times New Roman";mso-fareast-language:
     EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>The
     cashback will be valid for 120 days from the date of order placed. Check
     your Email for the actual expiry date of cashback.</span><span lang=EN-GB
     style='font-size:11.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
     "Times New Roman";mso-bidi-font-family:"Times New Roman";mso-fareast-language:
     EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>As per
     cashback policy, the user will be eligible to use cashback worth 50% of
     the order value.</span><span lang=EN-GB style='font-size:11.5pt;
     font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
     mso-bidi-font-family:"Times New Roman";mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>Check
     your cashback amount on&nbsp;https://milknberries.com/account.aspx</span><span
     lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>A
     customer can earn cashback up to 1 lakh in their lifetime.</span><span
     lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>Under no
     circumstances will you be entitled to withdraw the eligible cashback
     amount into your bank account or otherwise ask for a cash withdrawal. The
     cashback amount will be applied as a discount for your eligible purchases.
     The cashback amount cannot be credited into any pre-paid instrument issued
     under applicable RBI laws.</span><span lang=EN-GB style='font-size:11.5pt;
     font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
     mso-bidi-font-family:"Times New Roman";mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span class=SpellE><span lang=EN-GB style='font-size:11.5pt;
     font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
     mso-bidi-font-family:"Times New Roman";color:black;mso-color-alt:windowtext;
     mso-fareast-language:EN-GB'>Mogal</span></span><span lang=EN-GB
     style='font-size:11.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
     "Times New Roman";mso-bidi-font-family:"Times New Roman";color:black;
     mso-color-alt:windowtext;mso-fareast-language:EN-GB'> enterprise reserves
     the right to employ reasonable technological and other methods to prevent
     abuse of the Offer terms. Further, you acknowledge that <span
     class=SpellE>Mogal</span> enterprise’s decision to take certain actions,
     including limiting access to your offer, placing holds or imposing
     reserves, may be based on confidential criteria that is essential to our
     management of risk, the security of users’ accounts, comply with
     applicable laws and the otherwise protect the <span class=SpellE>Mogal</span>
     enterprise system. You agree that <span class=SpellE>Mogal</span>
     enterprise is under no obligation to disclose the details of its risk
     management or its security procedures to you. Transactions processed
     through Virtual Cards will not be eligible for this cashback.</span><span
     lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>If your
     order is <span class=SpellE>canceled</span> by the payer /refunded by the
     merchant, <span class=SpellE>Mogal</span> enterprise cashback that has
     been awarded to your account will be withdrawn.</span><span lang=EN-GB
     style='font-size:11.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:
     "Times New Roman";mso-bidi-font-family:"Times New Roman";mso-fareast-language:
     EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>In case
     of cancellations/ refunds where awarded cashback is used or <span
     class=GramE>For</span> partial cancellations, a refund will be processed
     as per <span class=SpellE>Mogal</span> enterprise policies.</span><span
     lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>In cases
     of fraudulent/suspicious transactions, <span class=SpellE>Mogal</span>
     enterprise solely reserves the right to revoke the cashback offer/ not
     award the cashback at all.</span><span lang=EN-GB style='font-size:11.5pt;
     font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
     mso-bidi-font-family:"Times New Roman";mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>In
     addition to the above, this offer is also subject to <span class=SpellE>Mogal</span>
     enterprise general Terms of Use.</span><span lang=EN-GB style='font-size:
     11.5pt;font-family:"Lato",sans-serif;mso-fareast-font-family:"Times New Roman";
     mso-bidi-font-family:"Times New Roman";mso-fareast-language:EN-GB'><o:p></o:p></span></li>
 <li class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
     line-height:normal;mso-list:l0 level1 lfo6;tab-stops:list .5in;background:
     white'><span lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     color:black;mso-color-alt:windowtext;mso-fareast-language:EN-GB'>Cashback
     is eligible only on the paid amount. No cashback will be available on the
     payment made using wallet <span class=GramE>money .</span></span><span
     lang=EN-GB style='font-size:11.5pt;font-family:"Lato",sans-serif;
     mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
     mso-fareast-language:EN-GB'><o:p></o:p></span></li>
</ol>

        </div>

        <%--<div class="container__nav">
          <small>By clicking 'Accept' you are agreeing to our terms and conditions.</small>
          <a class="button" href="#">Accept</a>
        </div>--%>
      </section>
    </main>
</asp:Content>

