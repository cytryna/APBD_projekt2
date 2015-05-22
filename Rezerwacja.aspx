<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Rezerwacja.aspx.cs" Inherits="Rezerwacja" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>"
        SelectCommand="SELECT g.id, d.dzien_tygodnia, g.godzina_od, g.godzina_do, 
	        z.nazwa zajecia, s.nazwa sala, o.imie + ' ' +o.nazwisko instruktor 
            FROM grafik g 
            INNER join sale s on s.id = g.sala
            inner join dni_tygodnia d on d.id=g.dzien_tygodnia
            inner join zajecia z on z.id = g.zajecia
            left outer join osoby o on o.id = g.instruktor_id
            WHERE (g.dzien_tygodnia = @DEPTNO OR @DEPTNO = '0')">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="DEPTNO" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">Wszystkie</asp:ListItem>
                <asp:ListItem Value="1">Poniedziałek</asp:ListItem>
                <asp:ListItem Value="2">Wtorek</asp:ListItem>
                <asp:ListItem Value="3">Środa</asp:ListItem>
                <asp:ListItem Value="4">Czwartek</asp:ListItem>
                <asp:ListItem Value="5">Piątek</asp:ListItem>
                <asp:ListItem Value="6">Sobota</asp:ListItem>
                <asp:ListItem Value="7">Niedziela</asp:ListItem>
            </asp:DropDownList>


            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" OnRowCommand="GridView2_RowCommand" Width="785px">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="dzien_tygodnia" HeaderText="dzien_tygodnia" SortExpression="dzien_tygodnia" />
                    <asp:BoundField DataField="godzina_od" HeaderText="godzina_od" SortExpression="godzina_od" />
                    <asp:BoundField DataField="godzina_do" HeaderText="godzina_do" SortExpression="godzina_do" />
                    <asp:BoundField DataField="zajecia" HeaderText="zajecia" SortExpression="zajecia" />
                    <asp:BoundField DataField="sala" HeaderText="sala" SortExpression="sala" />
                    <asp:BoundField DataField="instruktor" HeaderText="instruktor" ReadOnly="True" SortExpression="instruktor" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Rezerwacja" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <br />


        </asp:View>

        <asp:View ID="View2" runat="server">

            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <p>
                Podaj fragment nazwiska
            </p>
            <p>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </p>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Filtruj" />
          
            <br />
            

            <asp:GridView ID="GridView3" runat="server" Width="720px" DataSourceID="SqlDataSource4" OnRowCommand="GridView3_RowCommand">
                <Columns>
                    <asp:ButtonField ButtonType="Button" Text="Zapisz" CommandName="Select" />
                </Columns>
            </asp:GridView>
            <br />


            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>"
                SelectCommand="SELECT [id], [imie], [nazwisko] FROM [osoby] WHERE nazwisko LIKE '%' + @ENAME + '%'">
                <SelectParameters>
                    <asp:SessionParameter Name="ENAME" SessionField="FragmentNazw" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />
            <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>

        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </asp:View>
    </asp:MultiView>
</asp:Content>

