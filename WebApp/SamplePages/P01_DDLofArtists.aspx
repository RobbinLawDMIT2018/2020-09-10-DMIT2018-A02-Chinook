<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="P01_DDLofArtists.aspx.cs" Inherits="WebApp.SamplePages.P01_DDLofArtists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <%--TODO: 02 Add a DDL--%>
    </div>
    <br /><br />

    <div class="row">
        <asp:Label ID="Label1" runat="server" Text="Select Artist"></asp:Label>&nbsp;&nbsp;
        <asp:DropDownList ID="DDLofArtists1" runat="server"
            DataSourceID="ODS_DDLofArtists"
            DataTextField="ArtistName"
            DataValueField="ArtistId"
            Width="350px">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:LinkButton
            ID="DisplaySelectedInfo1"
            runat="server" OnClick="DisplaySelectedInfo1_Click">
            Display Selected Info 1
        </asp:LinkButton>
    </div>
    <br /><br />
    <div class="row">
        <asp:Label ID="Label2" runat="server" Text="Select Artist"></asp:Label>&nbsp;&nbsp;
        <asp:DropDownList ID="DDLofArtists2" runat="server"
            DataSourceID="ODS_DDLofArtists"
            DataTextField="ArtistName"
            DataValueField="ArtistId"
            Width="350px"
            AppendDataBoundItems="true">
            <asp:ListItem Text="Select..." Value="0"></asp:ListItem>
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:LinkButton
            ID="DisplaySelectedInfo2"
            runat="server" OnClick="DisplaySelectedInfo2_Click">
            Display Selected Info 2
        </asp:LinkButton>
    </div>
    <br /><br />
    <div class="row">
        <asp:Label ID="MessageLabel" runat="server" ></asp:Label>
    </div>
    <asp:ObjectDataSource ID="ODS_DDLofArtists" runat="server"
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Artist_List"
        TypeName="ChinookSystem.BLL.ArtistController">
    </asp:ObjectDataSource>
    <%--TODO: 01 Add a ODS--%>
</asp:Content>
