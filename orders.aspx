<%@ Page Title="Milk And Berries - Orders" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .main-div {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-color: #fff; /*455A64*/
    background-repeat: no-repeat
}

.card {
    z-index: 0;
    background-color: #ECEFF1;
    padding-bottom: 20px;
    margin-top: 40px;
    margin-bottom: 20px;
    border-radius: 10px
}

.top {
    padding-top: 40px;
    padding-left: 13% !important;
    padding-right: 13% !important
}

#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: #1f1f1f;
    padding-left: 0px;
    margin-top: 30px
}

#progressbar span {
    list-style-type: none;
    font-size: 13px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400
}

#progressbar .step0:before {
    font-family: FontAwesome;
    content: "\f10c";
    color: #fff
}

#progressbar span:before {
    width: 40px;
    height: 40px;
    line-height: 45px;
    display: block;
    font-size: 20px;
    background: #C5CAE9;
    border-radius: 50%;
    margin: auto;
    padding: 0px
}

#progressbar span:after {
    content: '';
    width: 100%;
    height: 12px;
    background: #C5CAE9;
    position: absolute;
    left: 0;
    top: 16px;
    z-index: -1
}

#progressbar span:last-child:after {
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    position: absolute;
    left: -50%
}

#progressbar span:nth-child(2):after,
#progressbar span:nth-child(3):after {
    left: -50%
}

#progressbar span:first-child:after {
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    position: absolute;
    left: 50%
}

#progressbar span:last-child:after {
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px
}

#progressbar span:first-child:after {
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px
}

#progressbar span.active:before,
#progressbar span.active:after {
    background: #1f1f1f
}

#progressbar span.active:before {
    font-family: FontAwesome;
    content: "\f00c"
}

.icon {
    width: 60px;
    height: 60px;
    margin-right: 15px
}

.icon-content {
    padding-bottom: 20px
}

