<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CS3340_Lab7_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 7- Harlan Harris</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Lab 7 - Harlan Harris</h1>
        <p>
            <asp:RadioButtonList ID="rblDataBase" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblDataBase_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem>Access</asp:ListItem>
                <asp:ListItem Selected="True">SQL Server</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            <asp:GridView ID="gvPlayers" runat="server" AutoGenerateColumns="False" DataKeyNames="PlayerID" DataSourceID="dsSqlServerPlayer" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvPlayers_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="PlayerID" HeaderText="PlayerID" SortExpression="PlayerID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                    <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                    <asp:BoundField DataField="PNumber" HeaderText="PNumber" SortExpression="PNumber" />
                    <asp:BoundField DataField="BDate" HeaderText="BDate" SortExpression="BDate" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
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
            <asp:TextBox ID="txtMsg" runat="server" Height="143px" TextMode="MultiLine" Width="277px"></asp:TextBox>
            <asp:SqlDataSource ID="dsSqlServerPlayer" runat="server" ConnectionString="<%$ ConnectionStrings:hgharrisConnectionString2 %>" DeleteCommand="DELETE FROM [Players] WHERE [PlayerID] = @PlayerID" InsertCommand="INSERT INTO [Players] ([LName], [FName], [PNumber], [BDate]) VALUES (@LName, @FName, @PNumber, @BDate)" SelectCommand="SELECT [PlayerID], [LName], [FName], [PNumber], [BDate] FROM [Players]" UpdateCommand="UPDATE [Players] SET [LName] = @LName, [FName] = @FName, [PNumber] = @PNumber, [BDate] = @BDate WHERE [PlayerID] = @PlayerID">
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
        </p>
    </div>
    </form>
</body>
</html>
