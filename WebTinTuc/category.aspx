<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="WebTinTuc.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><%=Session["title"] %> - Trang tin tức tổng hợp</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="rpBreadcrumb" runat="server">
        <ItemTemplate>
            <div class="current-page">
                <a href="/"><i class="fa fa-home"></i> Trang chủ</a> <i class="fa fa-angle-double-right"></i>
                <a href="#"><%# Eval("Cat_name") %></a>
            </div>
            <!-- / .current-page -->
        </ItemTemplate>
    </asp:Repeater>

    <section id="ccr-blog">
        <asp:Repeater ID="rpPost" runat="server">
            <ItemTemplate>
        <article>
            <figure class="blog-thumbnails">
                <img src="<%# (Eval("Post_thumb") == null ? "img/default.jpg" : Eval("Post_thumb")) %>" alt="<%# Eval("Post_title") %>">
            </figure>
            <!-- /.blog-thumbnails -->
            <div class="blog-text">
                <h1><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>"><%# Eval("Post_title") %></a></h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad, provident, nam sint iure excepturi possimus dolor et iusto id praesentium! Quaerat veritatis placeat ut ad repellendus maxime quos id consequuntur. 
                </p>

                <div class="meta-data">
                    <span class="read-more"><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>">Xem thêm</a></span>
                </div>
            </div>
            <!-- /.blog-text -->
        </article>
                </ItemTemplate>
            </asp:Repeater>
    </section>

</asp:Content>
