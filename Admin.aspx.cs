using System;
using System.IO;
using System.Web.UI;
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace WebBased_Project
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ExportBTN_Click(object sender, EventArgs e)
        {
            ExportGridToPDF();
        }

        private void ExportGridToPDF()
        {
            // Create a new PDF document
            Document document = new Document();

            // Create a new PDF writer
            PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(Server.MapPath("~/PassengerInfo.pdf"), FileMode.Create));

            // Open the PDF document
            document.Open();

            // Create a new table with the same number of columns as the GridView
            PdfPTable table = new PdfPTable(GV.Columns.Count);

            // Add table headers
            for (int i = 0; i < GV.Columns.Count; i++)
            {
                table.AddCell(GV.Columns[i].HeaderText);
            }

            // Add table rows and cells
            for (int row = 0; row < GV.Rows.Count; row++)
            {
                for (int column = 0; column < GV.Columns.Count; column++)
                {
                    table.AddCell(GV.Rows[row].Cells[column].Text);
                }
            }

            // Add the table to the document
            document.Add(table);

            // Close the document
            document.Close();

            // Provide the PDF file as a download
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=PassengerInfo.pdf");
            Response.TransmitFile(Server.MapPath("~/PassengerInfo.pdf"));
            Response.End();
        }
    }
}
