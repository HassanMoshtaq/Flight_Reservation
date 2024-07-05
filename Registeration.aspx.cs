using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBased_Project
{
    public partial class Registration : System.Web.UI.Page
    {

        static string selectedSeat;
        static string flightNum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                selectedSeat = Request.QueryString["selectedseate"];
                flightNum = Request.QueryString["flightnumber"];
            }
        }
        protected void SaveBTN_Click(object sender, EventArgs e)
        {
            string command = string.Format("insert into Booking(BookingID,PassengerID,PassengerSeatID,PassengerName,PassengerSurname,PassengerEmail,PassengerPhone) " +
                "values ('{0}', '{1}','{2}', '{3}', '{4}', '{5}', '{6}')", flightNum + "-" + TcTB.Text, TcTB.Text, selectedSeat.Trim(), NameTB.Text, SureNameTB.Text, EmailTB.Text, PhoneNumTB.Text);
            DTS.InsertCommand = command;
            DTS.Insert();

            string message = "Your Booking is Successful";
            Response.Write("<script>alert('" + message + "');</script>");

            // Check if EmailTB.Text is not null or empty
            if (!string.IsNullOrEmpty(EmailTB.Text))
            {
                // Send confirmation email
                string subject = "Booking Confirmation";
                string body = $"Dear {NameTB.Text},<br/><br/>Your booking is successful. Here are your booking details:<br/>" +
                              $"Flight Number: {flightNum}<br/>" +
                              $"Seat Number: {selectedSeat}<br/>" +
                              $"Name: {NameTB.Text} {SureNameTB.Text}<br/>" +
                              $"Email: {EmailTB.Text}<br/>" +
                              $"Phone: {PhoneNumTB.Text}<br/><br/>" +
                              "Thank you for booking with us!";
                EmailUtility.SendEmail(EmailTB.Text, subject, body);
            }
            else
            {
                // Handle the case where the email is not provided
                Response.Write("<script>alert('Email address is missing.');</script>");
            }

            Response.Redirect("Default.aspx");
        }
    }
}
