<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HW-4 Harlan Harris</title>
    <link href="site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            border-style: solid;
            border-width: 1px;
            height: 159px;
            width: 515px;
        }
        .auto-style2 {
            font-size: small;
        }
        .auto-style4 {
            width: 279px;
        }
        .auto-style5 {
            text-decoration: underline;
        }
        .auto-style6 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <h2>&nbsp;</h2>
    <h2 class="auto-style6">HW 4 -<a href="../default.html"> Harlan Harris</a></h2>
    <p>&nbsp;</p>
    <p><a href="Patients.aspx">Patients</a></p>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hgharrisConnectionString %>" SelectCommand="SELECT [ListPrice], [SqFeet], [Beds], [Baths], [YearBuilt] FROM [Properties] ORDER BY [ListPrice]"></asp:SqlDataSource>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <p>
                    <table class="auto-style1">
                        <tr>
                            <td><span class="auto-style5">Properties</span>: </td>
                            <td class="auto-style4">
                                <asp:Label ID="lblNumProperties" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="auto-style5">Average Price</span>:</td>
                            <td class="auto-style4">
                                <asp:Label ID="lblAveragePrice" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="auto-style5">Number Above Average</span>: </td>
                            <td class="auto-style4">
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
                    <span class="auto-style5"><em><strong>All Properties</strong></em></span><br /> $<span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sq.Ft&nbsp;&nbsp;&nbsp; Beds&nbsp; Baths&nbsp; Year Built&nbsp; $/Sq.Foot</span><br class="auto-style2" />
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
