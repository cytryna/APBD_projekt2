using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rezerwacja : System.Web.UI.Page
{
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

            GridViewRow row = GridView2.Rows[index];

            //Label1.Text = "id " + row.Cells[0].Text;
                // + " " + Server.HtmlDecode(row.Cells[2].Text) + " " + Server.HtmlDecode(row.Cells[3].Text);

            
            Label1.Text = "Najbliższy(a) " + row.Cells[1].Text + " to " + getNajblizszyDzienTygodnia(row.Cells[1].Text).ToString("yyyy-MM-dd");
            Label2.Text = "Wybierz osobę której dokonasz rezerwacji na zajęcia " + row.Cells[4].Text; 

            this.MultiView1.SetActiveView(View2);
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
}