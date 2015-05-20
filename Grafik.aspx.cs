using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Grafik : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=GR4-0009825\\MSSQLSERVER2;Initial Catalog=fitness;Integrated Security=True";

        SqlCommand objSqlCommand = new SqlCommand();
        objSqlCommand.Connection = conn;
        objSqlCommand.CommandType = CommandType.Text;
        objSqlCommand.CommandText = "SELECT g.id, g.dzien_tygodnia, g.godzina_od, g.godzina_do, " +
            "z.nazwa zajecia, s.nazwa sala, g.opis, o.imie + ' ' +o.nazwisko instruktor " +
            "FROM grafik g " +
            "INNER join sale s on s.id = g.sala " +
            "inner join zajecia z on z.id = g.zajecia " +
            "left outer join osoby o on o.id = g.instruktor_id ";
        conn.Open();
        //this.Label7.Text = (objSqlCommand.ExecuteScalar()).ToString();
        conn.Close();

    }
}