<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HW 2 - Levi Sutton</title>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            width: 118px;
            height: 10px;
        }
        
        .auto-style3 {
            text-align: center;
            width: 140px;
            height: 10px;
        }
        .auto-style4 {
            width: 140px;
        }
        
        .auto-style5 {
            text-align: left;
            height: 10px;
        }
        
        .auto-style6 {
            text-align: center;
            width: 130px;
            height: 10px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div><p><a href="../../../default.html">Home</a></p></div>
        <h2>Course Registration System</h2>
    <table class="auto-style">
        <tr>
            <td class="auto-style5" colspan="3">
                
                <asp:CheckBoxList ID="lbxCheckBox" runat="server" RepeatDirection ="Horizontal">
                    <asp:ListItem Value="1000">Dorm</asp:ListItem>
                    <asp:ListItem Value="500">Meal Plan</asp:ListItem>
                    <asp:ListItem Value="50">Football Tixs</asp:ListItem>
                </asp:CheckBoxList>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                
                Available Classes
                
            </td>
            <td class="auto-style3">
                
            </td>
            <td class="auto-style2">
                
                Registered Classes</td>
        </tr>
        <tr>
            <td class="auto-style6">
                
                <asp:ListBox ID="lbxAvailableClasses" runat="server" Height="163px" Width="129px" SelectionMode="Multiple"></asp:ListBox>
                
            </td>
            <td class="auto-style4">
                
  
                <asp:Button ID="AddButton" runat="server" Text="Add" OnClick="AddButton_Click" style="height: 26px" CausesValidation="False" />
                <br />
                <asp:Button ID="RemoveButton" runat="server" Text="Remove" OnClick="RemoveButton_Click" CausesValidation="False" />
                <br />
                <asp:Button ID="ResetButton" runat="server" Text="Reset" OnClick="ResetButton_Click" CausesValidation="False" />
                <br />
                Total Hours:
                <asp:Label ID="lblHours" runat="server" ForeColor="Red"></asp:Label>
                <br />
                Total Cost:
                <asp:Label ID="lblCost" runat="server" ForeColor="Red"></asp:Label>
                
  
            </td>
            <td>
                
                <asp:ListBox ID="lbxRegisteredClasses" runat="server" Height="161px" Width="122px" SelectionMode="Multiple"></asp:ListBox>
                
            </td>
        </tr>

    </table>
        <asp:Label ID="Label1" runat="server" Text="You cannot register for more than 19 hours" Visible="False" ForeColor="Red"></asp:Label>
        <br />
        <br />
        Class Number:
        <asp:TextBox ID="lbxClass" runat="server" ></asp:TextBox>
&nbsp;Credits:
        <asp:TextBox ID="lbxCredits" runat="server"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="lbxCredits" ErrorMessage="ERROR: Credits (&lt; 1  /  &gt;10)!" MaximumValue="10" MinimumValue="1" ForeColor="Red" Type="Integer"></asp:RangeValidator>
        <br />
&nbsp;<asp:Button ID="lbxMakeAvailable" runat="server" Text="Make Available" Width="145px" OnClick="MakeAvailable_Click" />
&nbsp;<asp:Button ID="lbxRemoveFromAvailable" runat="server" Text="Remove from Available" Width="180px" OnClick="RemoveFromAvailable_Click" />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Not Added. Course already exists!" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Not Added. Course is registered for!" Visible="False"></asp:Label>
    </form>
    </body>
</html>