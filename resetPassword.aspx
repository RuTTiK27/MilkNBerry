<%@ Page Title="Milk And Berries - Reset Password" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="resetPassword.aspx.cs" Inherits="resetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .height-100 {
    height: 100vh
}

.card {
    width: 400px;
    border: none;
    height: 300px;
    box-shadow: 0px 5px 20px 0px #d2dae3;
    z-index: 1;
    display: flex;
    justify-content: center;
    align-items: center
}

.card h6 {
    color: black;
    font-size: 20px
}

.inputs input {
    width: 40px;
    height: 40px
}

input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    -moz-appearance: none;
    margin: 0
}

.card-2 {
    background-color: #fff;
    padding: 10px;
    width: 350px;
    height: 100px;
    bottom: -50px;
    left: 20px;
    position: absolute;
    border-radius: 5px
}

.card-2 .content {
    margin-top: 50px
}

.card-2 .content a {
    color: black
}

.form-control:focus {
    box-shadow: none;
    border: 2px solid black
}

.validate {
    border-radius: 20px;
    height: 40px;
    background-color: black;
    border: 1px solid black;
    width: 140px
}
    </style>
    <script>
        function onlyInteger() {
            if (document.getElementById('ContentPlaceHolder1_TextBox1').value >= 0 && document.getElementById('ContentPlaceHolder1_TextBox1').value <= 9) {

            }
            else {
                document.getElementById('ContentPlaceHolder1_TextBox1').value = '';
            }

            if (document.getElementById('ContentPlaceHolder1_TextBox2').value >= 0 && document.getElementById('ContentPlaceHolder1_TextBox2').value <= 9) {

            }
            else {
                document.getElementById('ContentPlaceHolder1_TextBox2').value = '';
            }

            if (document.getElementById('ContentPlaceHolder1_TextBox3').value >= 0 && document.getElementById('ContentPlaceHolder1_TextBox3').value <= 9) {
            }
            else {
                document.getElementById('ContentPlaceHolder1_TextBox3').value = '';
            }

            if (document.getElementById('ContentPlaceHolder1_TextBox4').value >= 0 && document.getElementById('ContentPlaceHolder1_TextBox4').value <= 9) {

            }
            else {
                document.getElementById('ContentPlaceHolder1_TextBox4').value = '';
            }

            if (document.getElementById('ContentPlaceHolder1_TextBox5').value >= 0 && document.getElementById('ContentPlaceHolder1_TextBox5').value <= 9) {
            }
            else {
                document.getElementById('ContentPlaceHolder1_TextBox5').value = '';
            }

            if (document.getElementById('ContentPlaceHolder1_TextBox6').value >= 0 && document.getElementById('ContentPlaceHolder1_TextBox6').value <= 9) {

            }
            else {
                document.getElementById('ContentPlaceHolder1_TextBox6').value = '';
            }
        }
        document.addEventListener("DOMContentLoaded", function(event) {

        function OTPInput() {
        const inputs = document.querySelectorAll('#otp > *[id]');
                for (let i = 0; i < inputs.length; i++)
                {
                    inputs[i].addEventListener('keydown', function (event)
                    {
                        if (event.key === "Backspace")
                        {
                            inputs[i].value = ''; if (i !== 0) inputs[i - 1].focus();
                        }
                        else
                        {
                            if (i === inputs.length - 1 && inputs[i].value !== '')
                            {
                                return true;
                            }
                            else if (event.keyCode > 47 && event.keyCode < 58 || event.keyCode > 95 && event.keyCode < 106)
                            {
                                inputs[i].value = event.key;
                                if (i !== inputs.length - 1) inputs[i + 1].focus();
                                    event.preventDefault();
                            }
                        }
                    });
                }
                } OTPInput();
        });

            window.onload = function () {
                function clicka() {
                    var flag1 = 0, flag2 = 0, flag3 = 0, flag4 = 0, flag5 = 0, flag6 = 0;
                    if (document.getElementById('ContentPlaceHolder1_TextBox1').value == "" || document.getElementById('ContentPlaceHolder1_TextBox1').value == " ") {
                        document.getElementById('ContentPlaceHolder1_TextBox1').style.borderColor = "red";
                        flag1 = 1;
                    }

                    if (document.getElementById('ContentPlaceHolder1_TextBox2').value == "" || document.getElementById('ContentPlaceHolder1_TextBox2').value == " ") {
                        document.getElementById('ContentPlaceHolder1_TextBox2').style.borderColor = "red";
                        flag2 = 1;
                    }

                    if (document.getElementById('ContentPlaceHolder1_TextBox3').value == "" || document.getElementById('ContentPlaceHolder1_TextBox3').value == " ") {
                        document.getElementById('ContentPlaceHolder1_TextBox3').style.borderColor = "red";
                        flag3 = 1;
                    }

                    if (document.getElementById('ContentPlaceHolder1_TextBox4').value == "" || document.getElementById('ContentPlaceHolder1_TextBox4').value == " ") {
                        document.getElementById('ContentPlaceHolder1_TextBox4').style.borderColor = "red";
                        flag4 = 1;
                    }

                    if (document.getElementById('ContentPlaceHolder1_TextBox5').value == "" || document.getElementById('ContentPlaceHolder1_TextBox5').value == " ") {
                        document.getElementById('ContentPlaceHolder1_TextBox5').style.borderColor = "red";
                        flag5 = 1;
                    }

                    if (document.getElementById('ContentPlaceHolder1_TextBox6').value == "" || document.getElementById('ContentPlaceHolder1_TextBox6').value == " ") {
                        document.getElementById('ContentPlaceHolder1_TextBox6').style.borderColor = "red";
                        flag6 = 1;
                    }

                    if (flag1 != 0 || flag2 != 0 || flag3 != 0 || flag4 != 0 || flag5 != 0 || flag6 != 0) {
                        return false;
                    }
                }
                document.getElementById('ContentPlaceHolder1_btnVerify').onclick = clicka;
            }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="otpVerifyPanel" runat="server">
        <div class="container height-100 d-flex justify-content-center align-items-center">
    <div class="position-relative">
        <div class="card p-2 text-center">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <h6>Please enter the one time password <br> to verify your account</h6>
            <div> <span>A code has been sent to</span> <small>your email</small> </div>
            <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                <asp:TextBox ValidationGroup="OTP" ID="TextBox1" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>
                <asp:TextBox ValidationGroup="OTP" ID="TextBox2" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>
                <asp:TextBox ValidationGroup="OTP" ID="TextBox3" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>
                <asp:TextBox ValidationGroup="OTP" ID="TextBox4" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>
                <asp:TextBox ValidationGroup="OTP" ID="TextBox5" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>
                <asp:TextBox ValidationGroup="OTP" ID="TextBox6" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>
            </div>

            <asp:RequiredFieldValidator ValidationGroup="OTP" Display="Dynamic" ControlToValidate="TextBox1" ID="rfvTxt1" runat="server"  CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ValidationGroup="OTP" Display="Dynamic" ControlToValidate="TextBox2" ID="rfvTxt2" runat="server"  CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ValidationGroup="OTP" Display="Dynamic" ControlToValidate="TextBox3" ID="rfvTxt3" runat="server"  CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ValidationGroup="OTP" Display="Dynamic" ControlToValidate="TextBox4" ID="rfvTxt4" runat="server"  CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ValidationGroup="OTP" Display="Dynamic" ControlToValidate="TextBox5" ID="rfvTxt5" runat="server"  CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ValidationGroup="OTP" Display="Dynamic" ControlToValidate="TextBox6" ID="rfvTxt6" runat="server"  CssClass="text-danger"></asp:RequiredFieldValidator>

            <div class="mt-4">
                <asp:Button ValidationGroup="OTP" ID="btnVerify" CssClass="btn btn-danger px-4 validate" runat="server" Text="Validate" OnClick="btnVerify_Click" />
            </div>
        </div>
        <div class="card-2">
            <div class="content d-flex justify-content-center align-items-center">
                <div class="content d-flex justify-content-center align-items-center"> <span>Didn't get the code <span>resent after <span id="countDown"></span></span></span>
                <asp:LinkButton ID="btnResend" CausesValidation="false" OnClick="btnResend_Click" CssClass="ms-3" runat="server">Resend</asp:LinkButton>
                
            </div>
        </div>
    </div>
