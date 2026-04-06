<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TicketReservationSystem.Admin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin</title>

    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            text-align: center;
        }

        .grid {
            width: 100%;
        }

        .grid th {
            background-color: #007bff;
            color: white;
            padding: 10px;
        }

        .grid td {
            padding: 10px;
            text-align: center;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="container">

    <h2>All Bookings</h2>

    <!-- 🔴 LOGOUT BUTTON -->
    <asp:Button ID="btnLogout" runat="server" Text="Logout" 
        OnClick="btnLogout_Click" 
        Style="float:right; margin-bottom:10px; background-color:red; color:white; border:none; padding:8px 15px; border-radius:5px;" />

    <asp:GridView ID="GridView1" runat="server" CssClass="grid"
        AutoGenerateColumns="False"
        DataKeyNames="id"
        OnRowDeleting="GridView1_RowDeleting">

        <Columns>

            <asp:BoundField DataField="id" HeaderText="Ticket ID" />
            <asp:BoundField DataField="source" HeaderText="Source" />
            <asp:BoundField DataField="destination" HeaderText="Destination" />

            <asp:BoundField DataField="travel_date" HeaderText="Travel Date & Time"
                DataFormatString="{0:dd-MM-yyyy HH:mm}" HtmlEncode="false" />

            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />

        </Columns>

    </asp:GridView>

</div>

</form>

</body>
</html>