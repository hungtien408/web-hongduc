<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true"
    CodeFile="hau-can.aspx.cs" Inherits="hau_can" %>

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
                                <a href='<%# !string.IsNullOrEmpty(Eval("ArticleCategoryLink").ToString()) ? Eval("ArticleCategoryLink") : (string.IsNullOrEmpty(Eval("ContentEn").ToString()) ? "javascript:void(0);" : progressTitle(Eval("ArticleCategoryNameEn")) + "-hci-" + Eval("ArticleCategoryID") + ".aspx") %>'>
                                    <%# Eval("ArticleCategoryNameEn")%></a>
                            </div>
                            <div class="aside-list">
                                <asp:HiddenField ID="hdnCategoryID" Value='<%# Eval("ArticleCategoryID") %>' runat="server" />
                                <asp:ListView ID="lstHauCanCategorySub" runat="server" DataSourceID="odsHauCanCategorySub"
                                    EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li><a href='<%# !string.IsNullOrEmpty(Eval("ArticleCategoryLink").ToString()) ? Eval("ArticleCategoryLink") : (string.IsNullOrEmpty(Eval("ContentEn").ToString()) ? "javascript:void(0);" : progressTitle(Eval("ArticleCategoryNameEn")) + "-hci-" + Eval("ArticleCategoryID") + ".aspx") %>'><span class="fa fa-circle"></span>
                                            <%# Eval("ArticleCategoryName") %></a>
                                            <asp:HiddenField ID="hdnCategorySubID" Value='<%# Eval("ArticleCategoryID") %>' runat="server" />
                                            <asp:ListView ID="lstHauCan" runat="server" DataSourceID="odsHauCan" EnableModelValidation="True">
                                                <ItemTemplate>
                                                    <li><a href='<%# !string.IsNullOrEmpty(Eval("ArticleLink").ToString()) ? Eval("ArticleLink") : progressTitle(Eval("ArticleTitleEn")) + "-hc-" + Eval("ArticleID") + ".aspx" %>'>
                                                        <span class="fa fa-angle-right"></span>
                                                        <%# Eval("ArticleTitleEn")%></a></li>
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
            <asp:ListView ID="lstHauCanDetails" runat="server" DataSourceID="odsHauCanDetails"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="colContent">
                        <h3>
                            <%# Eval("ArticleTitleEn")%></h3>
                        <div class="content-tb">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsHauCanDetails" runat="server" SelectMethod="ArticleSelectOne"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="hc" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ListView ID="lstHauCanCategoryDetails" runat="server" DataSourceID="odsHauCanCategoryDetails"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="colContent">
                        <h3>
                            <%# Eval("ArticleCategoryNameEn")%></h3>
                        <div class="content-tb">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsHauCanCategoryDetails" runat="server" SelectMethod="ArticleCategorySelectOne"
                TypeName="TLLib.ArticleCategory">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArticleCategoryID" QueryStringField="hci" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="col-md-3 ipadmo-992">
            <div class="asidemobi">
            </div>
        </div>
    </div>
</asp:Content>
