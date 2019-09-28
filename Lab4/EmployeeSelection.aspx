<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeSelection.aspx.cs" Inherits="EmployeeSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab4 - Employee Selection</title>
</head>
<body>
    <h2>Employee Selection</h2>
    <p>Return to <a href="Default.aspx">Lab 4</a></p>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlEmployees" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddEmployees_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            <asp:TextBox ID="txtMsg" runat="server" Height="200px" Width="300px" TextMode="MultiLine"></asp:TextBox>
        </div>
    </form>
</body>
</html>
