<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkPaymentStatus.aspx.cs" Inherits="checkPaymentStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnPaymentSUccess" OnClick="btnPaymentSUccess_Click" runat="server" Text="Success" />
            <asp:Button ID="btnPaymentFailed" OnClick="btnPaymentFailed_Click" runat="server" Text="Failed" />
        </div>
    </form>
</body>
</html>
