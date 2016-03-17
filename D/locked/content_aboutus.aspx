<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" StylesheetTheme="SkinFile2" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content213" ContentPlaceHolderID="content213" runat="server">
<asp:Calendar ID="calendar1" runat="server" SkinID="CalendarView" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">
    <img src="../Images/logo.PNG"/><br/>
    <h3>About Us</h3>
    <p class="p">The aim of this website is to help customers make smarter purchase desicions. 
This website can collect the price of an item from several different websites.
Customers can search the products they are interested in on this website, and get the price information,
in order to spend less money, but buying more things.</p>
</asp:Content>

