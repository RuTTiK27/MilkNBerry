<%@ Page Title="Milk And Berries - Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        select.ddl {
            text-align: left;
        }

        .ddl {
            direction: ltr;
        }

            .ddl:hover {
                color: #1f1f1f;
                background-color: #FFF;
            }
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }

        /*---------------*/

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

        .list-group-item-action:hover {
            background-color: #1f1f1f;
            border-color: #1f1f1f;
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
        document.addEventListener("DOMContentLoaded", function (event) {

            function OTPInput() {
                const inputs = document.querySelectorAll('#otp > *[id]');
                for (let i = 0; i < inputs.length; i++) {
                    inputs[i].addEventListener('keydown', function (event) {
                        if (event.key === "Backspace") {
                            inputs[i].value = ''; if (i !== 0) inputs[i - 1].focus();
                        }
                        else {
                            if (i === inputs.length - 1 && inputs[i].value !== '') {
                                return true;
                            }
                            else if (event.keyCode > 47 && event.keyCode < 58 || event.keyCode > 95 && event.keyCode < 106) {
                                inputs[i].value = event.key;
                                if (i !== inputs.length - 1) inputs[i + 1].focus();
                                event.preventDefault();
                            }
                        }
                    });
                }
            } OTPInput();
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Unable to apply promocode</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span id="customMessage">Amout is not valid</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="py-5 text-center">
            <asp:Label runat="server" ID="lblMsg"></asp:Label>

        </div>
        <asp:Panel ID="panelBeforeLogin" runat="server">
            <div class="d-flex flex-column justify-content-center align-items-center">
                <img src="https://www.canvasbay.co.uk/upload/images/empty_cart.png" class="img-fluid" style="width: 15%;" />
                <h2 class="mt-2 mb-2">Missing Cart items?</h2>
                <p class="mt-2 mb-2">Login to see the items you added previously</p>
                <a href="account.aspx" class="btn btn-dark mt-2 mb-2">Login</a>
            </div>
        </asp:Panel>

        <asp:Panel ID="panelZeroProducts" runat="server">
            <div class="d-flex flex-column justify-content-center align-items-center">
                <img src="https://www.canvasbay.co.uk/upload/images/empty_cart.png" class="img-fluid" style="width: 15%;" />
                <h2 class="mt-2 mb-2">Your cart is empty!</h2>
                <p class="mt-2 mb-2">Add items to it now.</p>
                <a href="products.aspx" class="btn btn-dark mt-2 mb-2">Shop now</a>
            </div>
        </asp:Panel>

        <asp:Panel ID="panelAfterLogin" runat="server">

            <main>
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-dark">Your cart</span>
                            <span class="badge bg-dark rounded-pill">
                                <asp:Label ID="totalProducts" runat="server"></asp:Label>
                            </span>
                        </h4>
                        <ul class="list-group mb-3">
                            <asp:ListView runat="server" ID="lv">
                                <AlternatingItemTemplate>

                                    <div class="d-flex justify-content-between">
                                        <li class="list-group-item d-flex justify-content-between align-items-center lh-sm w-100">
                                            <div>
                                                <h6 class="my-0"><%# Eval("NAME") %> <small class="">(₹<%# Eval("MRP") %> * <%# Eval("QTY") %>)
                                                    <br />
                                                    <small class="text-muted fw-bold"><%# Eval("DISCOUNTPERCENTAGE") %>% off</small></small></h6>

                                                <%--<small class="text-muted"><%# Eval("TITLE") %></small>--%>
                                            </div>
                                            <span class="fw-bold">₹<%# Eval("SUBTOTAL") %></span>

                                        </li>

                                        <asp:LinkButton ID="btnRemoveIcon" OnClick="btnRemoveIcon_Click" CommandArgument='<%# Eval("PRODUCTNO") %>' runat="server" CssClass="btn btn-outline-secondary d-flex align-items-center" Style="border-color: #DFDFDF;">
                                <i class="fa-solid fa-trash-can"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <%--<span style="">PRODUCTNAME:
                    <asp:Label ID="PRODUCTNAMELabel" runat="server" Text='<%# Eval("PRODUCTNAME") %>' />
                    <br />
                    PRODUCTTITLE:
                    <asp:Label ID="PRODUCTTITLELabel" runat="server" Text='<%# Eval("PRODUCTTITLE") %>' />
                    <br />
                    PRICE:
                    <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                    <br />
                    QTY:
                    <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
                    <br />
                    SUBTOTAL:
                    <asp:Label ID="SUBTOTALLabel" runat="server" Text='<%# Eval("SUBTOTAL") %>' />
                    <br />
                    <br />--%>
                    </span>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <span style="">PRODUCTNAME:
                    <asp:TextBox ID="PRODUCTNAMETextBox" runat="server" Text='<%# Bind("PRODUCTNAME") %>' />
                                        <br />
                                        PRODUCTTITLE:
                    <asp:TextBox ID="PRODUCTTITLETextBox" runat="server" Text='<%# Bind("PRODUCTTITLE") %>' />
                                        <br />
                                        PRICE:
                    <asp:TextBox ID="PRICETextBox" runat="server" Text='<%# Bind("PRICE") %>' />
                                        <br />
                                        QTY:
                    <asp:TextBox ID="QTYTextBox" runat="server" Text='<%# Bind("QTY") %>' />
                                        <br />
                                        SUBTOTAL:
                    <asp:TextBox ID="SUBTOTALTextBox" runat="server" Text='<%# Bind("SUBTOTAL") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                        <br />
                                    </span>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <span>No data was returned.</span>
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                    <span style="">PRODUCTNAME:
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PRODUCTNAME") %>' />
                                        <br />
                                        PRODUCTTITLE:
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PRODUCTTITLE") %>' />
                                        <br />
                                        PRICE:
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PRICE") %>' />
                                        <br />
                                        QTY:
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("QTY") %>' />
                                        <br />
                                        SUBTOTAL:
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SUBTOTAL") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="Button1" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                        <br />
                                    </span>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <div class="d-flex justify-content-between">
                                        <li class="list-group-item d-flex justify-content-between align-items-center lh-sm w-100">
                                            <div>
                                                <h6 class="my-0"><%# Eval("NAME") %> <small class="">(₹<%# Eval("MRP") %> * <%# Eval("QTY") %>)
                                                    <br />
                                                    <small class="text-muted fw-bold"><%# Eval("DISCOUNTPERCENTAGE") %>% off</small></small></h6>


                                                <%--<small class="text-muted"><%# Eval("TITLE") %></small>--%>
                                            </div>
                                            <span class="fw-bold">₹<%# Eval("SUBTOTAL") %></span>

                                        </li>

                                        <asp:LinkButton ID="btnRemoveIcon" OnClick="btnRemoveIcon_Click" CommandArgument='<%# Eval("PRODUCTNO") %>' runat="server" CssClass="btn btn-outline-secondary d-flex align-items-center" Style="border-color: #DFDFDF;">
                                <i class="fa-solid fa-trash-can"></i>
                                        </asp:LinkButton>
                                    </div>
                                    <%--<span style="">PRODUCTNAME:
                    <asp:Label ID="PRODUCTNAMELabel" runat="server" Text='<%# Eval("PRODUCTNAME") %>' />
                    <br />
                    PRODUCTTITLE:
                    <asp:Label ID="PRODUCTTITLELabel" runat="server" Text='<%# Eval("PRODUCTTITLE") %>' />
                    <br />
                    PRICE:
                    <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                    <br />
                    QTY:
                    <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
                    <br />
                    SUBTOTAL:
                    <asp:Label ID="SUBTOTALLabel" runat="server" Text='<%# Eval("SUBTOTAL") %>' />
                    <br />
                    <br />
                    </span>--%>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <span style="">PRODUCTNAME:
                    <asp:Label ID="PRODUCTNAMELabel" runat="server" Text='<%# Eval("PRODUCTNAME") %>' />
                                        <br />
                                        PRODUCTTITLE:
                    <asp:Label ID="PRODUCTTITLELabel" runat="server" Text='<%# Eval("PRODUCTTITLE") %>' />
                                        <br />
                                        PRICE:
                    <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                                        <br />
                                        QTY:
                    <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
                                        <br />
                                        SUBTOTAL:
                    <asp:Label ID="SUBTOTALLabel" runat="server" Text='<%# Eval("SUBTOTAL") %>' />
                                        <br />
                                        <br />
                                    </span>
                                </SelectedItemTemplate>
                            </asp:ListView>

                            <%--<li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Product name</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">₹12</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Blue T-Shirt</h6>
              <small class="text-muted">100% corton blue t-shirt with good material</small>
            </div>
            <span class="text-muted">₹599.00</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Third item</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">₹5</span>
          </li>--%>

                            <li runat="server" id="Li1" class="list-group-item d-flex justify-content-between ">
                                <span class="fw-bold">Sub Total</span>
                                <strong>₹<asp:Label ID="lblSubTotal" runat="server" class=""></asp:Label></strong>
                            </li>
                            <li runat="server" id="Li2" class="list-group-item d-flex justify-content-between text-success">
                                <span class="fw-bold">Flat Discount</span>
                                <strong>₹<asp:Label ID="lblFlatDiscount" runat="server" class=""></asp:Label></strong>
                            </li>

                            <li runat="server" id="forCashbackDiscount">
                                <div class="text-success">
                                    <h6 class="my-0">Cashback Discount</h6>
                                    <small><%--<asp:Label runat="server" ID="Label1"></asp:Label>--%> </small>
                                </div>
                                <span class="text-success fw-bold">₹<asp:Label runat="server" ID="lblCashbackDiscountAmount"></asp:Label>
                                </span>
                            </li>

                            <li runat="server" id="forPromoCode">
                                <div class="text-success">
                                    <h6 class="my-0">Promo code</h6>
                                    <small>
                                        <asp:Label runat="server" ID="promocodeName"></asp:Label>
                                    </small>
                                </div>
                                <span class="text-success fw-bold">₹<asp:Label runat="server" ID="promocodeAmount"></asp:Label>
                                </span>
                            </li>



                            <li runat="server" id="forDeliveryCharge">
                                <div>
                                    <h6 class="my-0">Delivery charge</h6>
                                </div>
                                <span class="fw-bold">₹<asp:Label ID="lblDeliveryCharge" runat="server" Text=""></asp:Label></span>
                            </li>

                            <li runat="server" id="forTotal" class="list-group-item d-flex justify-content-between">
                                <span class="fw-bold h3">Total</span>
                                <strong class="h3">₹<asp:Label ID="lblTotal" runat="server"></asp:Label></strong>
                            </li>

                        </ul>
                        <hr class="my-4">

                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="">
                                <asp:Label ID="lblWalletBalance" runat="server" Text=""></asp:Label></span>
                        </h4>

                        <h6 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="">
                                <asp:Label ID="lblMaxRedeemableAmount" runat="server" Text=""></asp:Label></span>
                        </h6>

                        <div class="input-group">
                            <asp:TextBox ID="txtWallet" TextMode="Number" CssClass="form-control" MaxLength="20" placeholder="Enter amount" runat="server"></asp:TextBox>
                            <asp:Button ID="btnApply" ValidationGroup="wallet" CssClass="btn btn-dark" runat="server" OnClick="btnApply_Click" Text="Apply" />
                        </div>
                        <asp:RequiredFieldValidator ValidationGroup="wallet" CssClass="text-danger" Display="Dynamic" ID="rfvWallet" ControlToValidate="txtWallet" runat="server" ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblWallet" runat="server" Text=""></asp:Label>

                        <hr class="my-4">

                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-dark">Cashback Code</span>
                        </h4>

                        <div class="input-group">
                            <asp:TextBox ID="txtCashback" CssClass="form-control" MaxLength="20" placeholder="Cashback Code" runat="server"></asp:TextBox>
                            <asp:Button ID="btnCashback" ValidationGroup="cashback" CssClass="btn btn-secondary" runat="server" OnClick="btnCashback_Click" Text="Redeem" />
                        </div>
                        <asp:RequiredFieldValidator ValidationGroup="cashback" CssClass="text-danger" Display="Dynamic" ID="rfvCashback" ControlToValidate="txtCashback" runat="server" ErrorMessage="Please enter cashback code"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblCashbackIsValidOrNot" runat="server" Text=""></asp:Label><i runat="server" id="cashbackToolTip" class="d-none"></i>

                        <hr class="my-4">

                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-dark">Promo Codes</span>
                        </h4>

                        <div class="list-group">

                            <asp:ListView ID="lvForPromocodes" runat="server" DataKeyNames="PROMOCODEID">
                                <AlternatingItemTemplate>

                                    <asp:LinkButton ID="lbWhichPromocode" data-discount='<%# Eval("DISCOUNT") %>' OnClick="MyBtnHandler" CommandArgument='<%# Eval("DISCOUNT")+","+Eval("PROMOCODE")+","+Eval("MINAMOUNT") %>' CssClass="list-group-item list-group-item-action promoCode" onmouseover="fncAdd(this.id)" onmouseout="fncRemove(this.id)" aria-current="true" runat="server">
                        <div class="d-flex w-100 justify-content-between">
                          <h6 class="mb-1">Promo code</h6>
                            <span>(<%# Eval("DISCOUNT") %>%)</span>
                        </div>
                        <small><%# Eval("PROMOCODE") %></small>
                                    </asp:LinkButton>

                                    <%--<span style="">PROMOCODEID:
                      <asp:Label ID="PROMOCODEIDLabel" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
                      <br />
                      PROMOCODE:
                      <asp:Label ID="PROMOCODELabel" runat="server" Text='<%# Eval("PROMOCODE") %>' />
                      <br />
                      DISCOUNT:
                      <asp:Label ID="DISCOUNTLabel" runat="server" Text='<%# Eval("DISCOUNT") %>' />
                      <br />
                      <br />
                      </span>--%>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <span style="">PROMOCODEID:
                      <asp:Label ID="PROMOCODEIDLabel1" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
                                        <br />
                                        PROMOCODE:
                      <asp:TextBox ID="PROMOCODETextBox" runat="server" Text='<%# Bind("PROMOCODE") %>' />
                                        <br />
                                        DISCOUNT:
                      <asp:TextBox ID="DISCOUNTTextBox" runat="server" Text='<%# Bind("DISCOUNT") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                        <br />
                                    </span>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <span>No data was returned.</span>
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                    <span style="">PROMOCODE:
                      <asp:TextBox ID="PROMOCODETextBox" runat="server" Text='<%# Bind("PROMOCODE") %>' />
                                        <br />
                                        DISCOUNT:
                      <asp:TextBox ID="DISCOUNTTextBox" runat="server" Text='<%# Bind("DISCOUNT") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                        <br />
                                    </span>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbWhichPromocode" data-discount='<%# Eval("DISCOUNT") %>' OnClick="MyBtnHandler" CommandArgument='<%# Eval("DISCOUNT")+","+Eval("PROMOCODE")+","+Eval("MINAMOUNT") %>' CssClass="list-group-item list-group-item-action promoCode" onmouseover="fncAdd(this.id)" onmouseout="fncRemove(this.id)" aria-current="true" runat="server">
                        <div class="d-flex w-100 justify-content-between">
                          <h6 class="mb-1">Promo code</h6>
                            <span>(<%# Eval("DISCOUNT") %>%)</span>
                        </div>
                        <small><%# Eval("PROMOCODE") %></small>
                                    </asp:LinkButton>

                                    <%--<span style="">PROMOCODEID:
                      <asp:Label ID="PROMOCODEIDLabel" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
                      <br />
                      PROMOCODE:
                      <asp:Label ID="PROMOCODELabel" runat="server" Text='<%# Eval("PROMOCODE") %>' />
                      <br />
                      DISCOUNT:
                      <asp:Label ID="DISCOUNTLabel" runat="server" Text='<%# Eval("DISCOUNT") %>' />
                      <br />
                      <br />
                      </span>--%>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <span style="">PROMOCODEID:
                      <asp:Label ID="PROMOCODEIDLabel" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
                                        <br />
                                        PROMOCODE:
                      <asp:Label ID="PROMOCODELabel" runat="server" Text='<%# Eval("PROMOCODE") %>' />
                                        <br />
                                        DISCOUNT:
                      <asp:Label ID="DISCOUNTLabel" runat="server" Text='<%# Eval("DISCOUNT") %>' />
                                        <br />
                                        <br />
                                    </span>
                                </SelectedItemTemplate>
                            </asp:ListView>



                            <%--<a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    <div class="d-flex w-100 justify-content-between">
      <h6 class="mb-1">Promo code</h6>
      <small>(50%)</small>
    </div>
    <small>FLAT50</small>
  </a>
  <a href="#" class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h6 class="mb-1">Promo code</h6>
      <small>(50%)</small>
    </div>
    <small>FLAT50</small>
  </a>
  <a href="#" class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h6 class="mb-1">List group item heading</h6>
      <small class="text-muted">3 days ago</small>
    </div>
    <small class="text-muted">And some muted small print.</small>
  </a>--%>
                        </div>

                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Billing addressss</h4>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">First name</label>
                                <asp:TextBox ValidationGroup="BeforeLogin" Enabled="false" MaxLength="40" ID="firstName" placeholder="First Name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Last name</label>
                                <asp:TextBox ValidationGroup="BeforeLogin" Enabled="false" MaxLength="40" ID="lastName" placeholder="Last Name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>


                            <div class="col-12">
                                <label for="email" class="form-label">Email</label>
                                <asp:TextBox MaxLength="50" ID="email" Enabled="false" placeholder="Email" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                            </div>

                            <div class="col-12">
                                <label for="phone" class="form-label">Phone</label>
                                <asp:TextBox ID="txtPhone" ValidationGroup="BeforeLogin" runat="server" MaxLength="10" placeholder="Phone" minlength="10" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="BeforeLogin" CssClass="text-danger" Display="Dynamic" ID="rfvPhone" ControlToValidate="txtPhone" runat="server" ErrorMessage="Please mobile number"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ValidationGroup="BeforeLogin" ID="rePhone" Display="Dynamic" ControlToValidate="txtPhone" runat="server" ErrorMessage="Mobile number not valid" CssClass="text-danger" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>

                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">Address</label>
                                <asp:TextBox ValidationGroup="BeforeLogin" ID="txtAddress" runat="server" MaxLength="500" placeholder="Write your address" Columns="30" Rows="4" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="BeforeLogin" CssClass="text-danger" Display="Dynamic" ID="rfvAddress" ControlToValidate="txtAddress" runat="server" ErrorMessage="Please enter your shipping address."></asp:RequiredFieldValidator>

                            </div>

                            <div class="col-md-4">
                                <label for="state" class="form-label">State</label>
                                <asp:DropDownList ID="State" OnSelectedIndexChanged="State_SelectedIndexChanged" runat="server" AutoPostBack="true" CssClass="ddl form-select btn dropdown-toggle" Style="border-color: #CED4DA;">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Assam</asp:ListItem>
                                    <asp:ListItem>Bihar</asp:ListItem>
                                    <asp:ListItem>Chandigarh</asp:ListItem>
                                    <asp:ListItem>Chattisgarh</asp:ListItem>
                                    <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                    <asp:ListItem>Daman and Diu</asp:ListItem>
                                    <asp:ListItem>Delhi</asp:ListItem>
                                    <asp:ListItem>Goa</asp:ListItem>
                                    <asp:ListItem>Gujarat</asp:ListItem>
                                    <asp:ListItem>Haryana</asp:ListItem>
                                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                    <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                    <asp:ListItem>Jharkhand</asp:ListItem>
                                    <asp:ListItem>Karnataka</asp:ListItem>
                                    <asp:ListItem>Kerala</asp:ListItem>
                                    <asp:ListItem>Lakshadweep</asp:ListItem>
                                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                    <asp:ListItem>Maharashtra</asp:ListItem>
                                    <asp:ListItem>Manipur</asp:ListItem>
                                    <asp:ListItem>Meghalaya</asp:ListItem>
                                    <asp:ListItem>Mizoram</asp:ListItem>
                                    <asp:ListItem>Nagaland</asp:ListItem>
                                    <asp:ListItem>Orissa</asp:ListItem>
                                    <asp:ListItem>Pondicherry</asp:ListItem>
                                    <asp:ListItem>Punjab</asp:ListItem>
                                    <asp:ListItem>Rajasthan</asp:ListItem>
                                    <asp:ListItem>Sikkim</asp:ListItem>
                                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                                    <asp:ListItem>Tripura</asp:ListItem>
                                    <asp:ListItem>Uttarakhand</asp:ListItem>
                                    <asp:ListItem>Uttaranchal</asp:ListItem>
                                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                    <asp:ListItem>West Bengal</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="lblForNotSelectedState" CssClass="text-danger" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="col-md-5">
                                <label for="city" class="form-label">City</label>
                                <asp:TextBox ValidationGroup="BeforeLogin" ID="city" placeholder="City name" CssClass="form-control control" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="BeforeLogin" ID="rfvCity" Display="Dynamic" ControlToValidate="city" CssClass="text-danger" runat="server" ErrorMessage="Please enter city"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-3">
                                <label for="pinCode" class="form-label">Pin code</label>
                                <asp:TextBox ValidationGroup="BeforeLogin" ID="pincode" placeholder="Pincode" MaxLength="6" minlength="6" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="BeforeLogin" ID="rfvPincode" Display="Dynamic" ControlToValidate="pincode" CssClass="text-danger" runat="server" ErrorMessage="Please enter pincode"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ValidationGroup="BeforeLogin" ID="rePincode" Display="Dynamic" ControlToValidate="pincode" runat="server" ErrorMessage="Please enter valid pincode" CssClass="text-danger" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <%--<hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">Save this information for next time</label>
          </div>

          <hr class="my-4">--%>


                        <hr class="my-4">
                        <asp:Button ValidationGroup="BeforeLogin" OnClick="btnPlaceOrder_Click" CssClass="w-100 btn btn-dark btn-lg" ID="btnPlaceOrder" runat="server" Text="Place Order" />
                    </div>
                </div>
            </main>

        </asp:Panel>

        <asp:Panel ID="panelForAuthentication" runat="server">

            <div class="container height-100 d-flex justify-content-center align-items-center">
                <div class="position-relative">
                    <div class="card p-2 text-center">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <h6>Please enter the one time password
                            <br>
                            to verify your account</h6>
                        <div><span>A code has been sent to</span> <small>your email</small> </div>


                        <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2">

                            <asp:TextBox ID="TextBox1" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>

                            <asp:TextBox ID="TextBox2" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>

                            <asp:TextBox ID="TextBox3" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>

                            <asp:TextBox ID="TextBox4" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>

                            <asp:TextBox ID="TextBox5" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>

                            <asp:TextBox ID="TextBox6" CssClass="m-2 text-center form-control rounded" runat="server" MaxLength="1" onkeyup="onlyInteger()" TextMode="Phone"></asp:TextBox>

                        </div>

                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="TextBox1" ID="rfvTxt1" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="TextBox2" ID="rfvTxt2" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="TextBox3" ID="rfvTxt3" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="TextBox4" ID="rfvTxt4" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="TextBox5" ID="rfvTxt5" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ControlToValidate="TextBox6" ID="rfvTxt6" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <div class="mt-4">
                            <asp:Button ID="btnVerify" CssClass="btn btn-danger px-4 validate" runat="server" Text="Validate" OnClick="btnVerify_Click" />
                        </div>
                    </div>
                    <div class="card-2">
                        <div class="content d-flex justify-content-center align-items-center">
                            <span>Didn't get the code</span>
                            <asp:LinkButton CausesValidation="false" ID="resendButton" CssClass="text-decoration-none ms-3" runat="server" OnClick="resendButton_Click">Resend</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="panelForPayment" runat="server">

            <div class="d-flex flex-column justify-content-center align-items-center">
                <%--<asp:Button ID="btnPaymentFailed" OnClick="btnPaymentFailed_Click" runat="server" Text="Payment Failed" />
                <asp:Button ID="btnPaymentSuccess" OnClick="btnPaymentSuccess_Click" runat="server" Text="Payment Success" />--%>

                <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Payment Details
                    </h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                    <div class="form-group">
                        <label for="cardNumber">
                            ORDER ID</label>
                        <label for="cardNumber">
                            #0123456789</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                required autofocus />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    EXPIRY DATE</label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-md-5 pull-right">
                            <div class="form-group">
                                <label for="cvCode">
                                    CV CODE</label>
                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <ul class="nav nav-pills nav-stacked">
                <li class="active w-100"><a href="#"><span class="badge pull-right">₹ <asp:Label ID="lblFinalPayment" runat="server" Text=""></asp:Label>
                </span> Final Payment</a>
                </li>
            </ul>
            <br/>
            <asp:Button ID="btnPayWithPaytm" OnClick="btnPayWithPaytm_Click" CssClass="btn btn-primary btn-xl btn-block" runat="server" Text="Pay With Paytm" />
            <asp:Button ID="btnPayWithRazorPay" OnClick="btnPayWithRazorPay_Click" CssClass="btn btn-primary btn-xl btn-block" runat="server" Text="Pay With RazorPay" />
        </div>
    </div>
</div>
            </div>

            
        </asp:Panel>
    </div>
    <footer class="my-5 pt-5 text-muted text-center text-small">
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>

        function OpenPaymentWindow(key, amountInSubunits, currency, name, descritpion, imageLogo, orderId, profileName, profileEmail, profileMobile, notes) {

            notes = $.parseJSON(notes);
            var options = {
                "key": key, // Enter the Key ID generated from the Dashboard
                "amount": amountInSubunits, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                "currency": currency,
                "name": name,
                "description": descritpion,
                "image": imageLogo,
                "order_id": orderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                "handler": function (response) {
                    window.location.href = "orderPlacedSuccess.aspx?razorpay_order_id=" + response.razorpay_order_id + "&razorpay_payment_id=" + response.razorpay_payment_id;
                    //alert(response.razorpay_payment_id);
                    //alert(response.razorpay_order_id);
                    //alert(response.razorpay_signature)
                },
                "prefill": {
                    "name": profileName,
                    "email": profileEmail,
                    "contact": profileMobile
                },
                "notes": notes,
                "theme": {
                    "color": "#F37254"
                }
            };
            var rzp1 = new Razorpay(options);
            rzp1.open();
            rzp1.on('payment.failed', function (response) {
                console.log(response.error);
                window.location.href = "orderFailed.aspx";
            });
        }



        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        function MyFunction(x) {
            document.getElementById('customMessage').innerHTML = `All items total shoud be greater then ${x} rupees.`;
            myModal.show();
        }

        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        });

        function fncAdd(x) {
            var ele = document.getElementById(x);
            ele.setAttribute("class", "list-group-item list-group-item-action promoCode active");
        }
        function fncRemove(x) {
            var ele = document.getElementById(x);
            ele.setAttribute("class", "list-group-item list-group-item-action promoCode");
        }

        function disableListView(x) {
            for (var i = 0; i < x; i++) {
                document.getElementById(`ContentPlaceHolder1_lvForPromocodes_lbWhichPromocode_${i}`).setAttribute("class", "list-group-item list-group-item-action promoCode disabled");
            }
        }
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
        function paymentGateway(paytmPaymentGateway, razorpayPaymentGateway, paytmIsActive, razorpayActive) {
            
            if (paytmIsActive == "0") {
                document.getElementById('ContentPlaceHolder1_btnPayWithPaytm').classList.add("d-none");
            }

            if (razorpayActive == "0") {
                $("#ContentPlaceHolder1_btnPayWithRazorPay").addClass("d-none");
            }
        }
        //function disableParticularPromocodesByName(x) {
        //    for (var i = 0; i < x; i++) {
        //        document.getElementById(`ContentPlaceHolder1_lvForPromocodes_lbWhichPromocode_${i}`).setAttribute("class", "list-group-item list-group-item-action promoCode disabled");
        //    }
        //}
        //target.addEventListener("mouseover", mOver, true);
        //target.addEventListener("mouseout", mOut, true);

        //function mOver() {
        //    target.setAttribute("class", "list-group-item list-group-item-action promoCode active")
        //}

        //function mOut() {
        //    target.setAttribute("class", "list-group-item list-group-item-action promoCode")
        //}
    </script>

</asp:Content>

