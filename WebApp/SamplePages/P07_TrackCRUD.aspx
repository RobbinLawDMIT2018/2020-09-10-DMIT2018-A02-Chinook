<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="P07_TrackCRUD.aspx.cs" Inherits="WebApp.SamplePages.P07_TrackCRUD" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h2>Track CRUD</h2>
    </div>
    <br />
    <div class="row">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ChinookSystem.VIEWMODELS.TrackViewModel" DeleteMethod="Tracks_Delete" InsertMethod="Tracks_Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Track_List" TypeName="ChinookSystem.BLL.TrackController" UpdateMethod="Tracks_Update"></asp:ObjectDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" InsertItemPosition="LastItem" DataKeyNames="TrackId">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackId") %>' runat="server" ID="TrackIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackMediaTypeId") %>' runat="server" ID="TrackMediaTypeIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackName") %>' runat="server" ID="TrackNameLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackComposer") %>' runat="server" ID="TrackComposerLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackMilliseconds") %>' runat="server" ID="TrackMillisecondsLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackBytes") %>' runat="server" ID="TrackBytesLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackUnitPrice") %>' runat="server" ID="TrackUnitPriceLabel" /></td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackId") %>' runat="server" ID="TrackIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackMediaTypeId") %>' runat="server" ID="TrackMediaTypeIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackName") %>' runat="server" ID="TrackNameTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackComposer") %>' runat="server" ID="TrackComposerTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackMilliseconds") %>' runat="server" ID="TrackMillisecondsTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackBytes") %>' runat="server" ID="TrackBytesTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackUnitPrice") %>' runat="server" ID="TrackUnitPriceTextBox" /></td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackId") %>' runat="server" ID="TrackIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackMediaTypeId") %>' runat="server" ID="TrackMediaTypeIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackName") %>' runat="server" ID="TrackNameTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackComposer") %>' runat="server" ID="TrackComposerTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackMilliseconds") %>' runat="server" ID="TrackMillisecondsTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackBytes") %>' runat="server" ID="TrackBytesTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("TrackUnitPrice") %>' runat="server" ID="TrackUnitPriceTextBox" /></td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackId") %>' runat="server" ID="TrackIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackMediaTypeId") %>' runat="server" ID="TrackMediaTypeIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackName") %>' runat="server" ID="TrackNameLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackComposer") %>' runat="server" ID="TrackComposerLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackMilliseconds") %>' runat="server" ID="TrackMillisecondsLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackBytes") %>' runat="server" ID="TrackBytesLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackUnitPrice") %>' runat="server" ID="TrackUnitPriceLabel" /></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">TrackId</th>
                                    <th runat="server">MediaType</th>
                                    <th runat="server">TrackName</th>
                                    <th runat="server">TrackComposer</th>
                                    <th runat="server">TrackMilliseconds</th>
                                    <th runat="server">TrackBytes</th>
                                    <th runat="server">TrackUnitPrice</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                            <asp:DataPager runat="server" ID="DataPager1" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                    <asp:NumericPagerField></asp:NumericPagerField>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackId") %>' runat="server" ID="TrackIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackMediaTypeId") %>' runat="server" ID="TrackMediaTypeIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackName") %>' runat="server" ID="TrackNameLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackComposer") %>' runat="server" ID="TrackComposerLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackMilliseconds") %>' runat="server" ID="TrackMillisecondsLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackBytes") %>' runat="server" ID="TrackBytesLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TrackUnitPrice") %>' runat="server" ID="TrackUnitPriceLabel" /></td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    <br />
    <div class="row">
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <br />
</asp:Content>
