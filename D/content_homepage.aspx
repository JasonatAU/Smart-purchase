<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" StylesheetTheme="SkinFilecalendar1" %>

<script runat="server">



</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content213" ContentPlaceHolderID="content213" runat="server">
<asp:Calendar ID="calendar1" runat="server" SkinID="calendarView" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">
    <img src="Images/logo.PNG" runat="server" />
    <h3>Home Page</h3>
    <p class="p">
    Email: qjin15@student.monash.edu<br/>
    Server Webmaster: qjin15@student.monash.edu<br/>
    <asp:hyperlink ID="link1" runat="server" NavigateUrl="~/content_personalpage.aspx" Text="Declaration" /><br/>
    Monash disclaimer: http://www.monash.edu/disclaimer-copyright <br/>
    Copyright2016 Smart Purchase Pty.Ltd.<br/>
    </p>
</asp:Content>


