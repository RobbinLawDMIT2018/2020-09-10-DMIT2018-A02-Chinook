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
        </div>
    </div>

</asp:Content>
