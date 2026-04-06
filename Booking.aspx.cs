using System;
using Npgsql;

namespace TicketReservationSystem
{
    public partial class Booking : System.Web.UI.Page
    {
        string connStr = "Host=localhost;Port=5432;Username=postgres;Password=1234;Database=postgres";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            string source = txtSource.Text.Trim();
            string destination = txtDestination.Text.Trim();
            string date = txtDate.Text;

            if (source == "" || destination == "" || date == "")
            {
                lblMsg.Text = "Please fill all fields!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                using (NpgsqlConnection conn = new NpgsqlConnection(connStr))
                {
                    conn.Open();

                    string query = "INSERT INTO bookings (source, destination, travel_date) VALUES (@s, @d, @t)";

                    using (NpgsqlCommand cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@s", source);
                        cmd.Parameters.AddWithValue("@d", destination);

                        // ✅ Convert datetime-local properly
                        DateTime dt = DateTime.Parse(date);
                        cmd.Parameters.AddWithValue("@t", dt);

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("Admin.aspx");
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}