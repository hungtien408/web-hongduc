<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row content-bg">
        <div class="col-md-3 desktop-992">
            <div class="colAside aside-desktop">
                <div class="aside-main">
                    <asp:ListView ID="lstExpressCategory2" runat="server" DataSourceID="odsExpressCategory2"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="aside-title">
                                <a href="javascript:void(0);">
                                    <%# Eval("ArticleCategoryName") %></a>
                            </div>
                            <div class="aside-list">
                                <%--<asp:HiddenField ID="hdnCategoryID2" Value='<%# Eval("ArticleCategoryID") %>' runat="server" />--%>
                                <asp:Label ID="lblCategoryID2" runat="server" Text='<%# Eval("ArticleCategoryID") %>'
                                    Visible="False"></asp:Label>
                                <asp:ListView ID="lstExpress2" runat="server" DataSourceID="odsExpress2" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li><a href='<%# !string.IsNullOrEmpty(Eval("ArticleLink").ToString()) ? Eval("ArticleLink") : progressTitle(Eval("ArticleTitle")) + "-cp-" + Eval("ArticleID") + ".aspx" %>'>
                                            <span class="fa fa-circle"></span>
                                            <%# Eval("ArticleTitle") %></a> </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul>
                                            <li runat="server" id="itemPlaceholder"></li>
                                        </ul>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsExpress2" runat="server" SelectMethod="ArticleSelectAll"
                                    TypeName="TLLib.Article">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ArticleTitle" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:ControlParameter ControlID="lblCategoryID2" Name="ArticleCategoryID" PropertyName="Text"
                                            Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
                                        <asp:Parameter Name="IsNew" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsExpressCategory2" runat="server" SelectMethod="ArticleCategorySelectAll"
                        TypeName="TLLib.ArticleCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="4" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="formpage">
                <div class="text section">
                    <label for="Full_Name">
                        Họ và Tên *</label>
                    <%--<input id="Full_Name" class="maxfield" type="text" size="35" value="" name="Full_Name">--%>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtFullName"
                        ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <div class="text section">
                        <label for="Email_Address">
                            Địa chỉ email *</label>
                        <%--<input type="text" size="35" value="" name="Email_Address" class="maxfield" id="Email_Address">--%>
                        <asp:TextBox ID="txtEmail" CssClass="maxfield" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                            runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email is error!"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                            ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                            ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Information required!"
                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text section">
                        <label for="Telephone_Number">
                            Số điện thoại *</label>
                        <%--<input type="text" size="35" value="" name="Telephone_Number" class="maxfield" id="Telephone_Number">--%>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="maxfield"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                            Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtPhone" ErrorMessage="Information required!"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text section">
                        <label for="Your_Enquiry">
                            Lời nhắn *</label>
                        <%--<textarea cols="35" rows="5" name="Your_Enquiry" id="Your_Enquiry"></textarea>--%>
                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" cols="45" Rows="2" CssClass="form-area"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                            ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtContent"
                            ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text section">
                        <label for="Your_Enquiry">
                            Code *</label>
                        <asp:TextBox ID="txtVerifyCode" CssClass="maxfield" runat="server"></asp:TextBox>
                        <asp:RadCaptcha ID="RadCaptcha1" ForeColor="Red" Font-Bold="true" ValidationGroup="SendEmail"
                            runat="server" ErrorMessage="+ Mã an toàn: không chính xác." ValidatedTextBoxID="txtVerifyCode"
                            Display="Dynamic">
                            <CaptchaImage Height="35" Width="135" RenderImageOnly="True" />
                        </asp:RadCaptcha>
                    </div>
                    <div class="section end">
                        <asp:Button ID="btnSend" CssClass="formbutton" runat="server" Text="Gởi lời nhắn"
                            ValidationGroup="SendEmail" OnClick="btSend_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 ipadmo-992">
            <div class="asidemobi">
            </div>
        </div>
    </div>
</asp:Content>