</div>
    </asp:Panel>

    <asp:Panel ID="newPasswordPanel" runat="server">

        <div class="container height-100 d-flex justify-content-center align-items-center">
    <div class="position-relative">
        <div class="card p-2 text-center">
            <h6>Please enter new password for your account</h6>
            
            <div class="d-flex flex-row justify-content-center mt-2">
                <div class="row">
                    <div class="col-12">
                        <asp:TextBox ValidationGroup="newPassword" MaxLength="50" ID="newPassowrd" placeholder="New password" TextMode="Password" CssClass="form-control" style="background-color:#EEEEEE;" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="newPassword" Display="Dynamic" ControlToValidate="newPassowrd" ID="rfvNewPassowrd" runat="server" ErrorMessage="Please enter password" CssClass="text-danger"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ValidationGroup="newPassword" Display="Dynamic" ControlToValidate="newPassowrd" CssClass="text-danger"  ID="reNewPassowrd" runat="server" ErrorMessage="minimum 8 character 1 capital 1 small 1 numeric 1 special character" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=_]).*$" ></asp:RegularExpressionValidator>
                    </div>

                    <div class="col-12 mt-4">
                        <asp:TextBox ValidationGroup="newPassword" MaxLength="50" ID="newConfirmPassword"  TextMode="Password" placeholder="Enter confirm password" CssClass="form-control" style="background-color:#EEEEEE;" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="newPassword" Display="Dynamic" ControlToValidate="newConfirmPassword" ID="rfvNewConfirmPassword" runat="server" ErrorMessage="Please enter confirm password" CssClass="text-danger"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ValidationGroup="newPassword" Display="Dynamic" ControlToValidate="newConfirmPassword" CssClass="text-danger"  ID="reNewConfirmPassword" runat="server" ErrorMessage="minimum 8 character 1 capital 1 small 1 numeric 1 special character" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=_]).*$" ></asp:RegularExpressionValidator>
                <asp:CompareValidator ValidationGroup="newPassword" Display="Dynamic" ControlToValidate="newConfirmPassword" ControlToCompare="newPassowrd" ID="cvNewConfirmPassword" runat="server" ErrorMessage="New password and new confirm password are not same" CssClass="text-danger"></asp:CompareValidator>
                    </div>
                </div>
            </div>
            <div class="mt-4">
                <asp:Button ValidationGroup="newPassword" ID="btnUpdatePassword" CssClass="btn btn-dark" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click"  />
            </div>
        </div>
        
    </div>
</div>
    </asp:Panel>
    <script>
        function submitPoll() {
            document.getElementById("ContentPlaceHolder1_btnResend").classList.add('d-none');
            setTimeout(function () { document.getElementById("ContentPlaceHolder1_btnResend").classList.remove('d-none') }, 180000);
        }



        function startTimer() {
            var presentTime = document.getElementById('countDown').innerHTML;
            var timeArray = presentTime.split(/[:]+/);
            var m = timeArray[0];
            var s = checkSecond((timeArray[1] - 1));
            if (s == 59) { m = m - 1 }
            if (m < 0) {
                return
            }

            document.getElementById('countDown').innerHTML =
                m + ":" + s;
            console.log(m)
            setTimeout(startTimer, 1000);

        }

        function checkSecond(sec) {
            if (sec < 10 && sec >= 0) { sec = "0" + sec }; // add zero in front of numbers < 10
            if (sec < 0) { sec = "59" };
            return sec;
        }

        window.onload()
        {
            submitPoll();
            document.getElementById('countDown').innerHTML = 02 + ":" + 59;
            startTimer();
        }
        </script>
</asp:Content>