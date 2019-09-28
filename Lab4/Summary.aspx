<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Summary.aspx.cs" Inherits="Summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>Account Summary</h2>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="btnAddAccount" runat="server" Text="Add Account" OnClick="btnAddAccount_Click"/>
&nbsp;
            <asp:Button ID="btnStartOver" runat="server" Text="Start Over" OnClick="btnStartOver_Click" />
            <br />
            <br />
            <asp:TextBox ID="txtSummary" runat="server" Height="200px" Width="349px" TextMode="MultiLine"></asp:TextBox>

        </div>
    </form>
</body>
</html>
