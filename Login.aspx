<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TicketReservationSystem.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
        }

        .container {
            width: 320px;
            margin: 100px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            text-align: center;
        }

        input {
            width: 95%;
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
            color: red;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="container">

        <h2>Login</h2>

        <asp:TextBox ID="txtUser" runat="server" Placeholder="Username"></asp:TextBox>

        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

        <br /><br />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

    </div>

</form>

</body>
</html>