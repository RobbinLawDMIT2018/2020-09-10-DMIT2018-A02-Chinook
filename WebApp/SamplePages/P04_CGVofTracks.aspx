<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="P04_CGVofTracks.aspx.cs" Inherits="WebApp.SamplePages.P04_CGVofTracks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>P04 Custom GridView of All the Tracks</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" PagerSettings-Position="Bottom" PagerStyle-BorderStyle="Inset" AllowPaging="True" PagerSettings-Mode="NumericFirstLast" CssClass="table table-striped" BorderStyle="None" GridLines="Horizontal" PageSize="5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="TrackName" HeaderText="TrackName" SortExpression="TrackName"></asp:BoundField>
            <asp:BoundField DataField="TrackComposer" HeaderText="TrackComposer" SortExpression="TrackComposer"></asp:BoundField>
            <asp:BoundField DataField="TrackMilliseconds" HeaderText="TrackMilliseconds" SortExpression="TrackMilliseconds"></asp:BoundField>
            <asp:BoundField DataField="TrackBytes" HeaderText="TrackBytes" SortExpression="TrackBytes"></asp:BoundField>
            <asp:BoundField DataField="TrackUnitPrice" HeaderText="TrackUnitPrice" SortExpression="TrackUnitPrice"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <br /><br />
    <div class="row">
        <asp:Label ID="MessageLabel" runat="server" ></asp:Label>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Track_List" TypeName="ChinookSystem.BLL.TrackController"></asp:ObjectDataSource>
</asp:Content>
