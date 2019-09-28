<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 4 - Levi Sutton</title>
</head>
<body>
    <h2>Lab4 - Levi Sutton</h2>
    <form id="form1" runat="server">
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="EmployeeSelection.aspx">Employee Selection</asp:LinkButton>
        </p>
        <div>
            Balance:
            <asp:TextBox ID="txtBalance" runat="server"></asp:TextBox>
            <asp:Button ID="btnAddAccount" runat="server" Text="Add Acount" OnClick="btnAddAccount_Click" />
            &nbsp;
            <asp:Button ID="btnClearAccounts" runat="server" Text="Clear Accounts from Memory" OnClick="btnClearAccounts_Click" />
            &nbsp;
            <asp:Button ID="btnSummary" runat="server" OnClick="btnSummary_Click" Text="Summary" />
            <br />
            <br />
            Num Accounts: 
            <asp:Label ID="lblNumAccounts" runat="server" Text="0"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtMsg" runat="server" Height="200px" TextMode="MultiLine" Width="350px"></asp:TextBox>
        </div>
    </form>
</body>
</html>
