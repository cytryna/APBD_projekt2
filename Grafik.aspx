<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Grafik.aspx.cs" Inherits="Grafik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 style="color: #3333FF">Grafik - jego przeglądanie i edycja </h2>




   
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="196px" Width="910px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="dzien_tygodnia" SortExpression="dzien_tygodnia">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="dzien_tygodnia" DataValueField="id" SelectedValue='<%# Bind("dzien_tygodnia") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="dzien_tygodnia" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("dzien_tygodnia") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="godzina_od" SortExpression="godzina_od">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("godzina_od") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Błędny format" ValidationExpression="([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("godzina_od") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="godzina_do" SortExpression="godzina_do">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("godzina_do") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Błędny format" ValidationExpression="([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("godzina_do") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="zajecia" HeaderText="zajecia" SortExpression="zajecia" />
            <asp:BoundField DataField="sala" HeaderText="sala" SortExpression="sala" />
            <asp:BoundField DataField="opis" HeaderText="opis" SortExpression="opis" />
            <asp:BoundField DataField="instruktor_id" HeaderText="instruktor_id" SortExpression="instruktor_id" />
            <asp:BoundField />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>" SelectCommand="SELECT [id], [dzien_tygodnia] FROM [dni_tygodnia]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>" DeleteCommand="DELETE FROM [grafik] WHERE [id] = @id" InsertCommand="INSERT INTO [grafik] ([dzien_tygodnia], [godzina_od], [godzina_do], [zajecia], [sala], [opis], [instruktor_id]) VALUES (@dzien_tygodnia, @godzina_od, @godzina_do, @zajecia, @sala, @opis, @instruktor_id)" SelectCommand="SELECT [id], [dzien_tygodnia], [godzina_od], [godzina_do], [zajecia], [sala], [opis], [instruktor_id] FROM [grafik]" UpdateCommand="UPDATE [grafik] SET [dzien_tygodnia] = @dzien_tygodnia, [godzina_od] = @godzina_od, [godzina_do] = @godzina_do, [zajecia] = @zajecia, [sala] = @sala, [opis] = @opis, [instruktor_id] = @instruktor_id WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dzien_tygodnia" Type="Int32" />
            <asp:Parameter DbType="Time" Name="godzina_od" />
            <asp:Parameter DbType="Time" Name="godzina_do" />
            <asp:Parameter Name="zajecia" Type="Int32" />
            <asp:Parameter Name="sala" Type="Int32" />
            <asp:Parameter Name="opis" Type="String" />
            <asp:Parameter Name="instruktor_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dzien_tygodnia" Type="Int32" />
            <asp:Parameter DbType="Time" Name="godzina_od" />
            <asp:Parameter DbType="Time" Name="godzina_do" />
            <asp:Parameter Name="zajecia" Type="Int32" />
            <asp:Parameter Name="sala" Type="Int32" />
            <asp:Parameter Name="opis" Type="String" />
            <asp:Parameter Name="instruktor_id" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

