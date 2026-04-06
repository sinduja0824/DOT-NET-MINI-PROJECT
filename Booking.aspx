<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="TicketReservationSystem.Booking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Booking</title>

    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial;
        }

        .container {
            width: 350px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            margin: 100px auto;
        }

        h2 {
            text-align: center;
        }

        .textbox {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .msg {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="container">

        <h2>Ticket Booking</h2>

        Source:
        <asp:TextBox ID="txtSource" runat="server" CssClass="textbox"></asp:TextBox>

        Destination:
        <asp:TextBox ID="txtDestination" runat="server" CssClass="textbox"></asp:TextBox>

        <!-- ✅ DATE + TIME PICKER -->
        Travel Date & Time:
        <asp:TextBox ID="txtDate" runat="server" CssClass="textbox" TextMode="DateTimeLocal"></asp:TextBox>

        <asp:Button ID="btnBook" runat="server" Text="Book Ticket" CssClass="btn" OnClick="btnBook_Click" />

        <br /><br />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

    </div>

</form>
</body>
</html>