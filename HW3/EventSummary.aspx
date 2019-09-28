<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EventSummary.aspx.cs" Inherits="EventSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Ticket Holders for <em>
            <asp:Label ID="lblEventName" runat="server" ForeColor="Red"></asp:Label>
            </em></h2>
        <div>
            <asp:Button ID="btnSellTickets" runat="server" Text="Sell More Tickets" OnClick="btnSellTickets_Click" />
&nbsp; Sort:&nbsp;
            <asp:RadioButton ID="RBpurchased" runat="server" Text="Order Purchased" name="radio" Checked="false" OnCheckedChanged="RBpurchased_CheckedChanged" />
&nbsp;<asp:RadioButton ID="RBname" runat="server" Text="Name" name="radio" Checked ="false" OnCheckedChanged="RBname_CheckedChanged"/>
&nbsp;<asp:RadioButton ID="RBseat" runat="server" Text="Seat" name="radio" Checked ="false" OnCheckedChanged="RBseat_CheckedChanged" />
            &nbsp;
            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" />
            <br />
            <br />
            Remove Ticket Holder
            <asp:DropDownList ID="lbxRemoveCustomer" runat="server">
                <asp:ListItem>Choose Person to Remove</asp:ListItem>
            </asp:DropDownList>
        &nbsp;
            <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click" />
            <br />
            <asp:TextBox ID="txtSummary" runat="server" Height="200px" Width="400px" TextMode="MultiLine" ></asp:TextBox>
            <br />
        </div>
    </form>
</body>
</html>

