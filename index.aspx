<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Milk And Berries</title>
    <link rel="icon" href="images/MB-Logo.svg" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="css/features.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /*#wrapper {
	        background-color: #212529;
	        color: white;
	        display: flex;
	        justify-content: center;
	        align-items: center;
        }

        #hi {
	        animation: pulse 5s infinite;
        }

        @keyframes pulse {
	        0% {
	            color: #051E3E;
	        }
	        10% {
		        color: #051E3E;
	        }
	        30% {
		        color: white;
	        }
	        50% {
		        color: #051E3E;
	        }
	        60% {
		        color: #051E3E;
	        }
	        80% {
		        color: white;
	        }
	        100% {
		        color: #051E3E;
	        }
        }

    #hi:after {
	    content: "";
	    animation: spin 5s linear infinite;
    }

    @keyframes spin {
      0% { content:"Hi"; }
      100% { content:"Hello There!"; }
    }*/
        .footer-shadow{
            box-shadow: 0 -0.5rem 1.5rem -0.5rem rgba(0, 0, 0, 0.30);
        }
        .ml3 {
            font-weight: 300;
            font-size: 1.25em;
        }

        /*-------------------------------*/

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .text-small {
            font-size: 85%;
        }

        .dropdown-toggle {
            outline: 0;
        }

        #carousel2 {
            display: none;
        }

        #panel2_mobile {
            display: none;
        }

        #panel3_mobile {
            display: none;
        }

        #panel5_mobile {
            display: none;
        }

        #panel6_mobile {
            display: none;
        }

        @media only screen and (max-width: 576px) {
            #panel2Pc {
                display: none;
            }

            #carousel2 {
                display: block;
            }

            #panel2_mobile {
                display: flex;
            }

            #panel2_pc {
                display: none;
            }

            #panel3_pc {
                display: none;
            }

            #panel3_mobile {
                display: flex;
            }

            #panel5_pc {
                display: none;
            }

            #panel5_mobile {
                display: flex;
            }

            #panel6_pc {
                display: none;
            }

            #panel6_mobile {
                display: flex;
            }

            .h5 {
                font-size: 0.8rem;
            }

            .btn-text-small {
                font-size: 0.6rem;
            }

            .fs-4 {
                font-size: 1rem !important;
            }
        }
    </style>
    <script>
        function applyText(sildingText, animationText, firstTextIsActive, secondTextActive) {
            document.getElementById('sliderText').innerHTML = sildingText;
            document.getElementById('animatetionText').innerHTML = animationText;

            if (firstTextIsActive == "0") {
                document.getElementById('sliderText').classList.add("d-none");
            }

            if (secondTextActive == "0") {
                document.getElementById('animatetionText').classList.add("d-none");
            }

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblMsg" CssClass="d-none" Text="" runat="server" />

        <div class="bg-dark text-light text-center">

            <marquee id="sliderText"></marquee>
            <div style="border-top: 1px solid #FFF; width: 100%;"></div>
            <h6 class="ml3" id="animatetionText"></h6>
            <%--<div id="wrapper">
		            <span id="hi" class="text-uppercase"></span>
	            </div>--%>
        </div>
        <header class="py-3 border-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <a href="index.aspx" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
                            <img alt="Logo" class="bi me-2 bg-light rounded" width="40" src="images/MB-Logo1.svg" />
                            <span class="fs-4 text-dark">Milk And Berries</span>
                        </a>
                    </div>
                    <%--<div class="col-1 d-flex align-items-center">
                <asp:TextBox ID="txtSearch" placeholder="Search for products..." CssClass="form-control rounded-pill d-none " runat="server" />
            </div>--%>
                    <div class="col-6 d-flex justify-content-end">
                        <ul class="nav">

                            <li class="nav-item"><a href="cart.aspx" class="nav-link link-dark px-2"><i class="fal fa-shopping-cart"></i>Cart
                                <asp:Label ID="lblCartProductsCount" CssClass="badge bg-dark rounded-pill" runat="server" Text=""></asp:Label></a></li>
                            <li class="nav-item">

                                <%--<a href="account.aspx" class="nav-link link-dark px-2"><i class="fal fa-user"></i> Login</a>--%>
                                <asp:LinkButton ID="lbAccount" PostBackUrl="~/account.aspx" CssClass="nav-link link-dark px-2" runat="server"></asp:LinkButton>

                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </header>
        <nav class="py-2  bg-light border-bottom shadow ">
            <div class="container   d-flex flex-wrap ">
                <ul class="nav me-auto  w-100 justify-content-center">
                    <li class="nav-item "><a href="index.aspx" class="nav-link link-dark px-2 active" style="border-right: 1px solid #000; height: 80%; display: flex; align-items: center;" aria-current="page">Home</a></li>
                    <li class="nav-item"><a href="products.aspx" class="nav-link link-dark px-2" style="border-right: 1px solid #000; height: 80%; display: flex; align-items: center;">All</a></li>
                    <li class="nav-item"><a href="products.aspx?CID=2" class="nav-link link-dark px-2" style="border-right: 1px solid #000; height: 80%; display: flex; align-items: center;">Hair</a></li>
                    <li class="nav-item"><a href="products.aspx?CID=3" class="nav-link link-dark px-2" style="border-right: 1px solid #000; height: 80%; display: flex; align-items: center;">Facial</a></li>
                    <li class="nav-item"><a href="products.aspx?CID=4" class="nav-link link-dark px-2" style="border-right: 1px solid #000; height: 80%; display: flex; align-items: center;">Body</a></li>
                    <li class="nav-item"><a href="about.aspx" class="nav-link link-dark px-2" style="border-right: 1px solid #000; height: 80%; display: flex; align-items: center;">About</a></li>
                    <li class="nav-item"><a href="contact.aspx" class="nav-link link-dark px-2" style="height: 80%; display: flex; align-items: center;">Contact</a></li>

                </ul>
            </div>
        </nav>
        <asp:Panel ID="Panel1" runat="server">
            <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">

                    <div class=" carousel-item active">
                        <div class="">
                            <div class="row mb-5 d-flex align-items-center">
                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 text-center d-none">

                                    <h1 class=" mb-3 display-4 fw-bold">
                                        <asp:Label ID="lblPanel1_1Title" runat="server"></asp:Label>
                                    </h1>
                                    <p class=" mb-3">
                                        <asp:Label ID="lblPanel1_1SubTitle" runat="server"></asp:Label>
                                    </p>

                                    <asp:LinkButton ID="lbPanel1_1" CssClass="d-none btn btn-light rounded-pill mb-3" runat="server"></asp:LinkButton>

                                </div>
                                <div class="col-xl-12 col-lg-12 col-sm-12 d-flex flex-column align-items-center">
                                    <asp:ImageButton ID="imgPanel1_1" CssClass="w-100 img-fluid rounded" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item ">
                        <div class="">
                            <div class="row mb-5 d-flex align-items-center">
                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 text-center d-none">

                                    <h1 class=" mb-3 display-4 fw-bold">
                                        <asp:Label ID="lblPanel1_2Title" runat="server"></asp:Label>
                                    </h1>
                                    <p class=" mb-3">
                                        <asp:Label ID="lblPanel1_2SubTitle" runat="server"></asp:Label>
                                    </p>

                                    <asp:LinkButton ID="lbPanel1_2" CssClass="d-none btn btn-light rounded-pill mb-3" runat="server"></asp:LinkButton>

                                </div>
                                <div class="col-xl-12 col-lg-12 col-sm-12 d-flex flex-column align-items-center">
                                    <asp:ImageButton ID="imgPanel1_2" CssClass="w-100 img-fluid rounded" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <div class="">
                            <div class="row mb-5 d-flex align-items-center">
                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 text-center d-none">

                                    <h1 class=" mb-3 display-4 fw-bold">
                                        <asp:Label ID="lblPanel1_3Title" runat="server"></asp:Label>
                                    </h1>
                                    <p class=" mb-3">
                                        <asp:Label ID="lblPanel1_3SubTitle" runat="server"></asp:Label>
                                    </p>

                                    <asp:LinkButton ID="lbPanel1_3" CssClass="d-none btn btn-light rounded-pill mb-3" runat="server"></asp:LinkButton>

                                </div>
                                <div class="col-xl-12 col-lg-12 col-sm-12 d-flex flex-column align-items-center">
                                    <asp:ImageButton ID="imgPanel1_3" CssClass="w-100 img-fluid rounded" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </asp:Panel>


        <div class="container mt-5">

            <asp:Panel ID="Panel2" runat="server">

                <h2 id="panel2Title" runat="server" class="text-center"></h2>

                <div class="d-flex justify-content-center">
                    <div style="background-color: #1f1f1f; width: 8%; height: 5px; border: 1px solid #1f1f1f; border-radius: 25px;"></div>
                </div>

                <div id="panel2_pc" class="row mt-5 mb-5">
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section id="panel2_1_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="d-flex justify-content-center bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel2_1" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel2_1Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel2_1SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel2_1" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section id="panel2_2_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel2_2" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel2_2Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel2_2SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel2_2" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section id="panel2_3_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel2_3" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel2_3Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel2_3SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel2_3" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel2_4" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel2_4Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel2_4SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel2_4" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>

                </div>

                <div id="panel2_mobile" class="row mt-5 mb-5 ">
                    <div id="myCarousel2" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#myCarousel2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#myCarousel2" data-bs-slide-to="1" aria-label="Slide 2"></button>

                        </div>
                        <div class="carousel-inner">

                            <div class=" carousel-item active">
                                <div class="row">
                                    <div class="col-6 mb-2 d-flex justify-content-center align-items-center">

                                        <section style="background-color: #FFF;">
                                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                                <div class="d-flex justify-content-center bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                                    data-mdb-ripple-color="light">
                                                    <asp:ImageButton ID="imgPanelMobile2_1" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                                    <a href="#!">
                                                        <div class="mask"></div>
                                                    </a>
                                                </div>
                                                <div class="card-body pb-0">
                                                    <div class="d-flex justify-content-center">
                                                        <div class="text-center">
                                                            <p class="h5">
                                                                <asp:Label ID="lblPanelMobile2_1Title" runat="server"></asp:Label>
                                                            </p>
                                                            <p class="small text-muted d-none">
                                                                <asp:Label ID="lblPanelMobile2_1SubTitle" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="my-0" />
                                                <div class="card-body pb-0 mb-3">
                                                    <div class="d-flex justify-content-center">
                                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                                        <%--<p class="text-dark">#### 8787</p>--%>
                                                        <asp:LinkButton ID="lbPanelMobile2_1" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                                            </div>
                                        </section>

                                    </div>
                                    <div class="col-6 mb-2 d-flex justify-content-center align-items-center">

                                        <section style="background-color: #FFF;">
                                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                                    data-mdb-ripple-color="light">
                                                    <asp:ImageButton ID="imgPanelMobile2_2" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                                    <a href="#!">
                                                        <div class="mask"></div>
                                                    </a>
                                                </div>
                                                <div class="card-body pb-0">
                                                    <div class="d-flex justify-content-center">
                                                        <div class="text-center">
                                                            <p class="h5">
                                                                <asp:Label ID="lblPanelMobile2_2Title" runat="server"></asp:Label>
                                                            </p>
                                                            <p class="small text-muted d-none">
                                                                <asp:Label ID="lblPanelMobile2_2SubTitle" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="my-0" />
                                                <div class="card-body pb-0 mb-3">
                                                    <div class="d-flex justify-content-center">
                                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                                        <%--<p class="text-dark">#### 8787</p>--%>
                                                        <asp:LinkButton ID="lbPanelMobile2_2" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                                            </div>
                                        </section>

                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item ">
                                <div class="row">
                                    <div class="col-6 d-flex justify-content-center align-items-center">

                                        <section style="background-color: #FFF;">
                                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                                    data-mdb-ripple-color="light">
                                                    <asp:ImageButton ID="imgPanelMobile2_3" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                                    <a href="#!">
                                                        <div class="mask"></div>
                                                    </a>
                                                </div>
                                                <div class="card-body pb-0">
                                                    <div class="d-flex justify-content-center">
                                                        <div class="text-center">
                                                            <p class="h5">
                                                                <asp:Label ID="lblPanelMobile2_3Title" runat="server"></asp:Label>
                                                            </p>
                                                            <p class="small text-muted d-none">
                                                                <asp:Label ID="lblPanelMobile2_3SubTitle" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="my-0" />
                                                <div class="card-body pb-0 mb-3">
                                                    <div class="d-flex justify-content-center">
                                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                                        <%--<p class="text-dark">#### 8787</p>--%>
                                                        <asp:LinkButton ID="lbPanelMobile2_3" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                                            </div>
                                        </section>

                                    </div>
                                    <div class="col-6 d-flex justify-content-center align-items-center">

                                        <section style="background-color: #FFF;">
                                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                                    data-mdb-ripple-color="light">
                                                    <asp:ImageButton ID="imgPanelMobile2_4" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                                    <a href="#!">
                                                        <div class="mask"></div>
                                                    </a>
                                                </div>
                                                <div class="card-body pb-0">
                                                    <div class="d-flex justify-content-center">
                                                        <div class="text-center">
                                                            <p class="h5">
                                                                <asp:Label ID="lblPanelMobile2_4Title" runat="server"></asp:Label>
                                                            </p>
                                                            <p class="small text-muted d-none">
                                                                <asp:Label ID="lblPanelMobile2_4SubTitle" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="my-0" />
                                                <div class="card-body pb-0 mb-3">
                                                    <div class="d-flex justify-content-center">
                                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                                        <%--<p class="text-dark">#### 8787</p>--%>
                                                        <asp:LinkButton ID="lbPanelMobile2_4" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary"></button>
                            </div>
                            </div>--%>
                                            </div>
                                        </section>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel2" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel2" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                </div>
            </asp:Panel>


            <asp:Panel ID="Panel3" runat="server">
                <h2 id="panel3Title" runat="server" class="text-center"></h2>

                <div class="d-flex justify-content-center">
                    <div style="background-color: #1f1f1f; width: 8%; height: 5px; border: 1px solid #1f1f1f; border-radius: 25px;"></div>
                </div>

                <div id="panel3_pc" class="row mt-5 mb-5">
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section id="panel3_1_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="d-flex justify-content-center bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel3_1" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel3_1Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel3_1SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel3_1" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section id="panel3_2_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel3_2" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel3_2Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel3_2SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel3_2" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section id="panel3_3_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel3_3" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel3_3Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel3_3SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel3_3" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 d-flex flex-column align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel3_4" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel3_4Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel3_4SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel3_4" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>

                </div>

                <div id="panel3_mobile" class="row mt-5 mb-5">
                    <div class="col-6 mb-2 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="d-flex justify-content-center bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanelMobile3_1" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile3_1Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile3_1SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile3_1" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-6 mb-2 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanelMobile3_2" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile3_2Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile3_2SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile3_2" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-6 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanelMobile3_3" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile3_3Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile3_3SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile3_3" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-6 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanelMobile3_4" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile3_4Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile3_4SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile3_4" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>

                </div>
            </asp:Panel>

            <asp:Panel ID="Panel4" CssClass="d-none" runat="server">
                <h2 id="panel4Title" runat="server" class="text-center"></h2>

                <div class="d-flex justify-content-center">
                    <div style="background-color: #1f1f1f; width: 8%; height: 5px; border: 1px solid #1f1f1f; border-radius: 25px;"></div>
                </div>

                <div class="row mt-5 mb-5">
                    <div class="col-4 d-flex flex-column align-items-center text-center">

                        <asp:ImageButton ID="imgPanel4_1" Width="140" Height="140" CssClass="bd-placeholder-img rounded-circle" runat="server" />

                        <h2>
                            <asp:Label ID="lblPanel4_1Title" runat="server"></asp:Label>
                        </h2>
                        <p>
                            <asp:Label ID="lblPanel4_1SubTitle" runat="server"></asp:Label>
                        </p>
                        <asp:LinkButton ID="lbPanel4_1" CssClass="btn btn-secondary d-none" runat="server"></asp:LinkButton>
                    </div>
                    <!-- /_col-lg-4 -->

                    <div class="col-4 d-flex flex-column align-items-center text-center">
                        <asp:ImageButton ID="imgPanel4_2" Width="140" Height="140" CssClass="bd-placeholder-img rounded-circle" runat="server" />

                        <h2>
                            <asp:Label ID="lblPanel4_2Title" runat="server"></asp:Label>
                        </h2>
                        <p>
                            <asp:Label ID="lblPanel4_2SubTitle" runat="server"></asp:Label>
                        </p>
                        <asp:LinkButton ID="lbPanel4_2" CssClass="btn btn-secondary d-none" runat="server"></asp:LinkButton>
                    </div>
                    <!-- /_col-lg-4 -->

                    <div class="col-4 d-flex flex-column align-items-center text-center">

                        <asp:ImageButton ID="imgPanel4_3" Width="140" Height="140" CssClass="bd-placeholder-img rounded-circle" runat="server" />
                        <h2>
                            <asp:Label ID="lblPanel4_3Title" runat="server"></asp:Label>
                        </h2>
                        <p>
                            <asp:Label ID="lblPanel4_3SubTitle" runat="server"></asp:Label>
                        </p>
                        <asp:LinkButton ID="lbPanel4_3" CssClass="btn btn-secondary d-none" runat="server"></asp:LinkButton>
                    </div>
                    <!-- /_col-lg-4 -->
                </div>
                <!-- /_row -->
            </asp:Panel>

            <asp:Panel ID="Panel5" runat="server">
                <h2 id="panel5Title" runat="server" class="text-center"></h2>

                <div class="d-flex justify-content-center">
                    <div style="background-color: #1f1f1f; width: 8%; height: 5px; border: 1px solid #1f1f1f; border-radius: 25px;"></div>
                </div>

                <div id="panel5_pc" class="row mt-5 mb-5">
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 p-2 d-flex flex-column align-items-center">

                        <section id="panel5_1_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel5_1" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel5_1Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel5_1SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel5_1" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 p-2 d-flex flex-column align-items-center">

                        <section id="panel5_2_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">

                                    <asp:ImageButton ID="imgPanel5_2" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel5_2Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel5_2SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel5_2" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 p-2 d-flex flex-column align-items-center">

                        <section id="panel5_3_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel5_3" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel5_3Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel5_3SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel5_3" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-6 p-2 d-flex flex-column align-items-center">

                        <section id="panel5_4_mobile" style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanel5_4" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanel5_4Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanel5_4SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanel5_4" CssClass="btn btn-outline-dark rounded-pill w-75" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>

                </div>

                <div id="panel5_mobile" class="row mt-5 mb-5">
                    <div class="col-6 mb-2 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanelMobile5_1" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile5_1Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile5_1SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile5_1" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-6 mb-2 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">

                                    <asp:ImageButton ID="imgPanelMobile5_2" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />
                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile5_2Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile5_2SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile5_2" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-6 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanelMobile5_3" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile5_3Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile5_3SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile5_3" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>
                    <div class="col-6 d-flex justify-content-center align-items-center">

                        <section style="background-color: #FFF;">
                            <div class="card" style="border-radius: 15px; background-color: #eee;">
                                <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
                                    data-mdb-ripple-color="light">
                                    <asp:ImageButton ID="imgPanelMobile5_4" Style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid" runat="server" />

                                    <a href="#!">
                                        <div class="mask"></div>
                                    </a>
                                </div>
                                <div class="card-body pb-0">
                                    <div class="d-flex justify-content-center">
                                        <div class="text-center">
                                            <p class="h5">
                                                <asp:Label ID="lblPanelMobile5_4Title" runat="server"></asp:Label>
                                            </p>
                                            <p class="small text-muted d-none">
                                                <asp:Label ID="lblPanelMobile5_4SubTitle" runat="server"></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0" />
                                <div class="card-body pb-0 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <%--<p class="text-dark fw-bold">₹500_00</p>--%>
                                        <%--<p class="text-dark">#### 8787</p>--%>
                                        <asp:LinkButton ID="lbPanelMobile5_4" CssClass="btn btn-outline-dark rounded-pill w-75 btn-text-small" runat="server"></asp:LinkButton>
                                    </div>
                                </div>
                                <%--<hr class="my-0" />
                            <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
                                <a href="#!" class="text-dark fw-bold">Cancel</a>
                                <button type="button" class="btn btn-primary">Add To Cart</button>
                            </div>
                            </div>--%>
                            </div>
                        </section>

                    </div>

                </div>
            </asp:Panel>
            <%--<div class="row mt-5 mb-5">
                <div class="col-xl-3 col-lg-3 col-sm-12 p-2">
                    <img src="images/product-9_jpg" alt="product image" width="100%" class="img-fluid" />
                    <div class="d-flex justify-content-center flex-column align-items-center product-footer">
                        <div>
                        <p class="mt-2" style="margin-bottom:-1%;">Red Printed T-shirt</p>
                            </div>
                        <div>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                        <i class="fa-regular fa-star"></i>
                        </div>   
                        <div>₹500_00</div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-sm-12 p-2">
                    <img src="images/product-10_jpg" alt="product image" width="100%" class="img-fluid" />
                    <div class="d-flex justify-content-center flex-column align-items-center product-footer">
                        <div>
                        <p class="mt-2" style="margin-bottom:-1%;">Red Printed T-shirt</p>
                            </div>
                        <div>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                        <i class="fa-regular fa-star"></i>
                        </div>   
                        <div>₹500_00</div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-sm-12 p-2">
                    <img src="images/product-11_jpg" alt="product image" width="100%" class="img-fluid" />
                    <div class="d-flex justify-content-center flex-column align-items-center product-footer">
                        <div>
                        <p class="mt-2" style="margin-bottom:-1%;">Red Printed T-shirt</p>
                            </div>
                        <div>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                        <i class="fa-regular fa-star"></i>
                        </div>  
                        <div>₹500_00</div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-sm-12 p-2">
                    <img src="images/product-12_jpg" alt="product image" width="100%" class="img-fluid" />
                    <div class="d-flex justify-content-center flex-column align-items-center product-footer">
                        <div>
                        <p class="mt-2" style="margin-bottom:-1%;">Red Printed T-shirt</p>
                            </div>
                        <div>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                        <i class="fa-regular fa-star"></i>
                        </div>    
                        <div>₹500_00</div>
                    </div>
                </div>
            </div>--%>


            <asp:Panel ID="Panel6" runat="server">
                <h2 id="panel6Title" runat="server" class="text-center"></h2>

                <div class="d-flex justify-content-center">
                    <div style="background-color: #1f1f1f; width: 8%; height: 5px; border: 1px solid #1f1f1f; border-radius: 25px;"></div>
                </div>

                <div id="panel6_pc" class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
                    <div class="col">
                        <asp:LinkButton ID="wLbPanel6_1" runat="server">
                            <div id="imgPanel6_1" runat="server" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg">
                                <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                    <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">
                                        <asp:Label ID="lblPanel6_1Title" runat="server"></asp:Label>
                                    </h2>
                                    <ul class="d-flex list-unstyled mt-auto">
                                        <li class="me-auto">
                                            <img src="images/MB-Logo.svg" style="background-color: #FFF" alt="Logo" width="32" height="32" class="rounded-circle border border-white" />
                                        </li>
                                        <li class="d-flex align-items-center me-3">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#geo-fill" />
                                            </svg>
                                            <small>
                                                <asp:Label ID="lblPanel6_1SubTitle" runat="server"></asp:Label></small>
                                        </li>
                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#calendar3" />
                                            </svg>
                                            <asp:LinkButton ID="lbPanel6_1" CssClass="text-decoration-none text-light fs-5" runat="server"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </div>

                    <div class="col">
                        <asp:LinkButton ID="wLbPanel6_2" runat="server">
                            <div id="imgPanel6_2" runat="server" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg">
                                <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                    <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">
                                        <asp:Label ID="lblPanel6_2Title" runat="server"></asp:Label>
                                    </h2>
                                    <ul class="d-flex list-unstyled mt-auto">
                                        <li class="me-auto">
                                            <img src="images/MB-Logo.svg" style="background-color: #FFF" alt="Logo" width="32" height="32" class="rounded-circle border border-white" />
                                        </li>
                                        <li class="d-flex align-items-center me-3">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#geo-fill" />
                                            </svg>
                                            <small>
                                                <asp:Label ID="lblPanel6_2SubTitle" runat="server"></asp:Label></small>
                                        </li>
                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#calendar3" />
                                            </svg>
                                            <asp:LinkButton ID="lbPanel6_2" CssClass="text-decoration-none text-light fs-5" runat="server"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </div>

                    <div class="col">
                        <asp:LinkButton ID="wLbPanel6_3" runat="server">
                            <div id="imgPanel6_3" runat="server" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg">
                                <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                                    <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">
                                        <asp:Label ID="lblPanel6_3Title" runat="server"></asp:Label>
                                    </h2>
                                    <ul class="d-flex list-unstyled mt-auto">
                                        <li class="me-auto">
                                            <img src="images/MB-Logo.svg" style="background-color: #FFF" alt="Logo" width="32" height="32" class="rounded-circle border border-white" />
                                        </li>
                                        <li class="d-flex align-items-center me-3">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#geo-fill" />
                                            </svg>
                                            <small>
                                                <asp:Label ID="lblPanel6_3SubTitle" runat="server"></asp:Label></small>
                                        </li>
                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#calendar3" />
                                            </svg>
                                            <asp:LinkButton ID="lbPanel6_3" CssClass="text-decoration-none text-light fs-5" runat="server"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </div>

                </div>
                <%------------------------------------%>
                <div id="panel6_mobile" class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
                    <div class="col-4">
                        <asp:LinkButton ID="wLbPanelMobile6_1" runat="server">
                            <div id="imgPanelMobile6_1" runat="server" class="card card-cover overflow-hidden text-white bg-dark rounded-5 shadow-lg">
                                <div class="d-flex flex-column p-5 pb-3 text-white text-shadow-1">
                                    <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold d-none">
                                        <asp:Label ID="lblPanelMobile6_1Title" runat="server"></asp:Label>
                                    </h2>
                                    <ul class="d-flex list-unstyled mt-auto">
                                        <li class="me-auto">
                                            <img src="images/MB-Logo.svg" style="background-color: #FFF" alt="Logo" width="32" height="32" class="d-none rounded-circle border border-white" />
                                        </li>
                                        <li class="d-flex align-items-center me-3">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#geo-fill" />
                                            </svg>
                                            <small>
                                                <asp:Label CssClass="d-none" ID="lblPanelMobile6_1SubTitle" runat="server"></asp:Label></small>
                                        </li>
                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#calendar3" />
                                            </svg>
                                            <asp:LinkButton ID="lbPanelMobile6_1" CssClass="d-none text-decoration-none text-light fs-5" runat="server"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </div>

                    <div class="col-4">
                        <asp:LinkButton ID="wLbPanelMobile6_2" runat="server">
                            <div id="imgPanelMobile6_2" runat="server" class="card card-cover overflow-hidden text-white bg-dark rounded-5 shadow-lg">
                                <div class="d-flex flex-column p-5 pb-3 text-white text-shadow-1">
                                    <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold d-none">
                                        <asp:Label ID="lblPanelMobile6_2Title" runat="server"></asp:Label>
                                    </h2>
                                    <ul class="d-flex list-unstyled mt-auto">
                                        <li class="me-auto">
                                            <img src="images/MB-Logo.svg" style="background-color: #FFF" alt="Logo" width="32" height="32" class="d-none rounded-circle border border-white" />
                                        </li>
                                        <li class="d-flex align-items-center me-3">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#geo-fill" />
                                            </svg>
                                            <small>
                                                <asp:Label CssClass="d-none" ID="lblPanelMobile6_2SubTitle" runat="server"></asp:Label></small>
                                        </li>
                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#calendar3" />
                                            </svg>
                                            <asp:LinkButton ID="lbPanelMobile6_2" CssClass="d-none text-decoration-none text-light fs-5" runat="server"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </div>

                    <div class="col-4">
                        <asp:LinkButton ID="wLbPanelMobile6_3" runat="server">
                            <div id="imgPanelMobile6_3" runat="server" class="card card-cover overflow-hidden text-white bg-dark rounded-5 shadow-lg">
                                <div class="d-flex flex-column p-5 pb-3 text-white text-shadow-1">
                                    <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold d-none">
                                        <asp:Label ID="lblPanelMobile6_3Title" runat="server"></asp:Label>
                                    </h2>
                                    <ul class="d-flex list-unstyled mt-auto">
                                        <li class="me-auto">
                                            <img src="images/MB-Logo.svg" style="background-color: #FFF" alt="Logo" width="32" height="32" class="d-none rounded-circle border border-white" />
                                        </li>
                                        <li class="d-flex align-items-center me-3">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#geo-fill" />
                                            </svg>
                                            <small>
                                                <asp:Label CssClass="d-none" ID="lblPanelMobile6_3SubTitle" runat="server"></asp:Label></small>
                                        </li>
                                        <li class="d-flex align-items-center">
                                            <svg class="bi me-2" width="1em" height="1em">
                                                <use xlink:href="#calendar3" />
                                            </svg>
                                            <asp:LinkButton ID="lbPanelMobile6_3" CssClass="d-none text-decoration-none text-light fs-5" runat="server"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </div>

                </div>
            </asp:Panel>
        </div>

        <asp:Panel ID="Panel7" runat="server">
            <div class="mt-5 mb-2">
                <div class="container">
                    <div class=" row d-flex align-items-center">
                        <div class="col-xl-6 col-lg-6 col-sm-12 mt-5 mb-5 d-flex justify-content-center">

                            <asp:ImageButton ID="imgPanel7_1" CssClass="w-50 rounded img-fluid" runat="server" />

                        </div>
                        <div class="col-xl-6 col-lg-6 col-sm-12 mt-5 mb-5 text-center">
                            <h1 class="mb-3 display-4 fw-bold">
                                <asp:Label ID="lblPanel7_1Title" runat="server"></asp:Label>
                            </h1>
                            <p class="text-secondary">
                                <asp:Label ID="lblPanel7_1SubTitle" runat="server"></asp:Label>

                            </p>
                            <asp:LinkButton ID="lbPanel7_1" CssClass="btn rounded-pill bg-dark text-light" runat="server"></asp:LinkButton>

                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel8" CssClass="d-none" runat="server">
            <div class="mt-5 mb-5">
                <div class="container" id="testomonial">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-sm-12 p-5">
                            <div class="shadow p-4 d-flex justify-content-center flex-column align-items-center">
                                <h1><i class="fas fa-quote-left"></i></h1>
                                <p class="text-center fs-6">
                                    <asp:Label ID="lblPanel8_1SubTitle" runat="server"></asp:Label>
                                </p>

                                <div>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star-half-stroke"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <asp:Image ID="imgPanel8_1" Width="70" CssClass="img-fluid rounded-circle mt-2 mb-1" runat="server" />

                                <b>
                                    <asp:Label ID="lblPanel8_1Title" runat="server" Text="Label"></asp:Label>
                                </b>
                            </div>
                        </div>

                        <div class="col-xl-4 col-lg-4 col-sm-12 p-5">
                            <div class="shadow p-4 d-flex justify-content-center flex-column align-items-center">
                                <h1><i class="fas fa-quote-left"></i></h1>
                                <p class="text-center fs-6">
                                    <asp:Label ID="lblPanel8_2SubTitle" runat="server"></asp:Label>
                                </p>

                                <div>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star-half-stroke"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <asp:Image ID="imgPanel8_2" Width="70" CssClass="img-fluid rounded-circle mt-2 mb-1" runat="server" />

                                <b>
                                    <asp:Label ID="lblPanel8_2Title" runat="server" Text="Label"></asp:Label>
                                </b>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-sm-12 p-5">
                            <div class="shadow p-4 d-flex justify-content-center flex-column align-items-center">
                                <h1><i class="fas fa-quote-left"></i></h1>
                                <p class="text-center fs-6">
                                    <asp:Label ID="lblPanel8_3SubTitle" runat="server"></asp:Label>
                                </p>

                                <div>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star-half-stroke"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <asp:Image ID="imgPanel8_3" Width="70" CssClass="img-fluid rounded-circle mt-2 mb-1" runat="server" />

                                <b>
                                    <asp:Label ID="lblPanel8_3Title" runat="server" Text="Label"></asp:Label>
                                </b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </asp:Panel>
        <asp:Panel ID="Panel9" runat="server" CssClass="mt-5">
            <div class="container">

                <div class="row d-flex align-items-center   ">
                    <div class="col-lg-5 col-md-12 col-sm-12  ">
                        <span>PAYMENT</span>
                        <br />
                        <span><i class="fal fa-shield-check"></i>100% Payment Protection, Easy Return Policy</span>

                        <div class="d-flex align-items-center justify-content-around">
                            <img src="images/visa.jpg" alt="Alternate Text" class="m-2" width="30" />
                            <img src="images/MasterCard_early_1990s_logo.jpg" class="m-2" width="30" alt="Alternate Text" />
                            <img src="images/Maestro.jpg" class="m-2" width="50" alt="Alternate Text" />
                            <img src="images/rupay-card-1566468196.jpg" class="m-2" width="30" alt="Alternate Text" />

                            <img src="images/upi.png" alt="Alternate Text" class="m-2" width="30" />
                            <img src="images/net-banking-icon-png-3.png" class="m-2" alt="Alternate Text" width="30" />
                        </div>
                    </div>

                    <div class="col-lg-7 col-md-12 col-sm-12 ">
                        <div class="d-flex align-items-end justify-content-around">
                            <div class="m-2 d-flex flex-column align-items-center">
                                <img src="images/0222_NP_techtopic_phosphate_img-removebg-preview.png" width="75" alt="Alternate Text" />
                                <p class="text-uppercase text-center">Phosphate Free</p>
                            </div>

                            <div class="m-2 d-flex flex-column align-items-center">
                                <img src="images/paraben-free-label-badge-health-care-vector-illustration_100456-9717-removebg-preview.png" width="75" alt="Alternate Text" />
                                <p class="text-uppercase text-center">Paraben Free</p>
                            </div>

                            <div class="m-2 d-flex flex-column align-items-center">
                                <img src="images/360_F_335297433_xCfxKNKJT4ANAriwmTDu4tYo6AmxnDrb-removebg-preview.png" width="75" alt="Alternate Text" />
                                <p class="text-uppercase text-center">Sulfate Free</p>
                            </div>

                            <div class="m-2 d-flex flex-column align-items-center">
                                <img src="images/png-clipart-what-so-not-every-time-you-see-me-the-quack-new-jersey-product-cruelty-free-text-logo-removebg-preview.png" width="75" alt="Alternate Text" />
                                <p class="text-uppercase text-center">Cruelty Free</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <div class="footer-shadow">
            <div class="container" style="background-color: #fff; color: #000;">
                <footer class="py-5">
                    <div class="row">
                        <div class="col-6 col-md-2 mb-3">
                            <h5>Useful links</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="index.aspx" class="nav-link p-0 text-muted">Home</a></li>
                                <li class="nav-item mb-2"><a href="products.aspx" class="nav-link p-0 text-muted">Products</a></li>
                                <li class="nav-item mb-2"><a href="contact.aspx" class="nav-link p-0 text-muted">Contact Us</a></li>
                                <li class="nav-item mb-2"><a href="about.aspx" class="nav-link p-0 text-muted">About</a></li>
                                <li class="nav-item mb-2"><a href="account.aspx" class="nav-link p-0 text-muted">Account</a></li>
                            </ul>
                        </div>

                        <div class="col-6 col-md-2 mb-3">
                            <h5>Navigate</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="TermsAndConditions.aspx" class="nav-link p-0 text-muted">Terms & Conditions</a></li>
                            </ul>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="privacy.aspx" class="nav-link p-0 text-muted">Privacy Policy</a></li>
                            </ul>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="refund.aspx" class="nav-link p-0 text-muted">Refund & Cancellation</a></li>
                            </ul>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="cashback.aspx" class="nav-link p-0 text-muted">Cashback & Offers</a></li>
                            </ul>

                        </div>

                        <div class="col-6 col-md-2 mb-3">
                        </div>



                        <div class="col-md-5 offset-md-1 mb-3 d-flex flex-column align-items-center">
                            <img src="images/MB-Logo.svg" class="rounded" alt="logo" style="background-color: #FFF;" width="175" />
                        </div>

                    </div>
                    <span>&copy; 2022 Mogal Enterprise All Rights Reserved.</span>
                    <div class="d-flex flex-column flex-sm-row justify-content-center py-4 my-4 border-top">

                        <div class="row">
                            <div class="col-12">
                                <div class="text-center mb-3 fs-5">Show some 🖤 on social media</div>
                                <ul class="list-unstyled d-flex justify-content-around">
                                    <li class="ms-3"><a class="link-dark" href="https://twitter.com/IMilkandberries"><i class="fa-brands fa-twitter bi text-dark fa-2xl"></i></a></li>
                                    <li class="ms-3"><a class="link-dark" href="https://www.instagram.com/milkandberries.india/"><i class="fa-brands fa-instagram bi text-dark fa-2xl"></i></a></li>
                                    <li class="ms-3"><a class="link-dark" href="https://www.facebook.com/milkandberries.india"><i class="fa-brands fa-facebook bi text-dark fa-2xl"></i></a></li>
                                    <li class="ms-3"><a class="link-dark" href="https://www.linkedin.com/in/mogal-enterprise-ba935223a/"><i class="fa-brands fa-linkedin-in bi text-dark fa-2xl"></i></a></li>
                                    <li class="ms-3"><a class="link-dark" href="https://www.pinterest.com/milkandberries_india/"><i class="fa-brands fa-pinterest bi text-dark fa-2xl"></i></a></li>
                                </ul>
                            </div>
                            <div class="col-12">
                                <p class="fs-5 text-center">Milk And Berries &trade;</p>
                            </div>
                        </div>

                    </div>
                </footer>
            </div>
        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script>

        // Wrap every letter in a span
        var textWrapper = document.querySelector('.ml3');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

        anime.timeline({ loop: true })
            .add({
                targets: '.ml3 .letter',
                opacity: [0, 1],
                easing: "easeInOutQuad",
                duration: 650,
                delay: (el, i) => 100 * (i + 1)
            }).add({
                targets: '.ml3',
                opacity: 0,
                duration: 100,
                easing: "easeOutExpo",
                delay: 1000
            });



        const mediaQuery = window.matchMedia('(max-width: 576px)')
        // Check if the media query is true
        if (mediaQuery.matches) {
            document.getElementById('imgPanel4_1').classList.add('p-3')
            document.getElementById('imgPanel4_2').classList.add('p-3')
            document.getElementById('imgPanel4_3').classList.add('p-3')
            // Then trigger an alert
            //alert('Media Query Matched!')
        }
    </script>
</body>
</html>



