<%@ Page Language="C#" AutoEventWireup="true" 
    CodeFile="default.aspx.cs" 
    Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="width: 326px">
    <form id="form1" runat="server">
        <div>
            <h2>Lab 3 - Levi Sutton </h2>
        </div>
    <p>

        <asp:button ID="btnCompute" runat="server" Text="Square Root" OnClick="btnCompute_Click" />
&nbsp;
        <asp:TextBox ID="txtInput" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="lblAnswer" runat="server"></asp:Label>

        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtInput" ErrorMessage="Input must be positive" ForeColor="Red" MaximumValue="Double.MaxValue" MinimumValue="0"></asp:RangeValidator>

    </p>
    </form>
    </body>
</html>
