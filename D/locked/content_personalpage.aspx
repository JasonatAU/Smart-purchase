<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" StylesheetTheme="SkinFilecalendar1" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content213" ContentPlaceHolderID="content213" runat="server">
<asp:Calendar ID="calendar1" runat="server" SkinID="CalendarView" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">
    <h3>Declaration</h3>
    <p class="p">
        This is a personal page published by the author. 
        The ideas and information expressed on it have not been approved or authorised by Monash University either explicitly or implicitly. 
        In no event shall Monash University be liable for any damages whatsoever resulting from any action arising in connection with the use of this information or its publication, including any action for infringement of copyright or defamation.
    </p>
</asp:Content>

