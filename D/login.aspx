<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    void Login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM accounts WHERE username = '" + Login.UserName + "' AND userpassword = '" + Login.Password + "'";

        SqlDataSource1.Select(DataSourceSelectArguments.Empty);
    }

    private void CheckLogin(object sender,
      SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            FormsAuthentication.RedirectFromLoginPage(Login.UserName,
              false);
        }
        else
        {
            Login.FailureText = "Invalid Login";
        }
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content213" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder01" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString6 %>" ProviderName="<%$ ConnectionStrings:ConnectionString6.ProviderName %>" SelectCommand="SELECT * FROM [accounts]" OnSelected="CheckLogin"></asp:SqlDataSource>
    
    <asp:Login ID="Login" runat="server" OnAuthenticate="Login_Authenticate" />
</asp:Content>

