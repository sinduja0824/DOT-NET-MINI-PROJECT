using System;
using Npgsql;

namespace TicketReservationSystem
{
    public partial class Login : System.Web.UI.Page
    {
        string connStr = "Host=localhost;Port=5432;Username=postgres;Password=1234;Database=postgres";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            using (NpgsqlConnection conn = new NpgsqlConnection(connStr))
            {
                conn.Open();

                string query = "SELECT * FROM users WHERE username=@u AND password=@p";

                using (NpgsqlCommand cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@p", password);

                    var reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // ✅ SET SESSION (VERY IMPORTANT)
                        Session["user"] = username;

                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Invalid Username or Password!";
                    }
                }
            }
        }
    }
}