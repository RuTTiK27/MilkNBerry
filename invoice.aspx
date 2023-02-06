<%@ Page Title="Milk And Berries - Invoice" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="invoice.aspx.cs" Inherits="invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<style>
		body{
			background-color:#EEE;
		}
		.main-div{
		background:#EEE;
		}

		/**    17. Panel
		 *************************************************** **/
		/* pannel */
		.panel {
			position:relative;

			background:transparent;

			-webkit-border-radius: 0;
			   -moz-border-radius: 0;
					border-radius: 0;

			-webkit-box-shadow: none;
			   -moz-box-shadow: none;
					box-shadow: none;
		}
		.panel.fullscreen .accordion .panel-body,
		.panel.fullscreen .panel-group .panel-body {
			position:relative !important;
			top:auto !important;
			left:auto !important;
			right:auto !important;
			bottom:auto !important;
		}
	
		.panel.fullscreen .panel-footer {
			position:absolute;
			bottom:0;
			left:0;
			right:0;
		}


		.panel>.panel-heading {
			text-transform: uppercase;

			-webkit-border-radius: 0;
			   -moz-border-radius: 0;
					border-radius: 0;
		}
		.panel>.panel-heading small {
			text-transform:none;
		}
		.panel>.panel-heading strong {
			font-family:Arial,Helvetica,Sans-Serif;
		}
		.panel>.panel-heading .buttons {
			display:inline-block;
			margin-top:-3px;
			margin-right:-8px;
		}
		.panel-default>.panel-heading {
			padding: 15px 15px;
			background:#fff;
		}
		.panel-default>.panel-heading small {
			color:#9E9E9E;
			font-size:12px;
			font-weight:300;
		}
		.panel-clean {
			border: 1px solid #ddd;
			border-bottom: 3px solid #ddd;

			-webkit-border-radius: 0;
			   -moz-border-radius: 0;
					border-radius: 0;
		}
		.panel-clean>.panel-heading {
			padding: 11px 15px;
			background:#fff !important;
			color:#000;	
			border-bottom: #eee 1px solid;
		}
		.panel>.panel-heading .btn {
			margin-bottom: 0 !important;
		}

		.panel>.panel-heading .progress {
			background-color:#ddd;
		}

		.panel>.panel-heading .pagination {
			margin:-5px;
		}

		.panel-default {
			border:0;
		}

		.panel-light {
			border:rgba(0,0,0,0.1) 1px solid;
		}
		.panel-light>.panel-heading {
			padding: 11px 15px;
			background: transaprent;
			border-bottom:rgba(0,0,0,0.1) 1px solid;
		}

		.panel-heading a.opt>.fa {
			display: inline-block;
			font-size: 14px;
			font-style: normal;
			font-weight: normal;
			margin-right: 2px;
			padding: 5px;
			position: relative;
			text-align: right;
			top: -1px;
		}

		.panel-heading>label>.form-control {
			display:inline-block;
			margin-top:-8px;
			margin-right:0;
			height:30px;
			padding:0 15px;
		}
		.panel-heading ul.options>li>a {
			color:#999;
		}
		.panel-heading ul.options>li>a:hover {
			color:#333;
		}
		.panel-title a {
			text-decoration:none;
			display:block;
			color:#333;
		}

		.panel-body {
			background-color:#fff;
			padding: 15px;

			-webkit-border-radius: 0;
			   -moz-border-radius: 0;
					border-radius: 0;
		}
		.panel-body.panel-row {
			padding:8px;
		}

		.panel-footer {
			font-size:12px;
			border-top:rgba(0,0,0,0.02) 1px solid;
			background-color:rgba(0255,255,255,1);

			-webkit-border-radius: 0;
			   -moz-border-radius: 0;
					border-radius: 0;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Label ID="lblMsg" runat="server" ></asp:Label>
	
<div class="mt-5 mb-5">
	<div class="main-div">	
		<div class="container bootstrap snippets bootdey">
			<div class="panel panel-default">
				<div class="panel-body shadow rounded" id="invoice">
					<div class="row">
                        <div class="col-12">
                            <h1 class="text-center">Tax Invoice</h1>
                        </div>
						<div class="col-md-6 col-sm-6 text-left">
							<h4><strong>Customer</strong> Details</h4>
							<ul class="list-unstyled">
								<li><strong>First Name:</strong> <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label></li>
								<li><strong>Last Name:</strong> <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label></li>
								<li><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></li>
								<li><strong>Phone:</strong> <asp:Label ID="lblMobileNumber" runat="server" Text=""></asp:Label></li>
								<li><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></li>
							</ul>
						</div>

						<div class="col-md-6 col-sm-6 text-end">
							<h4><strong>Order</strong> Details</h4>
							<ul class="list-unstyled">
								<li><strong>Order Id:</strong> <asp:Label ID="lblOrderId" runat="server" Text=""></asp:Label></li>
								<li><strong>Order Date:</strong> <asp:Label ID="lblOrderDate" runat="server" Text=""></asp:Label></li>
								<li><strong>GSTIN:</strong> 24AUVPL6696A1Z6</li>
							</ul>

						</div>

					</div>

					<div class="table-responsive">
						<table class="table table-condensed nomargin">
							<thead>
								<tr>
									<%--<th>Product Number</th>--%>
									<th>Item Name</th>
									<th>Quantity</th>
									<th>HSN/SAC</th>
									<th>Unit Price</th>
									<th>CGST</th>
									<th>SGST</th>
									<th>IGST</th>
									<th>Total Price</th>
								</tr>
							</thead>
							<tbody>

								<asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" runat="server">
									<AlternatingItemTemplate>

										<tr>
											<%--<td> <asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' /> </td>--%>
											<td>
												<div><strong> <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' /> </strong></div>
											</td>
											<td> <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' /> </td>
											<td> <asp:Label ID="HSCORSACLabel" runat="server" Text='<%# Eval("HSNORSAC") %>' /> </td>
											<td>₹<asp:Label ID="WITHOUTGSTPRICELabel" runat="server" Text='<%# Eval("WITHOUTGSTPRICE") %>' /> </td>
											<td>₹<asp:Label ID="CGSTLabel" runat="server" Text='<%# Eval("CGST") %>' /> </td>
											<td>₹<asp:Label ID="SGSTLabel" runat="server" Text='<%# Eval("SGST") %>' /> </td>
											
											<td>₹<asp:Label ID="IGSTLabel" runat="server" Text='<%# Eval("IGST") %>' /></td>
											<td>₹<asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' /></td>
										</tr>

										<%--<span style="">PRODUCTNO:
										<asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
										<br />
										NAME:
										<asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
										<br />
										TITLE:
										<asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
										<br />
										QTY:
										<asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
										<br />
										WITHOUTGSTPRICE:
										<asp:Label ID="WITHOUTGSTPRICELabel" runat="server" Text='<%# Eval("WITHOUTGSTPRICE") %>' />
										<br />
										ITEMTOTAL:
										<asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' />
										<br />
										CGST:
										<asp:Label ID="CGSTLabel" runat="server" Text='<%# Eval("CGST") %>' />
										<br />
										SGST:
										<asp:Label ID="SGSTLabel" runat="server" Text='<%# Eval("SGST") %>' />
										<br />
										IGST:
										<asp:Label ID="IGSTLabel" runat="server" Text='<%# Eval("IGST") %>' />
										<br />
							<br /></span>--%>
									</AlternatingItemTemplate>
									<EditItemTemplate>
										<span style="">PRODUCTNO:
										<asp:TextBox ID="PRODUCTNOTextBox" runat="server" Text='<%# Bind("PRODUCTNO") %>' />
										<br />
										NAME:
										<asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
										<br />
										TITLE:
										<asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
										<br />
										QTY:
										<asp:TextBox ID="QTYTextBox" runat="server" Text='<%# Bind("QTY") %>' />
										<br />
										WITHOUTGSTPRICE:
										<asp:TextBox ID="WITHOUTGSTPRICETextBox" runat="server" Text='<%# Bind("WITHOUTGSTPRICE") %>' />
										<br />
										ITEMTOTAL:
										<asp:TextBox ID="ITEMTOTALTextBox" runat="server" Text='<%# Bind("ITEMTOTAL") %>' />
										<br />
										CGST:
										<asp:TextBox ID="CGSTTextBox" runat="server" Text='<%# Bind("CGST") %>' />
										<br />
										SGST:
										<asp:TextBox ID="SGSTTextBox" runat="server" Text='<%# Bind("SGST") %>' />
										<br />
										IGST:
										<asp:TextBox ID="IGSTTextBox" runat="server" Text='<%# Bind("IGST") %>' />
										<br />
										<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
										<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
										<br /><br /></span>
									</EditItemTemplate>
									<EmptyDataTemplate>
										<span>No data was returned.</span>
									</EmptyDataTemplate>
									<InsertItemTemplate>
										<span style="">PRODUCTNO:
										<asp:TextBox ID="PRODUCTNOTextBox" runat="server" Text='<%# Bind("PRODUCTNO") %>' />
										<br />NAME:
										<asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
										<br />TITLE:
										<asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
										<br />QTY:
										<asp:TextBox ID="QTYTextBox" runat="server" Text='<%# Bind("QTY") %>' />
										<br />WITHOUTGSTPRICE:
										<asp:TextBox ID="WITHOUTGSTPRICETextBox" runat="server" Text='<%# Bind("WITHOUTGSTPRICE") %>' />
										<br />ITEMTOTAL:
										<asp:TextBox ID="ITEMTOTALTextBox" runat="server" Text='<%# Bind("ITEMTOTAL") %>' />
										<br />CGST:
										<asp:TextBox ID="CGSTTextBox" runat="server" Text='<%# Bind("CGST") %>' />
										<br />SGST:
										<asp:TextBox ID="SGSTTextBox" runat="server" Text='<%# Bind("SGST") %>' />
										<br />IGST:
										<asp:TextBox ID="IGSTTextBox" runat="server" Text='<%# Bind("IGST") %>' />
										<br />
										<asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
										<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
										<br /><br /></span>
									</InsertItemTemplate>
									<ItemTemplate>

										<tr>
											<%--<td> <asp:Label CssClass="d-none" ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' /> </td>--%>
											<td>
												<div><strong> <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' /> </strong></div>
											</td>
											<td> <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' /> </td>

											<td> <asp:Label ID="HSCORSACLabel" runat="server" Text='<%# Eval("HSNORSAC") %>' /> </td>

											<td>₹<asp:Label ID="WITHOUTGSTPRICELabel" runat="server" Text='<%# Eval("WITHOUTGSTPRICE") %>' /> </td>
											<td>₹<asp:Label ID="CGSTLabel" runat="server" Text='<%# Eval("CGST") %>' /> </td>
											<td>₹<asp:Label ID="SGSTLabel" runat="server" Text='<%# Eval("SGST") %>' /> </td>
											<td>₹<asp:Label ID="IGSTLabel" runat="server" Text='<%# Eval("IGST") %>' /></td>
											<td>₹<asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' /></td>
										</tr>

										<%--<span style="">PRODUCTNO:
										<asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
										<br />
										NAME:
										<asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
										<br />
										TITLE:
										<asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
										<br />
										QTY:
										<asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
										<br />
										WITHOUTGSTPRICE:
										<asp:Label ID="WITHOUTGSTPRICELabel" runat="server" Text='<%# Eval("WITHOUTGSTPRICE") %>' />
										<br />
										ITEMTOTAL:
										<asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' />
										<br />
										CGST:
										<asp:Label ID="CGSTLabel" runat="server" Text='<%# Eval("CGST") %>' />
										<br />
										SGST:
										<asp:Label ID="SGSTLabel" runat="server" Text='<%# Eval("SGST") %>' />
										<br />
										IGST:
										<asp:Label ID="IGSTLabel" runat="server" Text='<%# Eval("IGST") %>' />
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
										<span style="">PRODUCTNO:
										<asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
										<br />
										NAME:
										<asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
										<br />
										TITLE:
										<asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
										<br />
										QTY:
										<asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
										<br />
										WITHOUTGSTPRICE:
										<asp:Label ID="WITHOUTGSTPRICELabel" runat="server" Text='<%# Eval("WITHOUTGSTPRICE") %>' />
										<br />
										ITEMTOTAL:
										<asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' />
										<br />
										CGST:
										<asp:Label ID="CGSTLabel" runat="server" Text='<%# Eval("CGST") %>' />
										<br />
										SGST:
										<asp:Label ID="SGSTLabel" runat="server" Text='<%# Eval("SGST") %>' />
										<br />
										IGST:
										<asp:Label ID="IGSTLabel" runat="server" Text='<%# Eval("IGST") %>' />
										<br />
							<br /></span>
									</SelectedItemTemplate>
								</asp:ListView>

								<%--<tr>
									<td>
										<div><strong>Unique side and front panel design</strong></div>
									</td>
									<td>2</td>
									<td>₹20.00</td>
									<td>₹3.78</td>
									<td>₹3.78</td>
									<td>₹3.78</td>
									<td>₹23,78</td>
								</tr>--%>

							</tbody>
						</table>
					</div>

					<hr class="nomargin-top">
					<div class="row">
						<div class="col-sm-6 text-left">
							<h4><strong>Contact</strong> Details</h4>
							<%--<p class="nomargin nopadding">
								<strong>Note:</strong> 
								Lid est laborum dolo rumes fugats.
							</p>--%><!-- no P margin for printing - use <br> instead -->

							<address>
								216 Gajanan Business Hub Near Elecon <br>
								Garden Anand Lambvel Road<br>
								Anand - 388 001<br />

								Phone: +91 8866377595 <br>
								Email: info@milknberries.com
							</address>
						</div>

						<div class="col-sm-6 text-end">
							<ul class="list-unstyled">
								<li><strong>Sub - Total Amount:</strong> ₹<asp:Label ID="lblWithoutGstSubTotal" runat="server" Text=""></asp:Label></li>
								<li><strong>Discount:</strong> ₹<asp:Label ID="lblTotalDiscount" runat="server" Text=""></asp:Label></li>
								<li><strong>GST :</strong> ₹<asp:Label ID="lblTotalGst" runat="server" Text=""></asp:Label></li>
								<li><strong>Delivery Charge :</strong> ₹<asp:Label ID="lblDeliveryCharge" runat="server" Text=""></asp:Label></li>
								<li><strong>Grand Total:</strong> ₹<asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label></li>
							</ul>     
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default text-end">
				<div class="panel-body">
					<hr />
					<a id="download" class="btn btn-success" href="#"><i class="fa fa-download"></i> Download</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.1/html2pdf.bundle.min.js" integrity="sha512-1qLXyA3x0VSWeM+8vOotn6+KIRGdcQ8QMzsNeDXmdJsUAnoDGjzlxzqAuUGJGrGkGrtOrq4buDoAHxR89D9PWA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    window.onload = function () {

        document.getElementById("download")
			.addEventListener("click", () => {

                //var element = document.getElementById('forDownload');
                //element.classList.add("container");

                const invoice = this.document.getElementById("invoice");

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

