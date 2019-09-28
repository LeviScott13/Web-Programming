<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HW 4 - Levi Sutton</title>
        <link href="site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h2>HW 4 -<a></a></h2>
    <p><a href="Patients.aspx">Patients</a></p>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lssuttonConnectionString %>" SelectCommand="SELECT [ListPrice], [SqFeet], [Beds], [Baths], [YearBuilt] FROM [Properties] ORDER BY [ListPrice]"></asp:SqlDataSource>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <p>
                    <table>
                        <tr>
                            <td><span>Properties</span>: </td>
                            <td>
                                <asp:Label ID="lblNumProperties" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><span>Average Price</span>:</td>
                            <td>
                                <asp:Label ID="lblAveragePrice" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><span>Number Above Average</span>: </td>
                            <td>
                                <asp:Label ID="lblNumAboveAvgPrice" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </p>
                <p>
                    Sort:<asp:RadioButtonList ID="rblSortType" runat="server" AutoPostBack="True" onSelectedindexchanged="rblSortType_SelectedIndexChanged" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">Price</asp:ListItem>
                        <asp:ListItem>Sq. Feet</asp:ListItem>
                    </asp:RadioButtonList>
                </p>
                <p>
                    <span><em><strong>All Properties</strong></em></span><br /> $<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sq.Ft&nbsp;&nbsp;&nbsp; Beds&nbsp; Baths&nbsp; Year Built&nbsp; $/Sq.Foot</span><br/>
                    <asp:TextBox ID="txtProperties" runat="server" Height="232px" TextMode="MultiLine" Width="473px"></asp:TextBox>
                    <br />
                    <br />
                    Debug Info<br />
                    </p>
            
                <p>
                    <asp:TextBox ID="txtMsg" runat="server" Height="232px" TextMode="MultiLine" Width="503px"></asp:TextBox>
                </p>
            
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
