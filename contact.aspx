<%@ Page Title="Milk And Berries - Contact Us" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    body {
  font-family: "Roboto", sans-serif;
  background-color: #fff;
  line-height: 1.9;
  color: #8c8c8c;
  position: relative; }
  body:before {
    z-index: -1;
    position: absolute;
    height: 50vh;
    content: "";
    top: 0;
    left: 0;
    right: 0;
    background: #FFF; }

h1, h2, h3, h4, h5, h6,
.h1, .h2, .h3, .h4, .h5, .h6 {
  font-family: "Roboto", sans-serif;
  color: #000; }

a {
  -webkit-transition: .3s all ease;
  -o-transition: .3s all ease;
  transition: .3s all ease; }
  a, a:hover {
    text-decoration: none !important; }

.text-black {
  color: #000; }

.content {
  padding: 7rem 0; }

.heading {
  font-size: 2.5rem;
  font-weight: 900; }

.form-control {
  border: none;
  border-bottom: 1px solid #ccc;
  padding-left: 0;
  padding-right: 0;
  border-radius: 0;
  background: none; }
  .form-control:active, .form-control:focus {
    outline: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-color: #000; }

.col-form-label {
  color: #000;
  font-size: 13px; }

.btnC, .form-control, .custom-select {
  height: 45px; }

.custom-select:active, .custom-select:focus {
  outline: none;
  -webkit-box-shadow: none;
  box-shadow: none;
  border-color: #000; }

.btnC {
  border: none;
  border-radius: 0;
  font-size: 12px;
  letter-spacing: .2rem;
  text-transform: uppercase; }
  .btnC.btnC-primary {
    background: #1F1F1F;
    color: #fff;
    padding: 15px 20px; }
  .btnC:hover {
    color: #fff; }
  .btnC:active, .btnC:focus {
    outline: none;
    -webkit-box-shadow: none;
    box-shadow: none; }

.contact-wrap {
  -webkit-box-shadow: 0 0px 20px 0 rgba(0, 0, 0, 0.3);
  box-shadow: 0 0px 20px 0 rgba(0, 0, 0, 0.3); }
  .contact-wrap .col-form-label {
    font-size: 14px;
    color: #b3b3b3;
    margin: 0 0 10px 0;
    display: inline-block;
    padding: 0; }
  .contact-wrap .form, .contact-wrap .contact-info {
    padding: 40px; }
  .contact-wrap .contact-info {
    color: rgba(255, 255, 255, 0.5); }
    .contact-wrap .contact-info ul li {
      margin-bottom: 15px;
      color: rgba(255, 255, 255, 0.5); }
      .contact-wrap .contact-info ul li .wrap-icon {
        font-size: 20px;
        color: #fff;
        margin-top: 5px; }
  .contact-wrap .form {
    background: #fff; }
    .contact-wrap .form h3 {
      color: #35477d;
      font-size: 20px;
      margin-bottom: 30px; }
  .contact-wrap .contact-info {
    background: #1f1f1f; }
    .contact-wrap .contact-info h3 {
      color: #fff;
      font-size: 20px;
      margin-bottom: 30px; }

label.error {
  font-size: 12px;
  color: red; }

#message {
  resize: vertical; }

#form-message-warning, #form-message-success {
  display: none; }

#form-message-warning {
  color: #B90B0B; }

#form-message-success {
  color: #55A44E;
  font-size: 18px;
  font-weight: bold; }

.submitting {
  float: left;
  width: 100%;
  padding: 10px 0;
  display: none;
  font-weight: bold;
  font-size: 12px;
  color: #000; }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
    
    <div class="container">
      <div class="row align-items-stretch no-gutters contact-wrap">
        <div class="col-md-8">
          <div class="form h-100">
            <h3>Send us a message</h3>
              

                  <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                      <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                      </symbol>
                    </svg>


                    <div runat="server" ID="successMessage" role="alert">
                      <svg class="bi flex-shrink-0 me-2"  width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                      <div>
                        Message successfully sent!
                      </div>
                    </div>


            <div class="mb-5">
              <div class="row">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                <div class="col-md-6 form-group mb-5">
                  <label for="txtName" class="col-form-label">Name *</label>
                    <asp:TextBox ValidationGroup="contact" ID="txtName" runat="server" MaxLength="40" placeholder="Your name" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="contact" CssClass="text-danger" Display="Dynamic" ID="rfvtxtName" ControlToValidate="txtName" runat="server" ErrorMessage="Please enter name"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6 form-group mb-5">
                  <label for="" class="col-form-label">Email *</label>
                    <asp:TextBox ValidationGroup="contact" ID="txtEmail" runat="server" MaxLength="50" placeholder="Your email" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="contact" CssClass="text-danger" Display="Dynamic" ID="rfvEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="Please enter email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="contact" Display="Dynamic" ControlToValidate="txtEmail" ID="reEmail"  CssClass="text-danger" runat="server" ErrorMessage="Email id is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 form-group mb-5">
                  <label for="" class="col-form-label">Phone *</label>
                    <asp:TextBox ValidationGroup="contact" ID="txtPhone" runat="server" MaxLength="10" placeholder="Phone" minlength="10"  CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="contact" CssClass="text-danger" Display="Dynamic" ID="rfvPhone" ControlToValidate="txtPhone" runat="server" ErrorMessage="Please mobile number"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="contact" ID="rePhone" Display="Dynamic" ControlToValidate="txtPhone" runat="server" ErrorMessage="Mobile number not valid" CssClass="text-danger" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 form-group mb-5">
                  <label for="message" class="col-form-label">Message *</label>
                    <asp:TextBox ValidationGroup="contact" ID="txtMessage" runat="server" MaxLength="500" placeholder="Write your message" Columns="30" Rows="4" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="contact" CssClass="text-danger" Display="Dynamic" ID="rfvMessage" ControlToValidate="txtMessage" runat="server" ErrorMessage="Please enter message"></asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                        <asp:Button ValidationGroup="contact" ID="btnSubmit" runat="server" Text="Send Message" CssClass="btnC btnC-primary rounded-0 py-2 px-4" OnClick="btnSubmit_Click" />
                </div>
              </div>
            </div>

            <div id="form-message-warning mt-4"></div> 
            <div id="form-message-success">
              Your message was sent, thank you!
            </div>

          </div>
        </div>
        <div class="col-md-4">
          <div class="contact-info h-100">
            <h3>Contact Information</h3>
            
            <ul class="list-unstyled">
              <li class="d-flex">
                <span class="wrap-icon icon-room mr-3"></span>
                <span class="text">216 Gajanan Business Hub Near Elecon Garden Anand Lambvel Road  <br /> Anand - 388 001</span>
              </li>
                <li class="d-flex">
                <span class="wrap-icon icon-phone mr-3"></span>
                <span class="text">Gaurav Khimanand Lagariya</span>
              </li>
              <li class="d-flex">
                <span class="wrap-icon icon-phone mr-3"></span>
                <span class="text">+91 8866377595</span>
              </li>
              <li class="d-flex">
                <span class="wrap-icon icon-envelope mr-3"></span>
                <span class="text">info@milknberries.com</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

  </div>
</asp:Content>

