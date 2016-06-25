<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebTinTuc.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Trang chủ - Trang tin tức tổng hợp</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="ccr-slide-main" class="carousel slide" data-ride="carousel">

        <!-- Carousel items -->
        <div class="carousel-inner">
            <asp:Repeater ID="rpSlideHome" runat="server">
                <ItemTemplate>
                    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
                        <div class="container slide-element">
                            <a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>">
                                <img src="<%# (Eval("Post_thumb") == null ? "img/default.jpg" : Eval("Post_thumb")) %>" alt="<%# Eval("Post_title") %>" />
                            </a>
                            <p><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>"><%# Eval("Post_title") %></a></p>
                        </div>
                        <!-- /.slide-element -->
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <!-- /.carousel-inner -->
        <!-- slider nav -->
        <a class="carousel-control left" href="#ccr-slide-main" data-slide="prev"><i class="fa fa-arrow-left"></i></a>
        <a class="carousel-control right" href="#ccr-slide-main" data-slide="next"><i class="fa fa-arrow-right"></i></a>
    </section><!-- /#ccr-slide-main -->

    <asp:Repeater ID="rpCategories" runat="server" OnItemDataBound="rpCategories_ItemDataBound">
        <ItemTemplate>
            <section id="ccr-latest-post-gallery">
                <div class="ccr-gallery-ttile">
                    <span></span>
                    <p><a href="category.aspx?idcat=<%# Eval("ID_cat") %>"><%# Eval("Cat_name") %></a></p>
                </div>
                <!-- .ccr-gallery-ttile -->
                <ul class="ccr-latest-post">
                    <asp:Repeater ID="rpPosts" runat="server">
                        <ItemTemplate>
                            <li>
                                <div class="ccr-thumbnail">
                                    <img src="<%# (Eval("Post_thumb") == null ? "img/default.jpg" : Eval("Post_thumb")) %>" alt="<%# Eval("Post_title") %>">
                                    <p><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>">Xem thêm</a></p>
                                </div>
                                <h4><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>"><%# Eval("Post_title") %></a></h4>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </section>
            <!-- / #ccr-latest-post-gallery -->
            <section class="bottom-border"></section>
            <!-- /#bottom-border -->
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>