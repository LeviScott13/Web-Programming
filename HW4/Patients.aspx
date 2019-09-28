﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Patients.aspx.cs" Inherits="Patients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HW 4 -Harlan Harris</title>
    <link href="site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style2 {
            font-size: small;
        }
    </style>
</head>
<body>
    <h2><a href="Default.aspx">HW 4</a> - <a href="../default.html">Harlan Harris</a></h2>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>&nbsp;</td>
                        <td>ID</td>
                        <td>Last-Name</td>
                        <td>First-Name</td>
                        <td>Address</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button ID="btnAddPatient" runat="server" Text="Add Patient" Width="100px" OnClick="btnAddPatient_Click" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtAddLName" runat="server" Width="115px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddFName" runat="server" Width="110px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddAddress" runat="server" Width="148px"></asp:TextBox>
                        </td>
                        <td>
                            <br />
                            <br />
                        </td>
                    </tr>
 
                    <tr>
                        <td>
                            <asp:Button ID="btnDeletePatient" runat="server" Text="Delete Patient" Width="100px" OnClick="btnDeletePatient_Click" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtDelID" runat="server" Width="69px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
 
                    <tr>
                        <td>
                            <asp:Button ID="btnUpdatePatient" runat="server" Text="Update Patient" Width="100px" OnClick="btnUpdatePatient_Click" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtUpdID" runat="server" Width="69px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUpdLName" runat="server" Width="113px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUpdFName" runat="server" Width="112px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUpdAddress" runat="server" Width="151px"></asp:TextBox>
                        </td>
                    </tr>
 
                </table>
                <p>
                    &nbsp;Patients</p>
            
                <p>
                    <span class="auto-style2">ID&nbsp; Last-Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FirstName&nbsp;&nbsp; Address</span><br class="auto-style2" />
                    <asp:TextBox ID="txtPatients" runat="server" Height="232px" TextMode="MultiLine" Width="407px"></asp:TextBox>
                    <br />
                    <br />
                    Debug Info<br />
                    <asp:TextBox ID="txtMsg" runat="server" Height="232px" TextMode="MultiLine" Width="594px"></asp:TextBox>
                </p>
            
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
