<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebTinTuc.contact" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Liên hệ - Trang tin tức tổng hợp</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
	<![endif]-->
</head>
<body>
    <form id="form1" runat="server">

<header id="ccr-header">

	<section id="ccr-site-title">
		<div class="container">
			<div class="site-logo">
				<a href="/" class="navbar-brand">
					<img src="img/logo.png" alt="Side Logo" />
						<h1>Trang <span>Tin tức</span></h1>
						<h3>Cập nhật tin tức tổng hợp</h3>
				</a>
			</div> <!-- / .navbar-header -->

			<div class="add-space">
				Quảng cáo 728 x 90px
			</div> <!-- / .adspace -->

		</div>	<!-- /.container -->
	</section> <!-- / #ccr-site-title -->



	<section id="ccr-nav-main">
		<nav class="main-menu">
			<div class="container">

				<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".ccr-nav-main">
				            <i class="fa fa-bars"></i>
			          	</button> <!-- /.navbar-toggle -->
				</div> <!-- / .navbar-header -->

				<div class="collapse navbar-collapse ccr-nav-main">
					<ul class="nav navbar-nav">
						<li><a href="\">Trang chủ</a></li>

                        <asp:Repeater ID="rpCategories" runat="server">
                            <ItemTemplate>
                                <li><a href="category.aspx?idcat=<%# Eval("ID_cat") %>"><%# Eval("Cat_name") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <li><a class="active" href="contact.aspx">Liên hệ</a></li>
                        <% if ((Boolean)Session["user"] == false) { %>
                             <li><a href="login.aspx">Đăng nhập</a></li>
                        <% } else { %>
                                 <li><a href="/admin">Quản lý</a></li>         
                                <li><a href="logout.aspx"><%# Eval("User_name") %> Thoát</a></li>                                
                        <% } %>
					</ul> <!-- /  .nav -->
				</div><!-- /  .collapse .navbar-collapse  -->

				<div id="currentTime" class="pull-right current-time">
					<i class="fa fa-clock-o"></i> <span id="clock">Loading...</span>


				</div><!-- / #currentTime -->

			</div>	<!-- /.container -->
		</nav> <!-- /.main-menu -->
	</section> <!-- / #ccr-nav-main -->

</header> <!-- /#ccr-header -->

<section id="ccr-main-section">
	<div class="container">
        <section id="ccr-left-section" class="col-md-8">
            <div class="current-page">
				<a href="contact.aspx"><i class="fa fa-home"></i> <i class="fa fa-angle-double-right"></i></a> Liên hệ
			</div> <!-- / .current-page -->

			<section id="ccr-contact-form">
                    <asp:TextBox ID="author" name="author" runat="server" placeholder="Họ tên" required="author"></asp:TextBox>
                    <asp:TextBox ID="email" name="email" runat="server" placeholder="Email" required="email"></asp:TextBox>
                    <asp:TextBox ID="url" name="url" runat="server" placeholder="Website"></asp:TextBox>
                    <asp:TextBox ID="comment" runat="server" placeholder="Nội dung" TextMode="MultiLine" Rows="8" required="comment"></asp:TextBox>
                    <asp:Button ID="submit" runat="server" Text="Gửi" CssClass="btn btn-primary pull-right" />
              <!-- /#commentform -->
					
			</section> <!-- /#ccr-contact-form -->
        </section>

        <aside id="ccr-right-section" class="col-md-4 ccr-home">
            <section id="ccr-contact-sidebar">
                <p>
                    <span>Liên hệ</span>
                </p>
                <address>
                    <p>
                        Địa chỉ: 189 Nguyễn Oanh, Phường 10, Quận Gò Vấp, Tp. Hồ Chí Minh
                    </p>
                    <p>
                        Điện thoại: (08) 3 866 721
                    </p>
                    <p>
                        Email: lienhe@tdnu.edu.vn
                    </p>
                </address>

                <p>
                    <span>Mạng xã hội</span>
                </p>
                <ul>
                    <li>
                        <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                    </li>
                    <li>
                        <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                    </li>
                    <li>
                        <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                    </li>
                </ul>
            </section> <!-- /#ccr-contact-sidebar -->
        </aside>
    </div>
</section>

<iframe id="iframe" runat="server"></iframe>

<footer id="ccr-footer">
	<div class="container">
	 	<div class="copyright">
	 		&copy; 2016, Website tin tức cấp nhật tổng hợp
	 	</div> <!-- /.copyright -->

	 	<div class="footer-social-icons">
	 		<ul>
	 			<li>
	 				<a href="#"  class="google-plus"><i class="fa fa-google-plus"></i></a>
	 			</li>
	 			<li >
	 				<a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
	 			</li>
	 			<li >
	 				<a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
	 			</li>
	 			<li >
	 				<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
	 			</li>
	 		</ul>
	 		
	 	</div><!--  /.cocial-icons -->

	</div> <!-- /.container -->
</footer>  <!-- /#ccr-footer -->

	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
        <script type="text/javascript">
            function refrClock() {

                var d = new Date();

                var s = d.getSeconds();

                var m = d.getMinutes();

                var h = d.getHours();

                var day = d.getDay();

                var date = d.getDate();

                var month = d.getMonth();

                var year = d.getFullYear();

                var days = new Array("Chủ nhật", "Thứ hai", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7");

                var months = new Array("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"); var am_pm;

                if (s < 10) { s = "0" + s }

                if (m < 10) { m = "0" + m }

                if (h > 12)

                { h -= 12; AM_PM = "PM" }

                else { AM_PM = "AM" }

                if (h < 10) { h = "0" + h }

                document.getElementById("clock").innerHTML = days[day] + " , " + date + "." + months[month] + "." + year + " " + " , " + h + ":" + m + ":" + s + " " + AM_PM; setTimeout("refrClock()", 1000);
            }
            refrClock();
        </script>
    </form>
</body>
</html>