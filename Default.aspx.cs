using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;
using ListItem = System.Web.UI.WebControls.ListItem;  // Add this line to avoid ambiguity
using System.Resources;


namespace WebBased_Project
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if a language cookie exists
                if (Request.Cookies["lang"] != null)
                {
                    string language = Request.Cookies["lang"].Value;
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
                }

                // Populate city dropdowns
                PopulateCityDropdowns();

                // Set the default date to today
                DateCalender.SelectedDate = DateTime.Today;

                // Set the button text
                SetButtonText();
            }
        }

        private void PopulateCityDropdowns()
        {
            FromCityCbB.Items.Clear();
            ToCityCbB.Items.Clear();

            ListItem item1 = new ListItem(GetGlobalResourceObject("Global", "Ankara").ToString(), "Ankara");
            ListItem item2 = new ListItem(GetGlobalResourceObject("Global", "Antalya").ToString(), "Antalya");
            ListItem item3 = new ListItem(GetGlobalResourceObject("Global", "Istanbul").ToString(), "Istanbul");

            FromCityCbB.Items.Add(item1);
            FromCityCbB.Items.Add(item2);
            FromCityCbB.Items.Add(item3);

            ToCityCbB.Items.Add(item1);
            ToCityCbB.Items.Add(item2);
            ToCityCbB.Items.Add(item3);
        }

        private void SetButtonText()
        {
            SearchBTN.Text = GetGlobalResourceObject("Global", "SearchButton").ToString();
        }

        protected void ChangeLanguage(string language)
        {
            // Set the culture and UI culture for the current thread
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);

            // Save the selected language in a cookie
            HttpCookie languageCookie = new HttpCookie("lang", language);
            languageCookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(languageCookie);

            // Refresh the page to update localized resources
            Response.Redirect(Request.Url.PathAndQuery);
        }

        protected void btnEnglish_Click(object sender, EventArgs e)
        {
            ChangeLanguage("en");
        }

        protected void btnPersian_Click(object sender, EventArgs e)
        {
            ChangeLanguage("fa");
        }

        protected void btnTurkish_Click(object sender, EventArgs e)
        {
            ChangeLanguage("tr");
        }

        protected void SearchBTN_Click(object sender, EventArgs e)
        {
            string date = DateCalender.SelectedDate.ToShortDateString();
            string from = FromCityCbB.SelectedValue;
            string to = ToCityCbB.SelectedValue;
            if (date != null && from != "" && to != "") // Check date from to not to be null
            {
                // Go to FlightList page by passing date, fromCity, toCity data to FlightList.aspx page 
                Response.Redirect("FlightList.aspx?date=" + date + "&from=" + from + "&to=" + to);
            }
            else // Warning!!
            {
                string message = "Please Select the the city";
                Response.Write("<script>alert('" + message + "');</script>");
            }
        }

        protected void DateCalender_DayRender(object sender, DayRenderEventArgs e)
        {
            // Render calender by disabling past dates
            if (e.Day.Date < DateTime.Today)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Gray;
            }
        }
    }
}
