using System;
using Npgsql;

namespace TicketReservationSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();
            string role = ddlRole.SelectedValue;

            // 🔴 Validation
            if (username == "" || password == "" || role == "")
            {
                lblMsg.Text = "Please fill all fields!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 🔴 Your PostgreSQL connection string
            string connStr = "Host=localhost;Port=5432;Username=postgres;Password=1234;Database=postgres";

            try
            {
                using (NpgsqlConnection conn = new NpgsqlConnection(connStr))
                {
                    conn.Open();

                    string query = "INSERT INTO users (username, password, role) VALUES (@u, @p, @r)";

                    using (NpgsqlCommand cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@u", username);
                        cmd.Parameters.AddWithValue("@p", password);
                        cmd.Parameters.AddWithValue("@r", role);

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            // ✅ Redirect to Login Page
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            lblMsg.Text = "Registration Failed!";
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}