<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="vihaan_online.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>Register -Vihaan 2K15</title>
    <link rel="stylesheet" href="css/styleEvents.css" />
</head>
<body>
    <div class="parent-wrapper">

        <div class="header">

            <div class="header-logo-container">
                <a href="index.html">
                    <img alt="Vihaan" src="res/vihaan.png" /></a>
            </div>

            <ol class="nav-bar">
                <li><a href="index.html">Home</a></li>
                <li><a href="events.html">Events</a></li>
                <li><a href="register.aspx">Register</a></li>
                <li><a href="workshop.html">Workshop</a></li>
                <li><a href="rc-Airshow.html">Airshow</a></li>
            </ol>

        </div>


        <div class="page">

            <div class="sections register-page-colored">
                <div class="box">
                    <h1 class="col-heading" style="color: #FFF;">Registration</h1>
                </div>
            </div>
            <div class="sections register-page-unc">
                <div class="box">
                    <form runat="server" style="width: 100%; height: 100%;">
                        <table id="reg-form">
                            <tr class="tRow r1">
                                <td class="tData">
                                    <label>Team representative
                                        <br />
                                        <p style="text-align: center; font-size: 0.8rem;">(OR)</p>
                                        Participant Name</label></td>
                                <td class="tData">
                                    <asp:TextBox ID="tbName" CssClass="tbox" runat="server" MaxLength="40" /></td>
                            </tr>
                            <tr id="tRow r2">
                                <td class="tData">
                                    <label>Email:</label></td>
                                <td class="tData">
                                    <asp:TextBox ID="tbEmail" CssClass="tbox" runat="server" MaxLength="30" /></td>
                            </tr>
                            <tr id="tRow r3">
                                <td class="tData">
                                    <label>Phone Number:</label></td>
                                <td class="tData">
                                    <asp:TextBox ID="tbPh" CssClass="tbox" runat="server" MaxLength="15" /></td>
                            </tr>
                            <tr id="tRow r4">
                                <td class="tData">
                                    <label>Department:</label></td>
                                <td class="tData">
                                    <asp:TextBox ID="tbDept" CssClass="tbox" runat="server" MaxLength="40" /></td>
                            </tr>
                            <tr>
                                <td class="tData">
                                    <label>Year:</label></td>
                                <td class="tData>">
                                    <asp:RadioButtonList ID="rblYear" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr id="tRow r5">
                                <td class="tData">
                                    <label>College:</label></td>
                                <td class="tData">
                                    <asp:TextBox ID="tbCollege" CssClass="tbox" runat="server" MaxLength="50" /></td>
                            </tr>

                            <tr>
                                <td class="tData cb" colspan="2">
                                    <asp:CheckBox ID="cbAcco" runat="server" Text="Need accomodation?" TextAlign="Left" /><br />
                                    <label id="acco-note">(Details will be intimated)</label></td>
                            </tr>
                            <tr>
                                <td class="tData cb" colspan="2">
                                    <asp:CheckBox ID="cbWork" runat="server" Text="Participating for the workshop?" TextAlign="Left" /></td>
                            </tr>
                            <tr>
                                <td class="tData em" colspan="2">
                                    <asp:Label ID="errMsg2" runat="server" ForeColor="#C03055"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="tData OKbutton" colspan="2" style="text-align: center;">
                                    <asp:Button ID="bReg" runat="server" Text="Register Now" OnClick="bReg_Click" /></td>
                            </tr>

                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
