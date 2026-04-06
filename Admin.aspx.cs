using System;
using Npgsql;

namespace TicketReservationSystem
{
    public partial class Admin : System.Web.UI.Page
    {
        // 🔴 UPDATE YOUR DB DETAILS
        string connStr = "Host=localhost;Port=5432;Username=postgres;Password=1234;Database=postgres";

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔐 Check login
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        // 🔄 LOAD BOOKINGS INTO GRID
        void LoadBookings()
        {
            using (NpgsqlConnection conn = new NpgsqlConnection(connStr))
            {
                conn.Open();

                string query = "SELECT * FROM bookings ORDER BY id DESC";

                using (NpgsqlCommand cmd = new NpgsqlCommand(query, conn))
                {
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }
            }
        }

        // 🗑 DELETE BOOKING
        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (NpgsqlConnection conn = new NpgsqlConnection(connStr))
            {
                conn.Open();

                string query = "DELETE FROM bookings WHERE id=@id";

                using (NpgsqlCommand cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
            }

            // 🔄 Refresh grid
            LoadBookings();
        }

        // 🔓 LOGOUT FUNCTION
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}