<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Grafik.aspx.cs" Inherits="Grafik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 style="color: #3333FF">Grafik - jego przeglądanie i edycja </h2>


    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:fitnessConnectionString %>"
        SelectCommand="SELECT g.id, g.dzien_tygodnia, g.godzina_od, g.godzina_do, 
	        z.nazwa zajecia, s.nazwa sala, g.opis, o.imie + ' ' +o.nazwisko instruktor 
            FROM grafik g 
            INNER join sale s on s.id = g.sala
            inner join zajecia z on z.id = g.zajecia
            left outer join osoby o on o.id = g.instruktor_id">
        <%-- <DeleteParameters>
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
        </UpdateParameters>--%>
    </asp:SqlDataSource>

    <asp:MultiView ID="MultiView1" runat="server">
         <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource3" ForeColor="Black" style="margin-top: 0px" Width="654px">
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
        <asp:View ID="View2" runat="server">
        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>
       
    </asp:MultiView>
    <br />
    <br />

</asp:Content>

