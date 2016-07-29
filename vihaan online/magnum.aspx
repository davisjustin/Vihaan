<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="magnum.aspx.cs" Inherits="vihaan_online.magnum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lock and</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="pwd" TextMode="Password"  MaxLength="20" runat="server"></asp:TextBox>
        <asp:Button ID="pwdOK" runat="server" Text="Load" OnClick="pwdOK_Click" />
        <asp:Button ID="pwdWork" runat="server" Text="Work" OnClick="pwdWork_Click" />
        <asp:Button ID="pwdAcco" runat="server" Text="Acco" OnClick="pwdAcco_Click" />
        <asp:GridView ID="regData" runat="server" AutoGenerateColumns="False" DataKeyNames="RegID" DataSourceID="onlineView" Visible="false" >
            <Columns>
                <asp:BoundField DataField="RegID" HeaderText="RegID" ReadOnly="True" SortExpression="RegID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Ph" HeaderText="Ph" SortExpression="Ph" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="College" HeaderText="College" SortExpression="College" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Workshop" HeaderText="Workshop" SortExpression="Workshop" />
                <asp:BoundField DataField="Accomodation" HeaderText="Accomodation" SortExpression="Accomodation" />
                <asp:BoundField DataField="DnT_IST" HeaderText="DnT_IST" SortExpression="DnT_IST" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="onlineView" runat="server" ConnectionString="<%$ ConnectionStrings:DB_9BBD1D_vihaanConnectionString %>"></asp:SqlDataSource>
    </form>
</body>
</html>
