<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="lien-he-hau-can.aspx.cs" Inherits="lien_he" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row content-bg">
        <div class="col-md-3 desktop-992">
            <div class="colAside aside-desktop">
                <div class="aside-main">
                    <asp:ListView ID="lstHauCanCategory" runat="server" DataSourceID="odsHauCanCategory"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="aside-title">
                                <a href='<%# !string.IsNullOrEmpty(Eval("ArticleCategoryLink").ToString()) ? Eval("ArticleCategoryLink") : (string.IsNullOrEmpty(Eval("Content").ToString()) ? "javascript:void(0);" : progressTitle(Eval("ArticleCategoryName")) + "-hci-" + Eval("ArticleCategoryID") + ".aspx") %>'>
                                    <%# Eval("ArticleCategoryName") %></a>
                            </div>
                            <div class="aside-list">
                                <asp:HiddenField ID="hdnCategoryID" Value='<%# Eval("ArticleCategoryID") %>' runat="server" />
                                <asp:ListView ID="lstHauCanCategorySub" runat="server" DataSourceID="odsHauCanCategorySub"
                                    EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li><a href='<%# !string.IsNullOrEmpty(Eval("ArticleCategoryLink").ToString()) ? Eval("ArticleCategoryLink") : (string.IsNullOrEmpty(Eval("Content").ToString()) ? "javascript:void(0);" : progressTitle(Eval("ArticleCategoryName")) + "-hci-" + Eval("ArticleCategoryID") + ".aspx") %>'><span class="fa fa-circle"></span>
                                            <%# Eval("ArticleCategoryName") %></a>
                                            <asp:HiddenField ID="hdnCategorySubID" Value='<%# Eval("ArticleCategoryID") %>' runat="server" />
                                            <asp:ListView ID="lstHauCan" runat="server" DataSourceID="odsHauCan" EnableModelValidation="True">
                                                <ItemTemplate>
                                                    <li><a href='<%# !string.IsNullOrEmpty(Eval("ArticleLink").ToString()) ? Eval("ArticleLink") : progressTitle(Eval("ArticleTitle")) + "-hc-" + Eval("ArticleID") + ".aspx" %>'>
                                                        <span class="fa fa-angle-right"></span>
                                                        <%# Eval("ArticleTitle") %></a></li>
                                                </ItemTemplate>
                                                <LayoutTemplate>
                                                    <ul>
                                                        <li runat="server" id="itemPlaceholder"></li>
                                                    </ul>
                                                </LayoutTemplate>
                                            </asp:ListView>
                                            <asp:ObjectDataSource ID="odsHauCan" runat="server" SelectMethod="ArticleSelectAll"
                                                TypeName="TLLib.Article">
                                                <SelectParameters>
                                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                                    <asp:Parameter Name="Keyword" Type="String" />
                                                    <asp:Parameter Name="ArticleTitle" Type="String" />
                                                    <asp:Parameter Name="Description" Type="String" />
                                                    <asp:ControlParameter ControlID="hdnCategorySubID" Name="ArticleCategoryID" PropertyName="Value"
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
                                        </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul>
                                            <li runat="server" id="itemPlaceholder"></li>
                                        </ul>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsHauCanCategorySub" runat="server" SelectMethod="ArticleCategorySelectAll"
                                    TypeName="TLLib.ArticleCategory">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hdnCategoryID" Name="parentID" PropertyName="Value"
                                            Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                        <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsHauCanCategory" runat="server" SelectMethod="ArticleCategorySelectAll"
                        TypeName="TLLib.ArticleCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="6" Name="parentID" Type="Int32" />
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
                <h3>Liên hệ</h3>
                <div class="text section">
                    <p>
                        HỒNG ĐỨC EXPRESS - Với quy mô và kinh nghiệm trong ngành dịch vụ logistic cho phép chúng tôi điều chỉnh các giải pháp
                        có tính cạnh tranh cao cho tất cả các khách hàng của chúng tôi.</p>
                    <p>
                        Cho dù bạn là một doanh nghiệp nhỏ đang tìm kiếm để vận chuyển ít hơn một xe tải
                        hay là một công ty tiếp vận chuyên nghiệp đang tìm cách để hoàn thiện hoạt động
                        vận chuyển hàng hóa của mình, chúng tôi sẽ cung cấp những dịch vụ dành riêng đến
                        từ các chuyên gia trong lĩnh vực hoạt động của bạn.</p>
                    <p>
                        Chỉ việc đơn giản điền vào mẫu phiếu liên hệ dưới đây và một chuyên viên từ HỒNG ĐỨC EXPRESS
                        sẽ đáp ứng kịp thời.</p>
                    <p style="font-weight: bold;">
                        Hoặc liên hệ chúng tôi theo số điện thoại: 0975 17 17 96</p>
                </div>
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
                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" cols="45" Rows="2"
                            CssClass="form-area"></asp:TextBox>
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
