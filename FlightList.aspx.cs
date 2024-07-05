using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBased_Project
{
    public partial class FlightList : System.Web.UI.Page
    {
        public static string Date, From, To;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get data that passed by prev page
                Date = Request.QueryString["date"];
                From = Request.QueryString["from"];
                To = Request.QueryString["to"];
                // Get flight info
                GetData();
            }

        }
        protected void GetData()
        {
            // Fligt 1
            string Command = "SELECT * from Flight where From_City = '" + From + "' and To_City = '" + To + "' and FlightTime = '08:00' ";
            FlightDTS1.SelectCommand = Command;
            FlightSeatCBl1.DataBind();

            // Flight 2
            Command = "SELECT * from Flight where From_City = '" + From + "' and To_City = '" + To + "' and FlightTime = '12:00' ";
            FlightDTS2.SelectCommand = Command;
            FlightSeatCBl2.DataBind();

            // Flight 3
            Command = "SELECT * from Flight where From_City = '" + From + "' and To_City = '" + To + "' and FlightTime = '14:30' ";
            FlightDTS3.SelectCommand = Command;
            FlightSeatCBl3.DataBind();

            /* Add value for labels and get available or unavailable seat */
            // Flight 1
            var data = FlightDTS1.Select(DataSourceSelectArguments.Empty);
            DataView dataView = (DataView)data;
            DataTable dataTable = dataView.ToTable();
            foreach (DataRow row in dataTable.Rows)
            {
                string selectedSeat = row["SeatNumber"].ToString();
                bool seatAvailable = (bool)row["SeatAvailable"];
                ListItem seatItem = FlightSeatCBl1.Items.FindByText(selectedSeat);
                if (seatItem != null && seatAvailable == false)
                {
                    seatItem.Enabled = false;
                    seatItem.Attributes.Add("style", "color: red;");
                }
                FlightNum1Lbl.Text = row["FlightNumber"].ToString();
                Price1Lbl.Text = row["Price"].ToString();
                Time1Lbl.Text = row["FlightTime"].ToString();
            }
            // Flight 2
            data = FlightDTS2.Select(DataSourceSelectArguments.Empty);
            dataView = (DataView)data;
            dataTable = dataView.ToTable();
            foreach (DataRow row in dataTable.Rows)
            {
                FlightNum2Lbl.Text = row["FlightNumber"].ToString();
                Price2Lbl.Text = row["Price"].ToString();
                Time2Lbl.Text = row["FlightTime"].ToString();
            }
            // Flight 3
            data = FlightDTS3.Select(DataSourceSelectArguments.Empty);
            dataView = (DataView)data;
            dataTable = dataView.ToTable();
            foreach (DataRow row in dataTable.Rows)
            {
                FlightNum3Lbl.Text = row["FlightNumber"].ToString();
                Price3Lbl.Text = row["Price"].ToString();
                Time3Lbl.Text = row["FlightTime"].ToString();
            }
            /* /Add value for labels and get available or unavailable seat/ */
        }

        protected void SelectBTN_Click(object sender, EventArgs e)
        {
            int selectedCount1 = 0;
            int selectedCount2 = 0;
            int selectedCount3 = 0;

            /* Get selected seat cont */
            foreach (ListItem item in FlightSeatCBl1.Items)
            {
                if (item.Selected)
                {
                    selectedCount1++;
                }
            }
            foreach (ListItem item in FlightSeatCBl2.Items)
            {
                if (item.Selected)
                {
                    selectedCount2++;
                }
            }
            foreach (ListItem item in FlightSeatCBl3.Items)
            {
                if (item.Selected)
                {
                    selectedCount3++;
                }
            }
            /*-------------------------------------*/

            /* Check which btn clicked */
            if (sender == SelectBTN1)
            {
                /* Check selected seat must be 1 */
                if (selectedCount1 == 1)
                {
                    string Command = "update Flight set SeatAvailable = 0 where From_City = '" + From + "' and To_City = '" + To + "' and FlightTime = '08:00' and SeatNumber ='" + FlightSeatCBl1.SelectedItem.Text + "'";
                    FlightDTS1.UpdateCommand = Command;
                    FlightDTS1.Update();
                    Response.Redirect("Registeration.aspx?selectedseate=" + FlightSeatCBl1.SelectedItem.Text + "&flightnumber=" + FlightNum1Lbl.Text);
                }
                else
                {
                    string Message = "Plese Select atleast one seat number";
                    Response.Write("<script>alert('" + Message + "');</script>");
                }
            }
            else if (sender == SelectBTN2)
            {
                /* Check selected seat must be 1 */
                if (selectedCount2 == 1)
                {
                    string Command = "update Flight set SeatAvailable = 0 where From_City = '" + From + "' and To_City = '" + To + "' and FlightTime = '12:00' and SeatNumber ='" + FlightSeatCBl2.SelectedItem.Text + "'";
                    FlightDTS1.UpdateCommand = Command;
                    FlightDTS1.Update();
                    Response.Redirect("Registeration.aspx?selectedseate=" + FlightSeatCBl2.SelectedItem.Text + "&flightnumber=" + FlightNum2Lbl.Text);
                }
                else
                {
                    string Message = "Plese Select the seat number";
                    Response.Write("<script>alert('" + Message + "');</script>");
                }
            }
            else if (sender == SelectBTN3)
            {
                /* Check selected seat must be 1 */
                if (selectedCount3 == 1)
                {
                    string Command = "update Flight set SeatAvailable = 0 where From_City = '" + From + "' and To_City = '" + To + "' and FlightTime = '14:30' and SeatNumber ='" + FlightSeatCBl3.SelectedItem.Text + "'";
                    FlightDTS1.UpdateCommand = Command;
                    FlightDTS1.Update();
                    Response.Redirect("Registeration.aspx?selectedseate=" + FlightSeatCBl3.SelectedItem.Text + "&flightnumber=" + FlightNum3Lbl.Text);
                }
                else
                {
                    string Message = "Plese Select the seat number";
                    Response.Write("<script>alert('" + Message + "');</script>");
                }
            }
        }
    }
}
