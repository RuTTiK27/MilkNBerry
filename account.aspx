<%@ Page Title="Milk And Berries - Account" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="account.aspx.cs" Inherits="account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .mainDiv0 {
            display: grid;
            height: 100%;
            width: 100%;
            place-items: center;
            background: -webkit-linear-gradient(left, #000, #1f1f1f);
        }

        ::selection {
            background: #000;
            color: #fff;
        }

        .wrapper {
            overflow: hidden;
            max-width: 390px;
            background: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
        }

            .wrapper .title-text {
                display: flex;
                width: 200%;
            }

            .wrapper .title {
                width: 50%;
                font-size: 35px;
                font-weight: 600;
                text-align: center;
                transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
            }

            .wrapper .slide-controls {
                position: relative;
                display: flex;
                height: 50px;
                width: 100%;
                overflow: hidden;
                margin: 30px 0 10px 0;
                justify-content: space-between;
                border: 1px solid lightgrey;
                border-radius: 5px;
            }

        .slide-controls .slide {
            height: 100%;
            width: 100%;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            text-align: center;
            line-height: 48px;
            cursor: pointer;
            z-index: 1;
            transition: all 0.6s ease;
        }

        .slide-controls label.signup {
            color: #000;
        }

        .slide-controls .slider-tab {
            position: absolute;
            height: 100%;
            width: 50%;
            left: 0;
            z-index: 0;
            border-radius: 5px;
            background: -webkit-linear-gradient(left, #000, #1f1f1f);
            transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
        }

        input[type="radio"] {
            display: none;
        }

        #signup:checked ~ .slider-tab {
            left: 50%;
        }

        #signup:checked ~ label.signup {
            color: #fff;
            cursor: default;
            user-select: none;
        }

        #signup:checked ~ label.login {
            color: #000;
        }

        #login:checked ~ label.signup {
            color: #000;
        }

        #login:checked ~ label.login {
            cursor: default;
            user-select: none;
        }

        .wrapper .form-container {
            width: 100%;
            overflow: hidden;
        }

        .form-container .form-inner {
            display: flex;
            width: 200%;
        }

            .form-container .form-inner .formTag {
                width: 50%;
                transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
            }

        .form-inner .formTag .field {
            height: 50px;
            width: 100%;
            margin-top: 20px;
        }

            .form-inner .formTag .field input {
                height: 100%;
                width: 100%;
                outline: none;
                padding-left: 15px;
                border-radius: 5px;
                border: 1px solid lightgrey;
                border-bottom-width: 2px;
                font-size: 17px;
                transition: all 0.3s ease;
            }

                .form-inner .formTag .field input:focus {
                    border-color: #000;
                    box-shadow: inset 0 0 3px #000;
                }

                .form-inner .formTag .field input::placeholder {
                    color: #999;
                    transition: all 0.3s ease;
                }

        form .field input:focus::placeholder {
            /*color: #000;*/
        }

        .form-inner .formTag .pass-link {
            margin-top: 5px;
        }

        .form-inner .formTag .signup-link {
            text-align: center;
            margin-top: 30px;
        }

            .form-inner .formTag .pass-link a,
            .form-inner .formTag .signup-link a {
                color: #000;
                text-decoration: underline;
            }

                .form-inner .formTag .pass-link a:hover,
                .form-inner .formTag .signup-link a:hover {
                    text-decoration: underline;
                }

        .formTag .btn {
            height: 50px;
            width: 100%;
            border-radius: 5px;
            position: relative;
            overflow: hidden;
        }

            .formTag .btn .btn-layer {
                height: 100%;
                width: 300%;
                position: absolute;
                left: -100%;
                background: -webkit-linear-gradient(right, #000, #1f1f1f, #000, #1f1f1f);
                border-radius: 5px;
                transition: all 0.4s ease;
            }

            .formTag .btn:hover .btn-layer {
                left: 0;
            }

            .formTag .btn input[type="submit"] {
                height: 100%;
                width: 100%;
                z-index: 1;
                position: relative;
                background: none;
                border: none;
                color: #fff;
                padding-left: 0;
                border-radius: 5px;
                font-size: 20px;
                font-weight: 500;
                cursor: pointer;
            }

        textarea:focus,
        textarea.form-control:focus,
        input.form-control:focus,
        input[type=text]:focus,
        input[type=password]:focus,
        input[type=email]:focus,
        input[type=number]:focus,
        [type=text].form-control:focus,
        [type=password].form-control:focus,
        [type=email].form-control:focus,
        [type=tel].form-control:focus,
        [contenteditable].form-control:focus {
            box-shadow: inset 0 -1px 0 #ddd;
        }
        /*-----------------*/
        /*Panel 2:*/
        .mainDiv {
            background-color: #f9f9fa
        }

        .padding {
            padding: 3rem !important
        }

        .user-card-full {
            overflow: hidden
        }

        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
            box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
            border: none;
            margin-bottom: 30px
        }

        .m-r-0 {
            margin-right: 0px
        }

        .m-l-0 {
            margin-left: 0px
        }

        .user-card-full .user-profile {
            border-radius: 5px 0 0 5px
        }

        .bg-c-lite-green {
            background: -webkit-gradient(linear, left top, right top, from(#f29263), to(#ee5a6f));
            background: linear-gradient(to right, #f29263, #ee5a6f)
        }

        .user-profile {
            padding: 20px 0
        }

        .card-block {
            padding: 1.25rem
        }

        .m-b-25 {
            margin-bottom: 25px
        }

        .img-radius {
            border-radius: 5px
        }

        h6 {
            font-size: 14px
        }

        .card .card-block p {
            line-height: 25px
        }

        @media only screen and (min-width: 1400px) {
            p {
                font-size: 14px
            }
        }

        .card-block {
            padding: 1.25rem
        }

        .b-b-default {
            border-bottom: 1px solid #e0e0e0
        }

        .m-b-20 {
            margin-bottom: 20px
        }

        .p-b-5 {
            padding-bottom: 5px !important
        }

        .card .card-block p {
            line-height: 25px
        }

        .m-b-10 {
            margin-bottom: 10px
        }

        .text-muted {
            color: #919aa3 !important
        }

        .b-b-default {
            border-bottom: 1px solid #e0e0e0
        }

        .f-w-600 {
            font-weight: 600
        }

        .m-b-20 {
            margin-bottom: 20px
        }

        .m-t-40 {
            margin-top: 20px
        }

        .p-b-5 {
            padding-bottom: 5px !important
        }

        .m-b-10 {
            margin-bottom: 10px
        }

        .m-t-40 {
            margin-top: 20px
        }

        .user-card-full .social-link li {
            display: inline-block
        }

            .user-card-full .social-link li a {
                font-size: 20px;
                margin: 0 10px 0 0;
                -webkit-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out
            }

        @media only screen and (max-width: 576px) {

            .padding {
                padding: 1px !important
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>

    <asp:Panel ID="panelBeforeLogin" runat="server">
        <div class="mainDiv0 pt-5 pb-5">
            <div class="wrapper">
                <div class="title-text">
                    <div class="title login">
                        Login Form
                    </div>
                    <div class="title signup">
                        Signup Form
                    </div>
                </div>

                <div runat="server" id="alreadyExistEmail" class="alert alert-danger" style="display: none;">
                    Email already exist!  
                </div>


                <div runat="server" id="permenentBan" class="alert alert-danger" style="display: none;">
                    Your account is locked <a href="contact.aspx">Contact us</a> for unlock. 
                </div>

                <div runat="server" id="wrongEmailOrPassword" class="alert alert-danger" style="display: none;">
                    Email or password wrong!  
                </div>

                <div class="form-container">
                    <div class="slide-controls">
                        <input type="radio" name="slide" id="login" checked>
                        <input type="radio" name="slide" id="signup">
                        <label for="login" class="slide login">Login</label>
                        <label for="signup" class="slide signup">Signup</label>
                        <div class="slider-tab"></div>
                    </div>
                    <div class="form-inner">
                        <div action="#" class="login formTag">
                            <div class="field">
                                <asp:TextBox ValidationGroup="login" MaxLength="50" ID="txtLoginEmail" placeholder="Email" CssClass="form-control input" runat="server" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="login" Display="Dynamic" ControlToValidate="txtLoginEmail" ID="rfvLoginEmail" runat="server" ErrorMessage="Please enter email" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblForForgorPassword" Style="display: none;" CssClass="text-danger" runat="server" Text="Please enter email"></asp:Label>

                            </div>
                            <div class="field">
                                <asp:TextBox MaxLength="50" ValidationGroup="login" ID="txtLoginPassword" placeholder="Password" CssClass="form-control input" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="login" Display="Dynamic" ControlToValidate="txtLoginPassword" ID="rfvLoginPassword" runat="server" ErrorMessage="Please enter password" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                            <div class="pass-link mt-4">
                                <asp:Button ID="btnForgotPassword" BorderStyle="None" CausesValidation="false" Style="background-color: #FFFFFF;" CssClass="a-for-account" runat="server" Text="Forgot your password?" OnClick="btnForgotPassword_Click" />
                                <%--<a href="#">Forgot password?</a>--%>
                            </div>
                            <div class="field btn">
                                <div class="btn-layer"></div>
                                <asp:Button ID="btnLogin" ValidationGroup="login" CssClass="button" runat="server" Text="Sign In" OnClick="btnLogin_Click" />
                                <%--<input type="submit" value="Login">--%>
                            </div>
                            <div class="signup-link">
                                Not a member? <a href="">Signup now</a>
                            </div>
                        </div>
                        <div action="#" class="signup formTag">
                            <div class="field">
                                <asp:TextBox ValidationGroup="register" MaxLength="40" ID="firstName" placeholder="First Name" CssClass="form-control input" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="firstName" ID="rfvFirstName" runat="server" ErrorMessage="Please enter first name" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                            <div class="field">
                                <asp:TextBox ValidationGroup="register" MaxLength="40" ID="lastName" placeholder="Last Name" CssClass="form-control input" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="lastName" ID="rfvLastName" runat="server" ErrorMessage="Please enter last name" CssClass="text-danger"></asp:RequiredFieldValidator>

                            </div>
                            <div class="field">
                                <asp:TextBox ValidationGroup="register" MaxLength="50" ID="registerEmail" placeholder="Email" CssClass="form-control input" runat="server" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="registerEmail" ID="rfvEmail" runat="server" ErrorMessage="Please enter email" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="registerEmail" ID="reEmail" CssClass="text-danger" runat="server" ErrorMessage="Email id is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>

                            <div class="field">
                                <asp:TextBox ValidationGroup="register" MaxLength="50" ID="registerPassword" placeholder="Password" TextMode="Password" CssClass="form-control input" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="registerPassword" ID="rfvRegisterPassword" runat="server" ErrorMessage="Please enter password" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="registerPassword" CssClass="text-danger" ID="reRegisterPassword" runat="server" ErrorMessage="Password should be alphanumeric" ValidationExpression="[a-zA-Z0-9]*$"></asp:RegularExpressionValidator>
                            </div>

                            <div class="field">
                                <asp:TextBox ValidationGroup="register" MaxLength="50" ID="registerConfirmPassword" TextMode="Password" placeholder="Enter confirm password" CssClass="form-control input" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="registerConfirmPassword" ID="rfvRegisterConfirmPassword" runat="server" ErrorMessage="Please enter confirm password" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ValidationGroup="register" Display="Dynamic" ControlToValidate="registerConfirmPassword" ControlToCompare="registerPassword" ID="compareValidatorRegisterConfirmPassword" runat="server" ErrorMessage="Password and confirm password are not same" CssClass="text-danger"></asp:CompareValidator>
                            </div>
                            <div class="field btn">
                                <div class="btn-layer"></div>
                                <asp:Button ValidationGroup="register" ID="btnRegister" CssClass="button" runat="server" Text="Sign Up" OnClick="btnRegister_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>

    <asp:Panel ID="panelAfterLogin" runat="server">

        <div class="w-100 d-flex justify-content-center mt-5 mb-5">
            <div id="forMobile" class="row w-25 shadow-lg p-2 rounded">
                <div class="col-12 d-flex justify-content-end mb-2">
                    <asp:LinkButton ID="btnSignOut" CssClass="btn btn-dark rounded-pill btn-sm" OnClick="btnSignOut_Click1" runat="server">Sign out 🚪</asp:LinkButton>
                </div>
                <div class="col-12 mb-3">
                    <div class="row">
                        <div class="col-3">
                            <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image">
                        </div>
                        <div class="col-9 d-flex align-items-center">
                            <asp:Label ID="lblFullName" CssClass="f-w-600 m-3" runat="server" Text="Full Name"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="col-12 mb-3">

                    <div class="row">
                        <div class="col-3 my-1">
                            Email
                        </div>
                        <div class="col-9 my-1">
                            <asp:Label CssClass="f-w-400" ID="lblEmail" runat="server" Text="Customer Email"></asp:Label>
                        </div>

                        <div class="col-3 my-1">
                            Balance
                        </div>
                        <div class="col-9 my-1">
                            ₹<asp:Label ID="lblBalance" CssClass="f-w-600" runat="server" Text="Balance"></asp:Label>
                        </div>
                    </div>

                </div>

                <div class="col-12 mb-3">

                    <div class="row">
                        <div class="col-3 my-1">
                            My Orders
                        </div>
                        <div class="col-9 my-1">
                            <asp:Button ID="btnOrders" OnClick="btnOrders_Click" CssClass="btn btn-dark rounded-pill btn-sm" runat="server" Text="View  🚚" />
                        </div>

                        <div class="col-3 my-1">
                            Cart
                        </div>
                        <div class="col-9 my-1">
                            <asp:Button ID="btnCart" OnClick="btnCart_Click" CssClass="btn btn-dark rounded-pill btn-sm" runat="server" Text="Cart 🛒" />
                        </div>

                        <div class="col-3 my-1">
                            Password
                        </div>
                        <div class="col-9 my-1">
                            <asp:Button ID="btnResetPassword" OnClick="btnResetPassword_Click" CssClass="btn btn-dark rounded-pill btn-sm" runat="server" Text="Change Password ✏" />
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <%--<div class="mainDiv">
            <div class="page-content page-container" id="page-content">
                <div class="padding">
                    <div class="row container d-flex justify-content-center">
                        <div class="col-xl-6 col-md-12">
                            <div class="card user-card-full">
                                <div class="row m-l-0 m-r-0">
                                    <div class="col-sm-4 bg-c-lite-green user-profile">
                                        <div class="card-block text-center text-white">
                                            <div class="m-b-0">
                                                <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image">
                                            </div>
                                            <h6>
                                                <asp:Label ID="lblFullName" CssClass="f-w-600" runat="server" Text="Full Name"></asp:Label>
                                            </h6>

                                            <h6>
                                                <asp:Label ID="lblBalance" CssClass="f-w-600" runat="server" Text="Balance"></asp:Label>
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="card-block">
                                            <div class="row m-b-20 p-b-5 b-b-default f-w-600">
                                                <div class="col-6 d-flex align-items-center">
                                                    Information
                                                </div>
                                                <div class="col-6 d-flex justify-content-end">
                                                    <asp:LinkButton ID="btnSignOut" CssClass="btn btn-dark rounded-pill btn-sm" OnClick="btnSignOut_Click1" runat="server">Sign out 🚪</asp:LinkButton>
                                                </div>
                                            </div>



                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <span class="m-b-10 f-w-600">First Name</span>
                                                    <br />
                                                    <asp:Label CssClass="text-muted f-w-400" ID="lblFirstName" runat="server" Text="User"></asp:Label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <span class="m-b-10 f-w-600">Last Name</span>
                                                    <br />
                                                    <asp:Label CssClass="text-muted f-w-400" ID="lblLastName" runat="server" Text="Name"></asp:Label>
                                                </div>
                                                <div class="col-sm-12">
                                                    <br />
                                                    <span class="m-b-10 f-w-600">Email</span>
                                                    <br />
                                                    <asp:Label CssClass="text-muted f-w-400" ID="lblEmail" runat="server" Text="Customer Email"></asp:Label>
                                                </div>

                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">My orders</p>
                                                    <asp:Button ID="btnOrders" OnClick="btnOrders_Click" CssClass="btn btn-dark rounded-pill btn-sm" runat="server" Text="View  🚚" />
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Cart</p>
                                                    <asp:Button ID="btnCart" OnClick="btnCart_Click" CssClass="btn btn-dark rounded-pill btn-sm" runat="server" Text="Cart 🛒" />

                                                </div>
                                            </div>
                                            <hr />
                                            <p class="m-b-10 f-w-600">Password</p>
                                            <asp:Button ID="btnResetPassword" OnClick="btnResetPassword_Click" CssClass="btn btn-dark rounded-pill btn-sm" runat="server" Text="Change Password ✏" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </asp:Panel>
    <script>
        if (document.getElementById('ContentPlaceHolder1_panelBeforeLogin')) {
            document.getElementById("ContentPlaceHolder1_btnLogin").onclick = function () {
                document.getElementById("ContentPlaceHolder1_lblForForgorPassword").style.display = "none";
            };

            const loginText = document.querySelector(".title-text .login");
            const loginForm = document.querySelector(".formTag.login");
            const loginBtn = document.querySelector("label.login");
            const signupBtn = document.querySelector("label.signup");
            const signupLink = document.querySelector(".formTag .signup-link a");
            signupBtn.onclick = (() => {
                loginForm.style.marginLeft = "-50%";
                loginText.style.marginLeft = "-50%";
            });
            loginBtn.onclick = (() => {
                loginForm.style.marginLeft = "0%";
                loginText.style.marginLeft = "0%";
            });
            signupLink.onclick = (() => {
                signupBtn.click();
                return false;
            });

            let value = document.getElementById("ContentPlaceHolder1_alreadyExistEmail");
            //alert(value.style.display);
            if (value.style.display == "block") {

                loginForm.style.marginLeft = "-50%";
                loginText.style.marginLeft = "-50%";
            }
        }


        if (document.getElementById('ContentPlaceHolder1_panelAfterLogin')) {
            function myFunction(x) {
                if (x.matches) { // If media query matches
                    document.getElementById('forMobile').classList.remove('w-25')
                    document.getElementById('forMobile').classList.add('w-100')
                } else {
                    document.getElementById('forMobile').classList.remove('w-100')
                    document.getElementById('forMobile').classList.add('w-25')
                }
            }

            function myFunction2(y) {
                if (y.matches) { // If media query matches
                    document.getElementById('forMobile').classList.remove('w-25')
                    document.getElementById('forMobile').classList.add('w-50')
                } else {
                    document.getElementById('forMobile').classList.remove('w-50')
                    document.getElementById('forMobile').classList.add('w-25')
                }
            }

            function myFunction3(z) {
                if (z.matches) { // If media query matches
                    document.getElementById('forMobile').classList.remove('w-25')
                    document.getElementById('forMobile').classList.add('w-75')
                } else {
                    document.getElementById('forMobile').classList.remove('w-75')
                    document.getElementById('forMobile').classList.add('w-25')
                }
            }
            var x = window.matchMedia("(max-width: 576px)")
            var y = window.matchMedia("(max-width: 768px)")
            var z = window.matchMedia("(max-width: 1250px)")
            myFunction(x) // Call listener function at run time
            x.addListener(myFunction) // Attach listener function on state changes

            myFunction2(y) // Call listener function at run time
            y.addListener(myFunction2) // Attach listener function on state changes

            myFunction3(z) // Call listener function at run time
            z.addListener(myFunction3) // Attach listener function on state changes
            /*---------------------------------------------------------*/
            //const mediaQuery = window.matchMedia('(max-width: 576px)')
            //// Check if the media query is true
            //if (mediaQuery.matches) {


            //    // Then trigger an alert
            //    alert('Media Query Matched! 576')
            //} else {

            //}

        }



    </script>
</asp:Content>

