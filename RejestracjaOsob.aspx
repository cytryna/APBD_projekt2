<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RejestracjaOsob.aspx.cs" Inherits="RejestracjaOsob" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="color: #3333FF">Przeglądanie, edycja, dodawanie i usuwanie parcowników</h2>
<br />
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
            <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Nazwisko jest wymagane" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Nazwisko jest wymagane" ForeColor="Red"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("nazwisko") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
            <asp:TemplateField HeaderText="mail" SortExpression="mail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mail") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Nieprawidłowy adres email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mail") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Nieprawidłowy adres email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("mail") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="data_ur" SortExpression="data_ur">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar3" runat="server" SelectedDate='<%# Bind("data_ur") %>'></asp:Calendar>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("data_ur") %>'></asp:Calendar>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("data_ur", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="data_rej" SortExpression="data_rej">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar4" runat="server" SelectedDate='<%# Bind("data_rej") %>'></asp:Calendar>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Calendar ID="Calendar2" runat="server" SelectedDate='<%# Bind("data_rej") %>'></asp:Calendar>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("data_rej", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <br />
    <br />
    <br />
&nbsp;

</asp:Content>

