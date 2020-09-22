<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="P05_DDLofArtistsToCGVofAlbumsByArtistId.aspx.cs" Inherits="WebApp.SamplePages.P05_DDLofArtistsToCGVofAlbumsByArtistId" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h2>DDLofArtists to CGVofAlbumsByArtistId</h2>
    </div>
    <br />
    <div class="row">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </div>
    <br />
    <div class="row">
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"></asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
    <br />
    <div class="row">
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <br />
</asp:Content>
