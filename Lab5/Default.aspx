<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Lab5_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div><h2>Lab 5 - Levi Sutton</h2>
            <p>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </p>
            <p>Ajax: Click a name in either list and it moves to other list</p>
            <asp:UpdatePanel ID="UP1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblTime" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">
                    </asp:Timer>
                    <asp:ListBox ID="lbxNames1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lbxNames1_SelectedIndexChanged" Width="100px">
                        <asp:ListItem>Dontavious</asp:ListItem>
                        <asp:ListItem>Linda</asp:ListItem>
                        <asp:ListItem>Xavier</asp:ListItem>
                    </asp:ListBox>
                    <asp:ListBox ID="lbxNames2" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="lbxNames2_SelectedIndexChanged" Width="100px">
                        <asp:ListItem>Wally</asp:ListItem>
                        <asp:ListItem>Suzy</asp:ListItem>
                        <asp:ListItem>Remmy</asp:ListItem>
                    </asp:ListBox>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnMoveFirst" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <asp:UpdateProgress ID="progress1" runat="server">
            <ProgressTemplate>
                <span class="auto-style1">...moving name</span>
            </ProgressTemplate>
        </asp:UpdateProgress>
            <p>
                <asp:Button ID="btnMoveFirst" runat="server" OnClick="btnMoveFirst_Click" Text="MoveFirst" />
        </p>
    </form>
</body>
</html>
