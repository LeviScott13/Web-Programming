<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>HW 3 - Levi Sutton</h2>
    <div>Event Name:
        <asp:TextBox ID="txtEventName" runat="server"></asp:TextBox>
&nbsp;Available Seat Numbers:&nbsp; First
        <asp:TextBox ID="txtFirstSeat" runat="server" Width="27px"></asp:TextBox>
&nbsp; Last
        <asp:TextBox ID="txtLastSeat" runat="server" Width="27px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnMakeEvent" runat="server" Text="Make Event" OnClick="btnMakeEvent_Click1" />
        <br />
        <br />
        <asp:Label ID="lblTicketsAvailable" runat="server" ForeColor="Red" Text="0"></asp:Label>
&nbsp;tickets available&nbsp;&nbsp;
        <asp:Label ID="lblSoldOut" runat="server" ForeColor="Red" Text="SOLD OUT!" Visible="False"></asp:Label>
        <br />
        <br />
        Name
        <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
&nbsp; Age
        <asp:TextBox ID="txtAge" runat="server" Width="27px"></asp:TextBox>
&nbsp; Seat
        <asp:DropDownList ID="lbxSeats" runat="server" Height="16px"></asp:DropDownList>
&nbsp;
        <asp:Button ID="btnPurchase" runat="server" Text="Purchase" OnClick="btnPurchase_Click" />
&nbsp;
        <asp:Button ID="btnEventSummary" runat="server" Text="Event Summary" OnClick="btnEventSummary_Click" />
        <br />
        <br />
        <asp:Label ID="lblSeatNA" runat="server" ForeColor="Red" Text="Seat not available" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
