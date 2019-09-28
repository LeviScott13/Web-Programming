<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Lab6_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div><h2>Lab 6 - Levi Sutton</h2>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br />
        <br />
        <asp:TextBox ID="txtMsg" runat="server" Height="226px" Width="236px" TextMode ="MultiLine"></asp:TextBox>
    </form>
</body>
</html>
