<%@ Page Title="" Language="C#" MasterPageFile="~/en/site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Hồng Đức</title>
    <meta name="description" content="Hồng Đức" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="banner">
        <div id="sliderBanner">
            <asp:ListView ID="lstBanner" runat="server" DataSourceID="odsBanner" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="slide">
                        <img alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/slider1.jpg" %>'
                            runat="server" />
                        <%--<div class="slide-text">
                            <p>
                                DỊCH VỤ VẬN CHUYỂN</p>
                        </div>--%>
                        <div class="slide-text1">
                            <p>
                                <strong>
                                    <%# Eval("CompanyNameEn")%></strong></p>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsBanner" runat="server" SelectMethod="AdsBannerSelectAll"
                TypeName="TLLib.AdsBanner">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div class="container-bg">
        <div class="container">
            <div class="wapper-content">
                <div class="row rownone">
                    <asp:ListView ID="lstLogisticsCategory" runat="server" DataSourceID="odsLogisticsCategory"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="col-sm-3 col-xs-6 element-item">
                                <div class="product-box product-pos scale-animate">
                                    <a href='<%# string.IsNullOrEmpty(Eval("ContentEn").ToString()) ? "javascript:void(0);" : progressTitle(Eval("ArticleCategoryNameEn")) + "-hci-" + Eval("ArticleCategoryID") + ".aspx" %>' class="product-img"><span class="box-img fullbox-img cover-img">
                                        <img class="hideo"  alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/articlecategory/" + Eval("ImageName") : "~/assets/images/img1.jpg" %>' runat="server" /></span></a>
                                    <div class="pro-name">
                                        <div class="product-name">
                                            <%# Eval("ArticleCategoryNameEn").ToString().Substring(0, 1).Equals("-") ? Eval("ArticleCategoryNameEn").ToString().Substring(1) : Eval("ArticleCategoryNameEn")%></div>
                                        <div class="product-view">
                                            <a href='<%# string.IsNullOrEmpty(Eval("ContentEn").ToString()) ? "javascript:void(0);" : progressTitle(Eval("ArticleCategoryNameEn")) + "-hci-" + Eval("ArticleCategoryID") + ".aspx" %>'>VIEW DETAILS</a></div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsLogisticsCategory" runat="server" SelectMethod="ArticleCategorySelectAll"
                        TypeName="TLLib.ArticleCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="6" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="2" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <div class="wapper-gt">
            <div class="container">
                <div class="row">
                    <asp:ListView ID="lstAboutUs" runat="server" DataSourceID="odsAboutUs" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="col-sm-7">
                                <div class="introduce">
                                    <h3>
                                        About Us</h3>
                                    <p>
                                        <%# Eval("DescriptionEn")%></p>
                                    <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-gt-" + Eval("ArticleID") + ".aspx" %>'>
                                        View details</a>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="introduce-img">
                                    <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/bg-gt.png" %>'
                                        runat="server" />
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsAboutUs" runat="server" SelectMethod="ArticleSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ArticleTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ArticleCategoryID" Type="String" />
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
            </div>
        </div>
        <div class="container">
            <div class="pro-row">
                <div id="silderProduct" class="slider">
                    <asp:ListView ID="lstParner" runat="server" DataSourceID="odsParner" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="slide">
                                <div class="product-box">
                                    <a href='<%# progressTitle(Eval("ArticleTitleEn")) + "-kh-" + Eval("ArticleID") + ".aspx" %>'
                                        class="product-img box-img fullbox-img cover-img">
                                        <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/hinh1.jpg" %>'
                                            runat="server" /></a>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsParner" runat="server" SelectMethod="ArticleSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ArticleTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="3" Name="ArticleCategoryID" Type="String" />
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
            </div>
        </div>
    </div>
</asp:Content>
