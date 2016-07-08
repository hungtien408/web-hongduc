<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true"
    CodeFile="tin-tuc-chi-tiet.aspx.cs" Inherits="tin_tuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row content-bg">
        <asp:ListView ID="lstNewDetails" runat="server" DataSourceID="odsNewDetails" EnableModelValidation="True">
            <ItemTemplate>
                <div class="col-md-9">
                    <div class="colContent">
                        <h3>
                            <%# Eval("ArticleTitleEn")%></h3>
                        <div class="content-tb">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContentEn") %>'></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsNewDetails" runat="server" SelectMethod="ArticleSelectOne"
            TypeName="TLLib.Article">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="tt" Name="ArticleID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="col-md-3">
            <div class="colAside">
                <div class="list-pro">
                    <asp:ListView ID="lstNewSame" runat="server" DataSourceID="odsNewSame" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="col-md-12 col-xs-6 element-item">
                                <div class="product-box news-box">
                                    <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tt-" + Eval("ArticleID") + ".aspx" %>'
                                        class="product-img box-img fullbox-img cover-img">
                                        <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/2.jpg" %>'
                                            runat="server" /></a>
                                    <h4 class="product-name">
                                        <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-tt-" + Eval("ArticleID") + ".aspx" %>'>
                                            <%# Eval("ArticleTitleEn")%></a>
                                    </h4>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsNewSame" runat="server" SelectMethod="ArticleSameSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String" />
                            <asp:QueryStringParameter QueryStringField="tt" Name="ArticleID" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
