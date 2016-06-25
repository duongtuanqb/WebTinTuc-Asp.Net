<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="single.aspx.cs" Inherits="WebTinTuc.single" %>
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

    <asp:Repeater ID="rpContent" runat="server">
        <ItemTemplate>
            <article id="ccr-article">
                <h1><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>"><%# Eval("Post_title") %></a></h1>

                <div class="article-like-comment-date">
                    Đăng lúc <time datetime="<%# Eval("Post_date") %>"><%# Eval("Post_date") %></time>
                </div>
                <!-- /.article-like-comment-date -->

                <p><%# Eval("Post_content") %></p>

            </article>
            <!-- /#ccr-single-post -->
        </ItemTemplate>
    </asp:Repeater>

    <section id="ccr-article-related-post">
        <div class="ccr-gallery-ttile">
            <span class="bottom"></span>
            <p>Bài viết cùng chuyên mục</p>
        </div>
        <!-- .ccr-gallery-ttile -->
        <ul>
            <asp:Repeater ID="rpPostsRandom" runat="server">
                <ItemTemplate>
                    <li>
                        <div class="ccr-thumbnail">
                            <img src="<%# (Eval("Post_thumb") == null ? "img/default.jpg" : Eval("Post_thumb")) %>" alt="<%# Eval("Post_title") %>">
                            <p><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>">Xem thêm</a></p>
                        </div>
                        <h5><a href="single.aspx?idcat=<%# Eval("ID_cat") %>&id=<%# Eval("ID_post") %>"><%# Eval("Post_title") %></a></h5>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </section>
    
</asp:Content>
