<%@ Page Title="Milk And Berries - Refund" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="refund.aspx.vb" Inherits="refund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"><style>
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
          <h2>Refund & Cancelation</h2>
        </div>
        <div class="container__content">
          
            <p style='background:white'><strong><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>Shipping Policy</span></strong><span lang=EN-GB
style='font-family:"Arial",sans-serif;color:#4D4D4D'><o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>We usually ship the product within 2 working days after
receiving the order and try and deliver them within 10 working days.<o:p></o:p></span></p>

<p style='background:white'><strong><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>Cancellation Policy</span></strong><span lang=EN-GB
style='font-family:"Arial",sans-serif;color:#4D4D4D'><o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>As per our policy cancellation policy you can cancel your order
by 2 working days after that no cancellation of orders is&nbsp;allowed once
shipped. <span class=GramE>However</span> returns are accepted as per our
return policy. Refunds, if applicable, shall be initiated within 10 working
days from the date of acceptance of the returns of goods as per standard
policy. The returns it will be processed through same mode within 10 working
days<o:p></o:p></span></p>

<p style='background:white'><strong><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>Returns</span></strong><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'><o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>Our policy lasts 7 days from date of delivery. If more than 7
days have gone by since your purchase, unfortunately we can’t offer you a
refund or exchange. We <span class=SpellE><span class=GramE>wont</span></span>
accept the return if the product is opened or used once. <br>
<br>
In general, an item may be eligible for return within the applicable return
window if it fulfils one or more of the following conditions:<br>
- Was delivered in a physically damaged condition<br>
- Is a different product from what was ordered<br>
<br>
To be eligible for a return, your item must be returned in their original
condition, with the labels and plastic cap protection <span class=SpellE>in
tact</span>. <br>
To complete your return, we require a receipt or proof of purchase, image of
the condition of the product. Please do not send your purchase back to the
manufacturer.<o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>To return your product, you should mail your product to:<o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>216, Gajanan the business hub, near <span class=SpellE>elecon</span>
<span class=SpellE>baug</span> <span class=SpellE>lambvel</span> <span
class=GramE>road ,</span> Anand 388001<br>
If you receive a refund, the cost of shipping will be deducted from your refund,
and you can opt for cashback to your wallet or return to your bank account. <br>
<br>
Depending on where you live, the time it may take for your exchanged product to
reach you, may vary.<br>
<br>
Please consider using a trackable shipping service or purchasing shipping
insurance. We don’t guarantee that we will receive your returned item.<o:p></o:p></span></p>

<p style='background:white'><strong><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>Refunds (if applicable)</span></strong><span lang=EN-GB
style='font-family:"Arial",sans-serif;color:#4D4D4D'><o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>Once your return is received and inspected, we will send you an
email to notify you that we have received your returned item. We will also
notify you of the approval or rejection of your refund.<o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'><o:p>&nbsp;</o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>If approved, you can opt for bank account or cashback wallet, <span
class=GramE>If</span> you opt for bank account then you might have to give
details to our executives regarding bank accounts. By default, you will receive
refunds in your cashback wallet. Once you receive in your wallet, we won’t be
able to convert it in your bank accounts.<o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'><br>
<strong><span style='font-family:"Arial",sans-serif'>Late or missing refunds
(if applicable)</span></strong><o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>If you haven’t received a refund yet, first check your bank
account again. Then contact your bank, it may take some time before your refund
is officially posted.<br>
Next contact your bank. There is often some processing time before a refund is
posted.<br>
If you’ve done all of this and you still have not received your refund yet,
please contact us at info@milknberries.com<br>
<br>
<strong><span style='font-family:"Arial",sans-serif'>Exchanges (if applicable)</span></strong><o:p></o:p></span></p>

<p style='background:white'><span lang=EN-GB style='font-family:"Arial",sans-serif;
color:#4D4D4D'>We only replace items if they are defective or damaged. If you
need to exchange it for the same item, send us an email at info@milknberries.com
and send your item to:&nbsp;216, Gajanan the business hub, near <span
class=SpellE>elecon</span> <span class=SpellE>baug</span> <span class=SpellE>lambvel</span>
<span class=GramE>road ,</span> Anand 388001<br style='mso-special-character:
line-break'>
<![if !supportLineBreakNewLine]><br style='mso-special-character:line-break'>
<![endif]><o:p></o:p></span></p>

        </div>

        <%--<div class="container__nav">
          <small>By clicking 'Accept' you are agreeing to our terms and conditions.</small>
          <a class="button" href="#">Accept</a>
        </div>--%>
      </section>
    </main>
    

</asp:Content>

