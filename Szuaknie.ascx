<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Szuaknie.ascx.cs" Inherits="Szuaknie" %>
<p>
    Podaj fragment nazwiska</p>
<p>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
</p>
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

