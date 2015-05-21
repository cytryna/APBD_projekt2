<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Rezerwacja.aspx.cs" Inherits="Rezerwacja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>"
        SelectCommand="SELECT g.id, g.dzien_tygodnia, g.godzina_od, g.godzina_do, 
	        z.nazwa zajecia, s.nazwa sala, g.opis, o.imie + ' ' +o.nazwisko instruktor 
            FROM grafik g 
            INNER join sale s on s.id = g.sala
            inner join zajecia z on z.id = g.zajecia
            left outer join osoby o on o.id = g.instruktor_id"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>"
        SelectCommand="SELECT * FROM grafik WHERE (dzien_tygodnia = @DEPTNO OR @DEPTNO = '0')">
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
            <asp:GridView ID="GridView2" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource2" ForeColor="Black" Width="735px">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
         

        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource3" ForeColor="Black" Style="margin-top: 0px" Width="654px">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Cancel" HeaderText="Zarezerwuj " ShowHeader="True" Text="Button" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>



        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>

    </asp:MultiView>
</asp:Content>

