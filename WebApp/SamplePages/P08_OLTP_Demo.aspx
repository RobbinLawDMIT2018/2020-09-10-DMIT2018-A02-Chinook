<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="P08_OLTP_Demo.aspx.cs" Inherits="WebApp.SamplePages.P08_OLTP_Demo" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row offset-1">
        <h5>Manage Playlists (UI/UX TRX Sample)</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <div class="row">
        <div class="col-sm-2">
            <asp:Label ID="Label1" runat="server" Text="Artist" ></asp:Label>&nbsp;&nbsp;
            <asp:TextBox ID="ArtistName" runat="server" placeholder="artist name" Width="100"></asp:TextBox>
            <asp:Button ID="ArtistFetch" runat="server" Text="Fetch" 
                OnCommand="Tracks_Button_Command" CommandName="Artist"/><br /><br />

            <asp:Label ID="Label2" runat="server" Text="Media"></asp:Label>
            <asp:DropDownList ID="MediaTypeDDL" runat="server" Width="100"
                DataSourceID="MediaTypeDDLODS" 
                DataTextField="DisplayText" 
                DataValueField="IDValueField">
            </asp:DropDownList>
            <asp:Button ID="MediaTypeFetch" runat="server" Text="Fetch" 
                 OnCommand="Tracks_Button_Command" CommandName="MediaType" /><br /><br />

            <asp:Label ID="Label3" runat="server" Text="Genre"></asp:Label>
            <asp:DropDownList ID="GenreDDL" runat="server" Width="100"
                DataSourceID="GenreDDLODS" 
                DataTextField="DisplayText" 
                DataValueField="IDValueField">
            </asp:DropDownList>
            <asp:Button ID="GenreFetch" runat="server" Text="Fetch" 
                OnCommand="Tracks_Button_Command" CommandName="Genre" /><br /><br />

            <asp:Label ID="Label4" runat="server" Text="Album"></asp:Label>
            <asp:TextBox ID="AlbumTitle" runat="server" placeholder="album title" Width="100"></asp:TextBox>
            <asp:Button ID="AlbumFetch" runat="server" Text="Fetch" 
                OnCommand="Tracks_Button_Command" CommandName="Album" /><br /><br />

            <%--<asp:Label ID="Label5" runat="server" Text="Existing Playlist"></asp:Label>
            <asp:DropDownList ID="ExistingPlayListDDL" runat="server" Width="100"
                DataSourceID="ExistingPlayListDDLODS" 
                DataTextField="DisplayText" 
                DataValueField="IDValueField">
            </asp:DropDownList>
            <asp:Button ID="ExistingPlayListButton" runat="server" Text="Fetch" 
                OnCommand="PlayList_Button_Command" CommandName="Existing" /><br /><br />

            <asp:Label ID="Label6" runat="server" Text="New Playlist"></asp:Label>
            <asp:TextBox ID="NewPlayListName" runat="server" Width="100"></asp:TextBox>
            <asp:Button ID="NewPlayListButton" runat="server" Text="New" 
                OnCommand="PlayList_Button_Command" CommandName="New" /><br /><br />--%>
        </div>
        <div class="col-sm-10">
            <asp:Panel ID="QueryPanel" runat="server" Visible="true">
                <asp:Label ID="TracksBy" runat="server" ></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="SearchArg" runat="server" ></asp:Label>
            </asp:Panel>
        
                <asp:ListView ID="TracksSelectionList" runat="server"
                ItemType="ChinookSystem.VIEWMODELS.TrackList"
                OnItemCommand="TracksSelectionList_ItemCommand"
                DataSourceID="TracksSelectionListODS">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF; color: #284775;">
                        <td>
                            <asp:LinkButton ID="AddtoPlaylist" runat="server"
                                CommandName="AddToMyPlayList" 
                                CommandArgument='<%# Item.TrackID %>'
                                CssClass="btn">
                                <i class="fa fa-plus" style="color:red;"></i>
                            </asp:LinkButton>
                        </td>
                        <td><asp:Label Text="<%# Item.TrackID %>"  runat="server"  ID="TrackIDLabel" /></td>
                        <td><asp:Label Text='<%# Item.Name %>' runat="server" ID="NameLabel" /></td>
                        <td><asp:Label Text='<%# Item.Title %>' runat="server" ID="TitleLabel" /></td>
                        <td><asp:Label Text='<%# Item.ArtistName %>' runat="server" ID="ArtistNameLabel" /></td>
                        <td><asp:Label Text='<%# Item.MediaName %>' runat="server" ID="MediaNameLabel" /></td>
                        <td><asp:Label Text='<%# Item.GenreName %>' runat="server" ID="GenreNameLabel" /></td>
                        <td><asp:Label Text='<%# Item.Composer %>' runat="server" ID="ComposerLabel" /></td>
                        <td><asp:Label Text='<%# Item.Milliseconds %>' 
                            runat="server" ID="MillisecondsLabel" /></td>
                        <td><asp:Label Text='<%# string.Format("{0:0}",(int)Item.Bytes / 1000000m) %>' 
                            runat="server" ID="BytesLabel" /></td>
                        <td><asp:Label Text='<%# Item.UnitPrice %>' runat="server" ID="UnitPriceLabel" /></td>
                    </tr>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                 <ItemTemplate>
                    <tr style="background-color: #E0FFFF; color: #333333;">
                        <td>
                           <asp:LinkButton ID="AddtoPlaylist" runat="server"
                               CommandName="AddToMyPlayList"
                               CommandArgument='<%# Item.TrackID %>'
                               CssClass="btn">
                               <i class="fa fa-plus" style="color:red;"></i>
                            </asp:LinkButton>
                        </td>
                        <td><asp:Label Text="<%# Item.TrackID %>"  runat="server"  ID="TrackIDLabel"/></td>
                        <td><asp:Label Text='<%# Item.Name %>' runat="server" ID="NameLabel" /></td>
                        <td><asp:Label Text='<%# Item.Title %>' runat="server" ID="TitleLabel" /></td>
                        <td><asp:Label Text='<%# Item.ArtistName %>' runat="server" ID="ArtistNameLabel" /></td>
                        <td><asp:Label Text='<%# Item.MediaName %>' runat="server" ID="MediaNameLabel" /></td>
                        <td><asp:Label Text='<%# Item.GenreName %>' runat="server" ID="GenreNameLabel" /></td>
                        <td><asp:Label Text='<%# Item.Composer %>' runat="server" ID="ComposerLabel" /></td>
                        <td><asp:Label Text='<%# Item.Milliseconds %>' 
                            runat="server" ID="MillisecondsLabel" /></td>
                        <td><asp:Label Text='<%# string.Format("{0:0}",(int)Item.Bytes / 1000000m) %>' 
                            runat="server" ID="BytesLabel" /></td>
                        <td><asp:Label Text='<%# Item.UnitPrice %>' runat="server" ID="UnitPriceLabel" /></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                        <th runat="server"></th>
                                        <th runat="server">ID</th>
                                        <th runat="server">Track Name</th>
                                        <th runat="server">Album</th>
                                        <th runat="server">Artist</th>
                                        <th runat="server">Media</th>
                                        <th runat="server">Genre</th>
                                        <th runat="server">Composer</th>
                                        <th runat="server">Msec</th>
                                        <th runat="server">(MB)</th>
                                        <th runat="server">Price</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #C0C0C0; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                                <asp:DataPager runat="server" ID="DataPager1" PageSize="5" PagedControlID="TracksSelectionList">
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
            </asp:ListView>
            <br /><br />
            <asp:GridView ID="MyPlayList" runat="server" AutoGenerateColumns="False"
                GridLines="Horizontal" BorderStyle="None" 
                ItemType="ChinookSystem.VIEWMODELS.UserPlayListTrack" 
                DataKeyNames="TrackID"
                OnRowCommand="MyPlayList_RowCommand" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate >
                            <asp:LinkButton ID="DeleteFromPlaylist" runat="server"
                                CommandName="DeleteFromMyPlayList"
                                CommandArgument="<%# Container.DataItemIndex %>"
                                CssClass="btn" >
                                <i class="fa fa-times" style="color:red;"></i>&nbsp;
                            </asp:LinkButton>
                            <%--OnClientClick="return confirm('Are you sure you wish to remove the selected song(s)?')"--%>
                            <asp:LinkButton ID="MoveUp" runat="server"
                                CommandName="MoveUpOnMyPlayList"
                                CommandArgument="<%# Container.DataItemIndex %>"
                                CssClass="btn">
                                <i class="fa fa-chevron-up" style="color:blue;"></i>&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="MoveDown" runat="server"
                                CommandName="MoveDownOnMyPlayList"
                                CommandArgument="<%# Container.DataItemIndex %>"
                                CssClass="btn"  >
                                <i class="fa fa-chevron-down" style="color:blue;"></i>&nbsp;
                            </asp:LinkButton>
                        </ItemTemplate>    
                    </asp:TemplateField>
                    <asp:TemplateField >
                        <ItemTemplate >
                            <asp:Label runat="server" ID="TrackId"
                                Text='<%# Item.TrackID %>' Visible="false"></asp:Label>
                            &nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TNum">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="TrackNumber" Width="40px"
                                Text='<%# Item.TrackNumber %>'></asp:Label>
                              &nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="TrackName"
                                Text='<%# Item.TrackName %>'></asp:Label>
                              &nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time (m:s)">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Milliseconds" Width="80px"
                                Text='<%# string.Format("{0:0}", (int)Item.Milliseconds/60000m)  %>'>
                            </asp:Label>
                              &nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="($)">
                        <ItemTemplate> 
                            <asp:Label runat="server" ID="UnitPrice"
                                Text='<%# Item.UnitPrice %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                No data to view for the playlist.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>


        <asp:ObjectDataSource ID="MediaTypeDDLODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="List_MediaTypeNames" 
        TypeName="ChinookSystem.BLL.MediaTypeController"
         OnSelected="CheckForException">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="GenreDDLODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="List_GenreNames" 
        TypeName="ChinookSystem.BLL.GenreController"
         OnSelected="CheckForException">
    </asp:ObjectDataSource>


    <asp:ObjectDataSource ID="TracksSelectionListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="List_TracksForPlaylistSelection" 
        TypeName="ChinookSystem.BLL.TrackController"
         OnSelected="CheckForException">
        <SelectParameters>
            <asp:ControlParameter ControlID="TracksBy"
                PropertyName="Text" DefaultValue="none"
                Name="tracksby" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="SearchArg" 
                PropertyName="Text" DefaultValue="none" 
                Name="arg" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