@media screen and (max-width: 992px) {
    .icon-content {
        width: 50%
    }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    <span runat="server" id="span1" class="active step0"></span>
    <div class="main-div">

    <div class="container px-1 px-md-1 py-1 mx-auto">
        <asp:ListView ID="lv" runat="server" DataKeyNames="ORDERID" OnItemDataBound="lv_ItemDataBound">
            
            <AlternatingItemTemplate>

                <div class="card">
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex justify-content-between">
                <h5>ORDER <span class="text-primary font-weight-bold">#<%# Eval("ORDERID") %></span></h5>
                <asp:Label ID="orderStatus" CssClass="d-none" runat="server" Text='<%# Eval("ORDERSTATUS") %>'></asp:Label>
                <asp:Button ID="btnViewOrder" OnClick="btnViewOrder_Click" CommandArgument='<%# Eval("ORDERID") %>' runat="server" CssClass="btn btn-dark rounded-pill" Text="View" />
            </div>
            <div class="d-flex flex-column text-sm-right">
                <p class="mb-0">Expected Arrival <span><%# Eval("DELIVERYDATE") %></span></p>
                <%--<p>USPS <span class="font-weight-bold">234094567242423422898</span></p>--%>
            </div>
        </div> <!-- Add class 'active' to progress -->
        <div class="row d-flex justify-content-center">
            <div class="col-12">
                <ul id="progressbar" class="text-center">
                    <asp:Label ID="Label1" CssClass="active step0" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label2" CssClass="step0" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label3" CssClass="step0" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label4" CssClass="step0" runat="server" Text=""></asp:Label>
                </ul>
            </div>
        </div>
        <div class="container">
        <div class="row">
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/9nnc9Et.png">
                <p class="font-weight-bold">Order<br>Processed</p>
            </div>
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/u1AzR7w.png">
                <p class="font-weight-bold">Order<br>Shipped</p>
            </div>
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/TkPm63y.png">
                <p class="font-weight-bold">Order<br>En Route</p>
            </div>
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                <p class="font-weight-bold">Order<br>Arrived</p>
            </div>
        </div>
            </div>
        
    </div>

                <%--<span style="">ORDERID:
                <asp:Label ID="ORDERIDLabel" runat="server" Text='<%# Eval("ORDERID") %>' />
                <br />
                DEspanVERYDATE:
                <asp:Label ID="DEspanVERYDATELabel" runat="server" Text='<%# Eval("DEspanVERYDATE") %>' />
                <br />
                ORDERSTATUS:
                <asp:Label ID="ORDERSTATUSLabel" runat="server" Text='<%# Eval("ORDERSTATUS") %>' />
                <br />
<br /></span>--%>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">ORDERID:
                <asp:Label ID="ORDERIDLabel1" runat="server" Text='<%# Eval("ORDERID") %>' />
                <br />
                DEspanVERYDATE:
                    
                <asp:TextBox ID="DEspanVERYDATETextBox" runat="server" Text='<%# Bind("DELIVERYDATE") %>' />
                <br />
                ORDERSTATUS:
                <asp:TextBox ID="ORDERSTATUSTextBox" runat="server" Text='<%# Bind("ORDERSTATUS") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /><br /></span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <div class="d-flex flex-column align-items-center text-center">
                    <img src="images/no-order.svg" class="" width="35%" style="border-radius:15px;" />
                    <h3 class="" style="width:35%;border-radius:15px;">
                        No orders found! <br />
                        <span><a class="btn btn-outline-dark rounded-pill btn-sm m-1" href="products.aspx">Shop now</a></span>
                    </h3>
                </div>
                <%--<span>No data was returned.</span>--%>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">ORDERID:
                <asp:TextBox ID="ORDERIDTextBox" runat="server" Text='<%# Bind("ORDERID") %>' />
                <br />DEspanVERYDATE:
                <asp:TextBox ID="DEspanVERYDATETextBox" runat="server" Text='<%# Bind("DELIVERYDATE") %>' />
                <br />ORDERSTATUS:
                <asp:TextBox ID="ORDERSTATUSTextBox" runat="server" Text='<%# Bind("ORDERSTATUS") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /><br /></span>
            </InsertItemTemplate>
            <ItemTemplate>

                <div class="card">
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex justify-content-between">
                <h5>ORDER <span class="text-primary font-weight-bold">#<%# Eval("ORDERID") %></span></h5>
                <asp:Label ID="orderStatus" CssClass="d-none" runat="server" Text='<%# Eval("ORDERSTATUS") %>'></asp:Label>
                <asp:Button ID="btnViewOrder" runat="server" OnClick="btnViewOrder_Click" CommandArgument='<%# Eval("ORDERID") %>' CssClass="btn btn-dark rounded-pill" Text="View" />
            </div>
            <div class="d-flex flex-column text-sm-right">
                <p class="mb-0">Expected Arrival <span><%# Eval("DELIVERYDATE") %></span></p>
                <%--<p>USPS <span class="font-weight-bold">234094567242423422898</span></p>--%>
            </div>
        </div> <!-- Add class 'active' to progress -->
        <div class="row d-flex justify-content-center">
            <div class="col-12">
                <ul id="progressbar" class="text-center">
                    <asp:Label ID="Label1" CssClass="active step0" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label2" CssClass="step0" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label3" CssClass="step0" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label4" CssClass="step0" runat="server" Text=""></asp:Label>
                </ul>
            </div>
        </div>
        <div class="container">
        <div class="row">
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/9nnc9Et.png">
                <p class="font-weight-bold">Order<br>Processed</p>
            </div>
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/u1AzR7w.png">
                <p class="font-weight-bold">Order<br>Shipped</p>
            </div>
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/TkPm63y.png">
                <p class="font-weight-bold">Order<br>En Route</p>
            </div>
            <div class="col-lg-3 d-flex justify-content-center">
                <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                <p class="font-weight-bold">Order<br>Arrived</p>
            </div>
        </div>
            </div>
        
    </div>

                <%--<span style="">ORDERID:
                <asp:Label ID="ORDERIDLabel" runat="server" Text='<%# Eval("ORDERID") %>' />
                <br />
                DEspanVERYDATE:
                <asp:Label ID="DEspanVERYDATELabel" runat="server" Text='<%# Eval("DEspanVERYDATE") %>' />
                <br />
                ORDERSTATUS:
                <asp:Label ID="ORDERSTATUSLabel" runat="server" Text='<%# Eval("ORDERSTATUS") %>' />
                <br />
<br /></span>--%>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">ORDERID:
                <asp:Label ID="ORDERIDLabel" runat="server" Text='<%# Eval("ORDERID") %>' />
                <br />
                DEspanVERYDATE:
                <asp:Label ID="DEspanVERYDATELabel" runat="server" Text='<%# Eval("DELIVERYDATE") %>' />
                <br />
                ORDERSTATUS:
                <asp:Label ID="ORDERSTATUSLabel" runat="server" Text='<%# Eval("ORDERSTATUS") %>' />
                <br />
<br /></span>
            </SelectedItemTemplate>
            
        </asp:ListView>
        </div>
        </div>
</asp:Content>

