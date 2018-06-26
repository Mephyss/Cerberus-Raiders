<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Encounter Planner - Cerberus Raiders</title>
    <link rel="stylesheet" href="styles.css" type="text/css" />
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#raid_icons").draggable();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="layout">
            <asp:panel runat="server" ID="main_menu">
                <img src="img/logo-min.png" width="5%" height="5%" />
                <asp:Button runat="server" Text="New" />
                <asp:Button runat="server" Text="Load" />
                <asp:Button runat="server" Text="Save" />
                <asp:Button runat="server" Text="Clear" />
            </asp:panel>
            <asp:panel runat="server" ID="layout_content">
                <asp:panel runat="server" ID="main_tools">
                    TOOLS<br />
                    <asp:label runat="server" ID="raid_icons"></asp:label>
                </asp:panel>
                <asp:panel runat="server" ID="layout_right">
                    <asp:panel runat="server" ID="main_timeline">
                        TIMELINE<br />
                        <asp:Button runat="server" ID="add0" Text="add" CssClass="addkeyframe" OnClientClick="return false;"  />
                        <asp:Image runat="server" ImageUrl="~/img/bar.png" Width="50px" CssClass="bar" />
                        <asp:Button runat="server" ID="keyframe" Text="1" CssClass="keyframe" OnClientClick="return false;"  />
                        <asp:Image runat="server" ImageUrl="~/img/bar.png" Width="50px" CssClass="bar" />
                        <asp:Button runat="server" ID="add2" Text="add" CssClass="addkeyframe" OnClientClick="return false;"  />
                    </asp:panel>
                    <asp:panel runat="server" ID="main_canvas">
                        <asp:label runat="server" ID="map"></asp:label>
                        <canvas></canvas>
                    </asp:panel>
                </asp:panel>
            </asp:panel>
        </asp:Panel>
    </form>
</body>
</html>
