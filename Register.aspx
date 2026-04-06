<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TicketReservationSystem.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
        }

        .container {
            width: 320px;
            margin: 80px auto;
            padding: 25px;
            background: white;
            border-radius: 12px;
            box-shadow: 0px 0px 15px gray;
            text-align: center;
        }

        h2 {
            color: darkblue;
            margin-bottom: 20px;
        }

        input, select {
            width: 95%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .msg {
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="container">

            <h2>Create Account</h2>

            <asp:TextBox ID="txtUser" runat="server" Placeholder="Enter Username"></asp:TextBox>

            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>

            <asp:DropDownList ID="ddlRole" runat="server">
                <asp:ListItem Text="Select Role" Value=""></asp:ListItem>
                <asp:ListItem>User</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

        </div>

    </form>

</body>
</html>