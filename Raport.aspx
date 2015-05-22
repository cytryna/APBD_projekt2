<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Raport.aspx.cs" Inherits="Raport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:s10338ConnectionString %>"
        SelectCommand="get_raport" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <h2>Lista aktualnych rezerwacji</h2>
        </HeaderTemplate>
        <ItemTemplate>Dnia <%#Eval("data") %> o godzinie <%#Eval("godzina_od") %> osoba <%#Eval("osoba") %> jest zapisana na zajęcia <%#Eval("zajecia") %> w sali <%#Eval("sala") %></ItemTemplate>
        <SeparatorTemplate>
            <br />            
        </SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

