<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="P02_DDLofAlbums.aspx.cs" Inherits="WebApp.SamplePages.P02_DDLofAlbums" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Drop-Down-List of Albums</h1>
    <asp:Label ID="Label1" runat="server" Text="Pick an Album"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Album_ODS" DataTextField="AlbumTitle" DataValueField="AlbumId"></asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <asp:ObjectDataSource ID="Album_ODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Albums_List" TypeName="ChinookSystem.BLL.AlbumController"></asp:ObjectDataSource>
</asp:Content>
