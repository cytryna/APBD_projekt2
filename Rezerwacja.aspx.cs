using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Rezerwacja : System.Web.UI.Page
{
    private GridViewRow grafik = null;
    private String data;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.MultiView1.SetActiveView(View1);
        }

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            grafik = GridView2.Rows[index];

            //Label1.Text = "id " + row.Cells[0].Text;
            // + " " + Server.HtmlDecode(row.Cells[2].Text) + " " + Server.HtmlDecode(row.Cells[3].Text);

            data = getNajblizszyDzienTygodnia(grafik.Cells[1].Text).ToString("yyyy-MM-dd");
            Label1.Text = "Najbliższy(a) " + grafik.Cells[1].Text + " to " + data;
            Label5.Text = data;
            Label2.Text = "Wybierz osobę której dokonasz rezerwacji na zajęcia " + grafik.Cells[4].Text;
            Label6.Text = grafik.Cells[0].Text;

            this.MultiView1.SetActiveView(View2);
            data = getNajblizszyDzienTygodnia(grafik.Cells[1].Text).ToString("yyyy-MM-dd");
        }
    }

    private DateTime getNajblizszyDzienTygodnia(String dzien)
    {
        DateTime saveNow = DateTime.Now;

        while (!saveNow.DayOfWeek.Equals(getDayOfWeek(dzien)))
        {
            //Trace.WriteLine(saveNow.ToString());
            saveNow = saveNow.AddDays(1);
        }
        return saveNow;
    }

    private DayOfWeek getDayOfWeek(String dzien)
    {

        switch (dzien)
        {
            case "poniedziałek":
                return DayOfWeek.Monday;
            case "wtorek":
                return DayOfWeek.Tuesday;
            case "środa":
                return DayOfWeek.Wednesday;
            case "czwartek":
                return DayOfWeek.Thursday;
            case "piątek":
                return DayOfWeek.Friday;
            case "sobota":
                return DayOfWeek.Saturday;
            case "niedziela":
                return DayOfWeek.Sunday;
            default:
                Console.WriteLine("Brak dnia tygodnia dla liczby" + dzien);
                return DayOfWeek.Monday;
        }

    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow osoba = GridView3.Rows[index];

            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Data Source=GR4-0009825\\MSSQLSERVER2;Initial Catalog=fitness;Integrated Security=True;User ID=radek;Password=nokia1";

            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "RezerwacjaInsertCommand";
            cmd.Parameters.AddWithValue("@osoba_id", osoba.Cells[1].Text);
            cmd.Parameters.AddWithValue("@data", Label5.Text);
            cmd.Parameters.AddWithValue("@obecnosc", DBNull.Value);
            cmd.Parameters.AddWithValue("@grafik_id", Label6.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            this.MultiView1.SetActiveView(View3);
            Label3.Text = "Zapisano poprawnie ";
        }
      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["FragmentNazw"] = this.TextBox1.Text;
        //Response.Redirect("Rezerwacja.aspx");
        //Response.Redirect("Rezerwacja.aspx?fragmentNazw=" + this.TextBox1.Text);
    }
}