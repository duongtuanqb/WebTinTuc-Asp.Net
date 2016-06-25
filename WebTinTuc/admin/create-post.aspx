<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="create-post.aspx.cs" Inherits="WebTinTuc.createpost" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Thêm bài - Trang tin tức tổng hợp</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ccr-slide-main">
        <h2>Thêm bài mới</h2>

        <div class="form-group">
            <label for="ddlCateogries">Danh mục</label>
            <asp:DropDownList ID="ddlCateogries" runat="server" CssClass="form-control" Width="350px"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="txtTieuDe">Tiêu đề</label>
            <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtThumb">Ảnh mô tả</label>
            <asp:TextBox ID="txtThumb" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtNoiDung">Nội dung</label>
            <CKEditor:CKEditorControl ID="txtNoiDung" runat="server"></CKEditor:CKEditorControl>
        </div>

        <div class="form-group">
            <div class="col-sm-12 controls">
                <asp:Button ID="btnThemBai" runat="server" Text="Thêm bài" CssClass="btn btn-primary pull-right" OnClick="btnThemBai_Click" />
             </div>
        </div>
    </div>
</asp:Content>
