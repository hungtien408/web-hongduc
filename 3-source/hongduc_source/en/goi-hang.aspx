<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true"
    CodeFile="goi-hang.aspx.cs" Inherits="goi_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row content-bg">
        <div class="col-md-3 desktop-992">
            <div class="colAside aside-desktop">
                <div class="aside-main">
                    <asp:ListView ID="lstExpressCategory3" runat="server" DataSourceID="odsExpressCategory3"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="aside-title">
                                <a href="javascript:void(0);">
                                    <%# Eval("ArticleCategoryNameEn")%></a>
                            </div>
                            <div class="aside-list">
                                <%--<asp:HiddenField ID="hdnCategoryID3" Value='<%# Eval("ArticleCategoryID") %>' runat="server" />--%>
                                <asp:Label ID="lblCategoryID3" runat="server" Text='<%# Eval("ArticleCategoryID") %>'
                                    Visible="False"></asp:Label>
                                <asp:ListView ID="lstExpress3" runat="server" DataSourceID="odsExpress3" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li><a href='<%# !string.IsNullOrEmpty(Eval("ArticleLink").ToString()) ? Eval("ArticleLink") : progressTitle(Eval("ArticleTitleEn")) + "-cp-" + Eval("ArticleID") + ".aspx" %>'>
                                            <span class="fa fa-circle"></span>
                                            <%# Eval("ArticleTitleEn")%></a> </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul>
                                            <li runat="server" id="itemPlaceholder"></li>
                                        </ul>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <%--<asp:ObjectDataSource ID="odsExpress3" runat="server" SelectMethod="ArticleSelectAll"
                                    TypeName="TLLib.Article">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ArticleTitle" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:ControlParameter ControlID="hdnCategoryID3" Name="ArticleCategoryID" PropertyName="Value"
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
                                </asp:ObjectDataSource>--%>
                                <asp:ObjectDataSource ID="odsExpress3" runat="server" SelectMethod="ArticleSelectAll"
                                    TypeName="TLLib.Article">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ArticleTitle" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:ControlParameter ControlID="lblCategoryID3" Name="ArticleCategoryID" PropertyName="Text"
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
                    <asp:ObjectDataSource ID="odsExpressCategory3" runat="server" SelectMethod="ArticleCategorySelectAll"
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
                <h3>Shipping</h3>
                <div class="dropdown section">
                    <label for="Title">
                        Title</label>
                    <%--<select name="Title" id="Title"><option value=""></option>
                            <option value="Ông">Ông</option>
                            <option value="Cô">Cô</option>
                            <option value="Bà">Bà</option>
                            <option value="Tiến sĩ">Tiến sĩ</option>
                        </select>--%>
                    <asp:DropDownList ID="dropChucDanh" runat="server">
                        <asp:ListItem Value="Mr">Mr</asp:ListItem>
                        <asp:ListItem Value="Ms">Ms</asp:ListItem>
                        <asp:ListItem Value="Mrs">Mrs</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="text section">
                    <label for="First_Name">
                        First Name *</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtFirstName"
                        ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="Last_Name">
                        Last Name *</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtLastName"
                        ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="Job_Title">
                        Job Title *</label>
                    <asp:TextBox ID="txtJobs" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtJobs" ErrorMessage="Information required!"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="Company_Name">
                        Company Name *</label>
                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtCompanyName"
                        ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="city">
                        City *</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtCity" ErrorMessage="Information required!"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="zip_code">
                        Zip Code *</label>
                    <asp:TextBox ID="txtZipCode" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator6" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtZipCode"
                        ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="Email_Address">
                        Email *</label>
                    <asp:TextBox ID="txtEmail" CssClass="maxfield" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                        runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email is error!"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator7" runat="server"
                        ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Information required!"
                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="Telephone_Number">
                        Phone *</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="maxfield"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator8" runat="server"
                        Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtPhone" ErrorMessage="Information required!"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="text section">
                    <label for="Your_Enquiry">
                        Your Enquiry *</label>
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" cols="45" Rows="2"
                        CssClass="form-area"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator9" runat="server"
                        ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtContent"
                        ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="section upload">
                    <label for="Relevant_Documents">
                        Please attach any relevant documents for your enquiry:</label>
                    <asp:FileUpload ID="FileUpload1" CssClass="fileupload" runat="server" />
                    <%--<asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator10" runat="server"
                        Display="None" ValidationGroup="SendEmail" ControlToValidate="FileUpload1" ErrorMessage="File upload: Information required!"
                        ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="section end">
                    <asp:Button ID="btnClear" CssClass="formbutton" runat="server" Text="Clear form" ValidationGroup="SendEmail"
                        OnClick="btClear_Click" />
                    <asp:Button ID="btnSend" CssClass="submitbutton" runat="server" Text="Submit" ValidationGroup="SendEmail"
                        OnClick="btSend_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-3 ipadmo-992">
            <div class="asidemobi">
            </div>
        </div>
    </div>
</asp:Content>
