<%@ Page Language="C#" AutoEventWireup="true" CodeFile="new_map.aspx.cs" Inherits="new_map" %>

<script>
$(document).ready(function () {
    ResizeWindow(400, 170);
});
</script>

<body>
    <form id="form_map" runat="server">
        <asp:Panel runat="server" CssClass="input-group">
		    <asp:Panel runat="server" CssClass="input-group-label">TITLE</asp:Panel>
            <asp:TextBox runat="server" CssClass="input-group-control" ID="fm_map_title"></asp:TextBox>
        </asp:Panel>
        
        <asp:Panel runat="server" CssClass="input-group">
		    <asp:Panel runat="server" CssClass="input-group-label">ENCOUNTER</asp:Panel>
            <asp:DropDownList runat="server" CssClass="input-group-control" ID="fm_map"></asp:DropDownList>
        </asp:Panel>
        
        <asp:Panel runat="server" CssClass="input-single">
            <asp:Button runat="server" Text="START" CssClass="input-button" OnClientClick="StartNewEncounter(); return false;" />
        </asp:Panel>        
    </form>
</body>
