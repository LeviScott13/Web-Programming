<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CS3340_Lab7_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Lab 7 - Levi Sutton</h2>
        <p>
            <asp:RadioButtonList ID="rblDataBase" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblDataBase_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem>Access</asp:ListItem>
                <asp:ListItem Selected="True">SQL Server</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            <asp:GridView ID="gvPlayers" runat="server" AutoGenerateColumns="False" DataKeyNames="PlayerID" DataSourceID="dsSqlServerPlayer" AllowPaging="True" AllowSorting="True" CellPadding="4" OnSelectedIndexChanged="gvPlayers_SelectedIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="PlayerID" HeaderText="PlayerID" SortExpression="PlayerID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                    <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                    <asp:BoundField DataField="PNumber" HeaderText="PNumber" SortExpression="PNumber" />
                    <asp:BoundField DataField="BDate" HeaderText="BDate" SortExpression="BDate" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsAccessPlayers" runat="server" ConnectionString="<%$ ConnectionStrings:accessConnectionString %>" DeleteCommand="DELETE FROM [Players] WHERE [PlayerID] = ?" InsertCommand="INSERT INTO [Players] ([PlayerID], [LName], [FName], [PNumber], [BDate]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:accessConnectionString.ProviderName %>" SelectCommand="SELECT [PlayerID], [LName], [FName], [PNumber], [BDate] FROM [Players]" UpdateCommand="UPDATE [Players] SET [LName] = ?, [FName] = ?, [PNumber] = ?, [BDate] = ? WHERE [PlayerID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="PlayerID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PlayerID" Type="Int32" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="PNumber" Type="Int32" />
                    <asp:Parameter Name="BDate" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="PNumber" Type="Int32" />
                    <asp:Parameter Name="BDate" Type="DateTime" />
                    <asp:Parameter Name="PlayerID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
            <asp:SqlDataSource ID="dsSqlServerPlayer" runat="server" ConnectionString="<%$ ConnectionStrings:lssuttonConnectionString2 %>" DeleteCommand="DELETE FROM [Players] WHERE [PlayerID] = @PlayerID" InsertCommand="INSERT INTO [Players] ([LName], [FName], [PNumber], [BDate]) VALUES (@LName, @FName, @PNumber, @BDate)" SelectCommand="SELECT [PlayerID], [LName], [FName], [PNumber], [BDate] FROM [Players]" UpdateCommand="UPDATE [Players] SET [LName] = @LName, [FName] = @FName, [PNumber] = @PNumber, [BDate] = @BDate WHERE [PlayerID] = @PlayerID">
                <DeleteParameters>
                    <asp:Parameter Name="PlayerID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="PNumber" Type="Int32" />
                    <asp:Parameter Name="BDate" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="PNumber" Type="Int32" />
                    <asp:Parameter Name="BDate" Type="DateTime" />
                    <asp:Parameter Name="PlayerID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:AccessDataSource ID="dsSqlServerPlayers" runat="server"></asp:AccessDataSource>
        <p>
            <asp:TextBox ID="txtMsg" runat="server" Height="143px" TextMode="MultiLine" Width="277px"></asp:TextBox>
        </p>
    </div>
    </form>
</body>
</html>
