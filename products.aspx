<%@ Page Title="Milk And Berries - Products" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
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

        .product-img {
            width: 70%;
        }

        @media only screen and (max-width: 576px) {
            .product-img {
                width: 50%;
            }
        }
    </style>
    <script>
        function increase() {
            var currentValue = document.getElementById("ContentPlaceHolder1_txtQuantity").value;
            currentValue++;
            if (currentValue > 10) {
                currentValue = 10;
            }
            document.getElementById("ContentPlaceHolder1_txtQuantity").value = currentValue;
        }
        function decrease() {
            var currentValue = document.getElementById("ContentPlaceHolder1_txtQuantity").value;
            currentValue--;
            if (currentValue <= 1) {
                currentValue = 1;
            }
            document.getElementById("ContentPlaceHolder1_txtQuantity").value = currentValue;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Button trigger modal -->
    <%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>--%>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Unable to add item</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Login or Register
          
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnGotoLogin" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnGotoLogin_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Item added successfully!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Checkout cart
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnGotoCart" CssClass="btn btn-primary" runat="server" Text="Goto Cart" OnClick="btnGotoCart_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">Unable to add item</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    maximum limit is reached for this item in particular order 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Goto Cart" OnClick="btnGotoCart_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel4">
                        <asp:Label ID="lblProductNameBold" runat="server" Text=""></asp:Label></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 col-xl-12">
                                <div class="card" style="border-radius: 15px;">
                                    <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                        data-mdb-ripple-color="light">
                                        <%--<asp:Image runat="server" ID="Image1" CssClass=" product-img img-fluid d-block " ></asp:Image>--%>
                                        <div class="carousel-item active">
                                            <div class="w-100 d-flex justify-content-center">
                                                <asp:Image runat="server" ID="Image1" CssClass=" product-img img-fluid d-block "></asp:Image>
                                            </div>
                                        </div>

                                        <%--<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                  <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="w-100 d-flex justify-content-center">
                                      <asp:Image runat="server" ID="Image1" CssClass=" product-img img-fluid d-block " ></asp:Image>
                                            </div>
                                    </div>
                                    <div class="carousel-item ">
                                    <div class="w-100 d-flex justify-content-center">
                                      <asp:Image runat="server" ID="Image2" CssClass="product-img img-fluid d-block" ></asp:Image>
                                        </div>
                                    </div>
                                    <div class="carousel-item ">
                                        <div class="w-100 d-flex justify-content-center">
                                      <asp:Image runat="server" ID="Image3" CssClass="product-img img-fluid d-block"  ></asp:Image>
                                            </div>
                                    </div>
                                  </div>
                                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                  </button>
                                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                  </button>
                                </div>--%>
                                    </div>
                                    <div class="card-body pb-0 w-100">
                                        <div class="row">
                                            <div class="col-9 ">
                                                <asp:Label ID="productNo" runat="server" Text="productNo" CssClass="d-none"></asp:Label>
                                                    <asp:Label ID="productName" runat="server" Text="productName"></asp:Label>
                                            </div>
                                            <div class="col-3 d-flex justify-content-end">
                                                <asp:Label ID="productPrice" style="margin-right:5%;font-weight:bold;" runat="server"></asp:Label><span></span>
                                                    <asp:Label ID="productMrp" CssClass="text-muted text-decoration-line-through" runat="server"></asp:Label><span></span>
                                            </div>
                                            <div class="col-9 mt-2 mb-2">
                                                <asp:Label ID="productTitle" CssClass="small" runat="server" Text="productTitle"></asp:Label>
                                            </div>
                                            <div class="col-3 mt-2 mb-2 d-flex justify-content-end">
                                                <div class="badge rounded-pill bg-dark">
                                                <asp:Label ID="discountPercentage" runat="server" Text=""></asp:Label>% off
                                                    </div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body pb-0">
                                        <div class="d-flex justify-content-between">
                                            <p class="small text-muted">
                                                <asp:Label ID="productDescription" runat="server" Text=""></asp:Label>
                                            </p>

                                        </div>

                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body">
                                        <div class="d-flex align-items-center pb-2 mb-1">
                                            <div class="input-group mb-3">
                                                <span class="btn btn-dark" type="button" onclick="decrease()">-</span>
                                                <asp:TextBox ID="txtQuantity" CssClass="text-center" runat="server" min="1" max="10" TextMode="Number">1</asp:TextBox>
                                                <span class="btn btn-dark" type="button" onclick="increase()">+</span>
                                            </div>
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rvfQuantity" runat="server" ErrorMessage="Please enter quantity" ForeColor="Red" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                                            <asp:Button ID="btnAddtoCart" runat="server" CssClass="btn btn-primary" Text="Add to Cart" OnClick="btnAddtoCart_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="container">
        <div class="row mt-5 mb-5">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

            <div class="col-lg-4 d-flex justify-content-center">
                <h6 class="fw-bold display-6">
                    <asp:Label ID="lblProductCategory" runat="server" Text="All "></asp:Label>Products</h6>

            </div>

            <div class="col-lg-4 mt-3 mb-3 d-flex flex-column justify-content-center">
                <asp:RadioButtonList RepeatDirection="Horizontal" ID="rbl" OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true" runat="server">
                    <asp:ListItem Value="0" class="btn btn-outline-dark rounded-pill"> &nbsp; All</asp:ListItem>
                    <asp:ListItem Value="1" class="btn btn-outline-dark rounded-pill"> &nbsp; Hair</asp:ListItem>
                    <asp:ListItem Value="2" class="btn btn-outline-dark rounded-pill"> &nbsp; Facial</asp:ListItem>
                    <asp:ListItem Value="3" class="btn btn-outline-dark rounded-pill"> &nbsp; Body</asp:ListItem>
                </asp:RadioButtonList>
            </div>


            <div class="col-lg-4 d-flex justify-content-center flex-column align-items-center">
                <asp:DropDownList AutoPostBack="true" ID="ddl" runat="server" CssClass="ddl btn btn-outline-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                    <asp:ListItem class="dropdown-item" Value="0">Newest First</asp:ListItem>
                    <asp:ListItem class="dropdown-item" Value="1">Price - Low to High</asp:ListItem>
                    <asp:ListItem class="dropdown-item" Value="2">Price - High to Low</asp:ListItem>
                    <%--<asp:ListItem class="dropdown-item" Value="3">Popularity</asp:ListItem>--%>
                </asp:DropDownList>
            </div>

            <asp:ListView ID="lv" runat="server" DataKeyNames="PRODUCTNO" OnItemDataBound="lv_ItemDataBound" GroupItemCount='<%# Convert.ToInt32(Session["totaNumberOfProducts"].ToString()) %>'>
                <AlternatingItemTemplate>

                    <asp:LinkButton ID="LinkButton1" OnClick="openProductModal" CommandArgument='<%# Eval("PRODUCTNO") %>' runat="server" Style="text-decoration: none; color: black;">
                        <div class="col">
                            <div class="card shadow-sm">
                                <%--<svg class="bd-placeholder-img card-img-top" width="100%"  xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>--%>
                                <img src="<%# Eval("MAINIMAGEURL") %>" alt="product image" style="width: 100%" height="225" class="img-fluid bd-placeholder-img card-img-top" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("NAME") %> </h5>

                                    <div class="d-flex align-items-center">
                                        <%--<div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                        <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                    </div>--%>

                                        <small class="fw-bold fs-5" style="margin-right: 2%;">₹<%# Eval("AFTERDISCOUNTPRICE") %> </small>
                                        <asp:Label ID="Price" CssClass=" text-muted text-decoration-line-through" runat="server" Text='<%# Eval("PRICE") %>'></asp:Label>

                                        <div class="d-flex w-100 flex-row-reverse remove">
                                            <div>
                                                <h5><span class="badge rounded-pill bg-dark"><%# Eval("DISCOUNTPERCENTAGE") %>% off</span></h5>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-flex w-100 flex-row-reverse removeMobile">
                                        <div>
                                            <h5><span class="badge rounded-pill bg-dark"><%# Eval("DISCOUNTPERCENTAGE") %>% off</span></h5>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <asp:Label ID="productNo" runat="server" Text='<%# Eval("PRODUCTNO") %>' CssClass="d-none"></asp:Label>
                    </asp:LinkButton>

                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">PRODUCTNO:
                        <asp:Label ID="PRODUCTNOLabel1" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
                        <br />
                        NAME:
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                        <br />
                        PRICE:
                        <asp:TextBox ID="PRICETextBox" runat="server" Text='<%# Bind("PRICE") %>' />
                        <br />
                        RATE:
                        <asp:TextBox ID="RATETextBox" runat="server" Text='<%# Bind("RATE") %>' />
                        <br />
                        IMAGEURL:
                        <asp:TextBox ID="IMAGEURLTextBox" runat="server" Text='<%# Bind("IMAGEURL") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>

                <InsertItemTemplate>
                    <td runat="server" style="">PRODUCTNO:
                        <asp:TextBox ID="PRODUCTNOTextBox" runat="server" Text='<%# Bind("PRODUCTNO") %>' />
                        <br />
                        NAME:
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                        <br />
                        PRICE:
                        <asp:TextBox ID="PRICETextBox" runat="server" Text='<%# Bind("PRICE") %>' />
                        <br />
                        RATE:
                        <asp:TextBox ID="RATETextBox" runat="server" Text='<%# Bind("RATE") %>' />
                        <br />
                        IMAGEURL:
                        <asp:TextBox ID="IMAGEURLTextBox" runat="server" Text='<%# Bind("IMAGEURL") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>

                    <asp:LinkButton ID="LinkButton1" OnClick="openProductModal" CommandArgument='<%# Eval("PRODUCTNO") %>' runat="server" Style="text-decoration: none; color: black;">
                        <% 
                            if (Session["falg"].ToString() == Session["value"].ToString())
                            {
                                Response.Write("<div class='row row-cols-2 row-cols-sm-2 row-cols-xs-2 row-cols-md-3 row-cols-lg-4 g-4 py-5'>");
                            }
                            string flag = Session["falg"].ToString();
                            int intFlag = Convert.ToInt32(flag);
                            intFlag++;
                            Session["falg"] = intFlag;
                        %>
                        <div class="col">
                            <div class="card shadow-sm">
                                <%--<svg class="bd-placeholder-img card-img-top" width="100%"  xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>--%>
                                <img src="<%# Eval("MAINIMAGEURL") %>" alt="product image" style="width: 100%" height="225" class="img-fluid bd-placeholder-img card-img-top" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("NAME") %> </h5>

                                    <div class="d-flex align-items-center">
                                        <%--<div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                        <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                    </div>--%>

                                        <small class="fw-bold fs-5" style="margin-right: 2%;">₹<%# Eval("AFTERDISCOUNTPRICE") %> </small>
                                        <asp:Label ID="Price" CssClass=" text-muted text-decoration-line-through" runat="server" Text='<%# Eval("PRICE") %>'></asp:Label>

                                        <div class="d-flex w-100 flex-row-reverse remove">
                                            <div>
                                                <h5><span class="badge rounded-pill bg-dark"><%# Eval("DISCOUNTPERCENTAGE") %>% off</span></h5>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-flex w-100 flex-row-reverse removeMobile">
                                        <div>
                                            <h5><span class="badge rounded-pill bg-dark"><%# Eval("DISCOUNTPERCENTAGE") %>% off</span></h5>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <asp:Label ID="productNo" runat="server" Text='<%# Eval("PRODUCTNO") %>' CssClass="d-none"></asp:Label>
                    </asp:LinkButton>



                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">PRODUCTNO:
                        <asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
                        <br />
                        NAME:
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                        <br />
                        PRICE:
                        <asp:Label ID="PRICELabel" runat="server" Text='<%# Eval("PRICE") %>' />
                        <br />
                        RATE:
                        <asp:Label ID="RATELabel" runat="server" Text='<%# Eval("RATE") %>' />
                        <br />
                        IMAGEURL:
                        <asp:Label ID="IMAGEURLLabel" runat="server" Text='<%# Eval("IMAGEURL") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
            </asp:ListView>
        </div>


    </div>

    <script>
        window.onload = function () {
            //alert("hello");
            const mediaQuery = window.matchMedia('(max-width: 576px)')
            // Check if the media query is true
            if (mediaQuery.matches) {

            } else {
                const collection = document.getElementsByClassName("removeMobile");
                for (var i = 0; i < collection.length; i++) {
                    collection[i].classList.add("d-none");
                }
            }

        };
        const mediaQuery = window.matchMedia('(max-width: 576px)')
        // Check if the media query is true
        if (mediaQuery.matches) {
            //alert("x");

            const collection1 = document.getElementsByClassName("remove");
            for (var i = 0; i < collection1.length; i++) {
                collection1[i].classList.add("d-none");
            }

            const collection2 = document.getElementsByClassName("removeMobile");
            for (var i = 0; i < collection2.length; i++) {
                collection2[i].classList.remove("d-none");
            }
            // Then trigger an alert
            //alert('Media Query Matched!')
        }


        /*document.getElementById('ContentPlaceHolder1_lv_ctrl1_itemPlaceholderContainer').style.display = "none";*/
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        function MyFunction() {
            myModal.show();
        }

        var myModal2 = new bootstrap.Modal(document.getElementById('exampleModal2'), {
            keyboard: false
        });
        function MyFunction2() {
            myModal2.show();
        }

        var myModal3 = new bootstrap.Modal(document.getElementById('exampleModal3'), {
            keyboard: false
        });
        function MyFunction3() {
            myModal3.show();
        }

        var myModal4 = new bootstrap.Modal(document.getElementById('exampleModal4'), {
            keyboard: false
        });
        function MyFunction4() {
            myModal4.show();
        }

        var myModalEl = document.getElementById('exampleModal4')
        myModalEl.addEventListener('hidden.bs.modal', function (event) {

            var getUrl = window.location;
            var baseurl1 = getUrl.origin;
            var myUrl = baseurl1 + "/products.aspx";
            window.location.href = myUrl;
        })

        //function selectedRadioButton(x) {
        //    document.getElementById(x).style.backgroundColor = "#000";
        //    document.getElementById(x).style.color = "#FFF";
        //}
    </script>
</asp:Content>

