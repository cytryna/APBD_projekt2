<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RejestracjaOsob.aspx.cs" Inherits="RejestracjaOsob" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Przeglądanie, edycja, dodawanie i usuwanie parcowników<br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>" DeleteCommand="DELETE FROM [osoby] WHERE [id] = @id" InsertCommand="INSERT INTO [osoby] ([imie], [nazwisko], [telefon], [mail], [data_ur], [data_rej], [data_zatrudnienia]) VALUES (@imie, @nazwisko, @telefon, @mail, @data_ur, @data_rej, @data_zatrudnienia)" SelectCommand="SELECT [id], [imie], [nazwisko], [telefon], [mail], [data_ur], [data_rej], [data_zatrudnienia] FROM [osoby]" UpdateCommand="UPDATE [osoby] SET [imie] = @imie, [nazwisko] = @nazwisko, [telefon] = @telefon, [mail] = @mail, [data_ur] = @data_ur, [data_rej] = @data_rej, [data_zatrudnienia] = @data_zatrudnienia WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="imie" Type="String" />
            <asp:Parameter Name="nazwisko" Type="String" />
            <asp:Parameter Name="telefon" Type="String" />
            <asp:Parameter Name="mail" Type="String" />
            <asp:Parameter DbType="Date" Name="data_ur" />
            <asp:Parameter DbType="Date" Name="data_rej" />
            <asp:Parameter DbType="Date" Name="data_zatrudnienia" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="imie" Type="String" />
            <asp:Parameter Name="nazwisko" Type="String" />
            <asp:Parameter Name="telefon" Type="String" />
            <asp:Parameter Name="mail" Type="String" />
            <asp:Parameter DbType="Date" Name="data_ur" />
            <asp:Parameter DbType="Date" Name="data_rej" />
            <asp:Parameter DbType="Date" Name="data_zatrudnienia" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="399px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
            <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
            <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
            <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
            <asp:BoundField DataField="data_ur" HeaderText="data_ur" SortExpression="data_ur" />
            <asp:BoundField DataField="data_rej" HeaderText="data_rej" SortExpression="data_rej" />
            <asp:BoundField DataField="data_zatrudnienia" HeaderText="data_zatrudnienia" SortExpression="data_zatrudnienia" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <br />
&nbsp;

</asp:Content>

