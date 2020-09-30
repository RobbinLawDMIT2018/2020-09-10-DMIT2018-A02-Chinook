<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="P03_CGVofAlbums.aspx.cs" Inherits="WebApp.SamplePages.P03_CGVofAlbums" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped" GridLines="Horizontal" BorderStyle="None">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="AlbumId" HeaderText="AlbumId" SortExpression="AlbumId"></asp:BoundField>
            <asp:BoundField DataField="AlbumTitle" HeaderText="AlbumTitle" SortExpression="AlbumTitle"></asp:BoundField>

            <asp:TemplateField HeaderText="Name and Id" SortExpression="ArtistId">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("ArtistId") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>

                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ArtistODS" DataTextField="NameAndId" DataValueField="ArtistId" Enabled="false" Width="250"></asp:DropDownList>
                     
                    
                </ItemTemplate>
            </asp:TemplateField>



            <asp:BoundField DataField="AlbumReleaseYear" HeaderText="AlbumReleaseYear" SortExpression="AlbumReleaseYear"></asp:BoundField>
            <asp:BoundField DataField="AlbumReleaseLabel" HeaderText="AlbumReleaseLabel" SortExpression="AlbumReleaseLabel"></asp:BoundField>
            <asp:BoundField DataField="ReleaseLabelAndYear" HeaderText="Label, Year" ReadOnly="True" SortExpression="ReleaseLabelAndYear"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Albums_List" TypeName="ChinookSystem.BLL.AlbumController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ArtistODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Artist_List" TypeName="ChinookSystem.BLL.ArtistController"></asp:ObjectDataSource>

</asp:Content>
