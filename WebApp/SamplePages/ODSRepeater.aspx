<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODSRepeater.aspx.cs" Inherits="WebApp.SamplePages.ODSRepeater" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Repeater using ODS with nested query</h1>
    <br/>
    <div class="row">
        <div class="offset-1">
            <asp:Label ID="Label1" runat="server" 
                Text="Enter the lowest playlist track size desired"></asp:Label>&nbsp;&nbsp;
           <%-- <asp:TextBox ID="PlayListSizeArg" runat="server"></asp:TextBox>&nbsp;&nbsp;--%>
            <asp:TextBox ID="PlayListSizeArg" runat="server"
                 TextMode="Number" step="1" min="0"></asp:TextBox>&nbsp;&nbsp;
            <asp:Button ID="Fetch" runat="server" Text="Fetch" 
                class="btn btn-primary"/>
        </div>
    </div>
    <%-- Repeater 
        
        Itemtype will allow you to select the definition of the object
        that the data is using
        
        If you use ItemType, you can use Item. in referencing your properties
        as you develop your control
        
        --%>
    <asp:Repeater ID="Repeater1" runat="server" 
        DataSourceID="ClientPlayListODS">
        
    </asp:Repeater>


    <asp:Repeater ID="ClientPlayList" runat="server" 
        DataSourceID="ClientPlayListODS"
         ItemType="ChinookSystem.VIEWMODELS.PlayListItem">
         <HeaderTemplate>
             <h3>Client Playlists</h3>
         </HeaderTemplate>
         <ItemTemplate>
             <h4><%# Item.Name %> (<%#Item.TrackCount %>)</h4>
             <h5><%# Item.UserName  %></h5>

              <%--gridview--%>
             
             <asp:GridView ID="PlayListSongs" runat="server"
                 DataSource="<%# Item.Songs %>" CssClass="table">
             </asp:GridView>

             <%-- ListView --%>

             <%--<asp:ListView ID="PlayListSongs" runat="server"
                 DataSource="<%# Item.Songs %>"
                 ItemType="ChinookSystem.VIEWMODELS.PlayListSong"
                 >
                 <ItemTemplate>
                      <span style="background-color:silver">
                        <%# Item.Song %>&nbsp;&nbsp; (<%# Item.GenreName %>)
                         </span><br />
                 </ItemTemplate>
                 <AlternatingItemTemplate>
                      <span style="background-color:aqua">
                        <%# Item.Song %>&nbsp;&nbsp; (<%# Item.GenreName %>)
                         </span><br />
                 </AlternatingItemTemplate>
                 <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                 </LayoutTemplate>
             </asp:ListView>--%>

             <%--A nested Repeater--%>

             <%--<asp:Repeater ID="Repeater1" runat="server"
                     DataSource="<%# Item.Songs %>"
                      ItemType="ChinookSystem.VIEWMODELS.PlayListSong">
                     <ItemTemplate>
                         <span style="background-color:silver">
                        <%# Item.Song %>&nbsp;&nbsp; (<%# Item.GenreName %>)
                         </span><br />
                     </ItemTemplate>
                     <AlternatingItemTemplate>
                        <span style="background-color:aqua">
                        <%# Item.Song %>&nbsp;&nbsp; (<%# Item.GenreName %>)
                         </span><br />
                     </AlternatingItemTemplate>
                 </asp:Repeater>--%>

             <%--Using an HTML 5 table--%>

             <%--<table>
                 <asp:Repeater ID="PlayListSongs" runat="server"
                     DataSource="<%# Item.Songs %>"
                      ItemType="ChinookSystem.VIEWMODELS.PlayListSong">
                     <ItemTemplate>
                         <tr>
                            <td style="background-color:silver"><%# Item.Song %>&nbsp;&nbsp;</td>  
                             <td style="background-color:silver">(<%# Item.GenreName %>)</td>
                         </tr>
                     </ItemTemplate>
                     <AlternatingItemTemplate>
                        <tr> 
                            <td style="background-color:aqua">
                                <%# Item.Song %>&nbsp;&nbsp;</td>  
                             <td style="background-color:aqua">
                                 (<%# Item.GenreName %>)</td>
                         </tr>
                     </AlternatingItemTemplate>
                 </asp:Repeater>
             </table>--%>

         </ItemTemplate>
        <SeparatorTemplate>
            <hr style="height:3px;" />
        </SeparatorTemplate>
    </asp:Repeater>

    <%-- ODS --%>
    <asp:ObjectDataSource ID="ClientPlayListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="PlayList_GetPlayListOfSize" 
        TypeName="ChinookSystem.BLL.PlayListController">
        <SelectParameters>
            <asp:ControlParameter ControlID="PlayListSizeArg" 
                PropertyName="Text" DefaultValue="1000" 
                Name="lowestplaylistsize" Type="Int32">
            </asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
