<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Encounter Planner - Cerberus Raiders</title>
    <link rel="stylesheet" href="styles.css" type="text/css" />
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="js/cerberus.js"></script>

    <script>
        $(function () {

        });
    </script>
</head>
<body>
    <form id="form_main" runat="server">
        <asp:HiddenField runat="server" ID="new_map_title" />
        <asp:HiddenField runat="server" ID="new_map_map" />
        <asp:HiddenField runat="server" ID="new_map_flag" Value="0" />

        <asp:Panel runat="server" ID="layout">
            <asp:panel runat="server" ID="main_menu">
                <img src="img/logo-min.png" width="5%" height="5%" />
                <asp:Button runat="server" Text="New" CssClass="menu_button" OnClientClick="OpenNewEncounter(); return false;" />
                <asp:Button runat="server" Text="Load" CssClass="menu_button unavailable" />
                <asp:Button runat="server" Text="Save" CssClass="menu_button unavailable" />
                <asp:Button runat="server" Text="Clear" CssClass="menu_button unavailable" />
                <asp:Button runat="server" ID="btn_run" Text="Run" CssClass="menu_button" OnClientClick="Run(); return false;"  />
                <span id="alert"></span>
            </asp:panel>
            <asp:panel runat="server" ID="layout_content">
                <asp:panel runat="server" ID="main_tools">
                    TOOLS<br />
                    <asp:label runat="server" ID="raid_icons"></asp:label>
                </asp:panel>
                <asp:panel runat="server" ID="layout_right">
                    <asp:panel runat="server" ID="main_timeline">
                        TIMELINE<br />
                        <asp:Button runat="server" keyframe="1" Text="1" CssClass="keyframe" OnClientClick="SetKeyframe(1); return false;"  />
                        <asp:Image runat="server" ImageUrl="~/img/bar.png" Width="50px" CssClass="bar" />
                        <asp:Button runat="server" keyframe="2" Text="2" CssClass="keyframe" OnClientClick="SetKeyframe(2); return false;"  />
                    </asp:panel>
                    <asp:panel runat="server" ID="main_canvas">
                        <asp:panel runat="server" id="canvas" style="position: absolute" width="800px" height="800px"></asp:panel>
                    </asp:panel>
                </asp:panel>
            </asp:panel>
        </asp:Panel>

        <asp:Panel runat="server" id="pp_window">
	        <asp:Panel runat="server" id="pp_frame">
	            <asp:Panel runat="server" id="pp_module">
		            <asp:Panel runat="server" id="pp_top">
		                <asp:Panel runat="server" id="pp_buttons">
		    	            <a href="JavaScript:CloseWindow()" class="link_image">
		        	            <asp:Image runat="server" src="img/24_close.png"></asp:Image>
		                    </a>
		                </asp:Panel>

		                <asp:Panel runat="server" id="pp_title">
				            Title
			            </asp:Panel>
		            </asp:Panel>
		
		            <div id="pp_content">
			            Content
		            </div>
	            </asp:Panel>
	        </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
