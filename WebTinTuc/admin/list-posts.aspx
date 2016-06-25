<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="list-posts.aspx.cs" Inherits="WebTinTuc.admin.list_posts" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Danh sách bài viết</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="169px" Width="100%" AllowPaging="True" CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ID_post" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ID_Post" HeaderText="ID" />
                    <asp:BoundField DataField="Post_title" HeaderText=" Tên bài viết" />
                    <asp:BoundField DataField="Post_date" HeaderText="Ngày đăng" DataFormatString="{0:dd-M-yyyy}" />
                    <asp:BoundField DataField="Cat_name" HeaderText="Danh mục" />
                    <asp:ButtonField ButtonType="Button" CommandName="detail" Text="Chi tiết">
                        <ControlStyle CssClass="btn btn-info" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ButtonField>
                    <asp:ButtonField ButtonType="Button" CommandName="edit" Text="Sửa">
                        <ControlStyle CssClass="btn btn-success" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ButtonField>
                    <asp:ButtonField ButtonType="Button" CommandName="delete" Text="Xóa">
                        <ControlStyle CssClass="btn btn-danger" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ButtonField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-ys" />
            </asp:GridView>
        </div>

        <!-- Xem chi tiet -->
        <div id="detailModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="myModalLabel">Chi tiết</h4>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black" FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true" FieldHeaderStyle-BackColor="LavenderBlush" FieldHeaderStyle-ForeColor="Black" BorderStyle="Groove" AutoGenerateRows="False">
                                    <Fields>
                                        <asp:BoundField DataField="Post_title" HeaderText="Tên bài viết" />
                                        <asp:BoundField DataField="Post_date" DataFormatString="{0:dd-M-yyyy}" HeaderText="Ngày đăng" />
                                        <asp:BoundField DataField="Cat_name" HeaderText="Danh mục" />
                                    </Fields>
                                </asp:DetailsView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </div>
            </div>
        </div> <!-- / #detailModal -->

        <!-- Sua bai viet -->
        <div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="editModalLabel">Sửa bài viết</h4>
                    </div>
                    <asp:UpdatePanel ID="upEdit" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="ddlCateogries">Danh mục</label>
                                    <asp:DropDownList ID="ddlCateogries" runat="server" CssClass="form-control" Width="350px" ></asp:DropDownList>
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
                            </div>
                            <div class="modal-footer">
                                <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-info" />
                                <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div> <!-- / #editlModal -->

        <!-- Xoa bai viet -->
        <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 id="delModalLabel">Xóa bài viết</h4>
                    </div>
                    <asp:UpdatePanel ID="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                Bạn có chắc muốn xóa bài viết này?
                            <asp:HiddenField ID="HfDeleteID" runat="server" />
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                                <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Hủy</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div> <!-- / #deleteModal -->
    </div>
</asp:Content>
