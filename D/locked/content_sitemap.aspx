<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" StylesheetTheme="SkinFilecalendar1" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
    void Page_Load()
    {
        ArrayList fileList = new ArrayList();
        DirectoryInfo dir = new DirectoryInfo(Server.MapPath("."));
        foreach (FileInfo file in dir.GetFiles())
        {
            if (file.Name == "content_sitemap.aspx")
                fileList.Add(file.Name);
        }
        dlFiles.DataSource = fileList;
        dlFiles.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content213" ContentPlaceHolderID="content213" runat="server">
<asp:Calendar ID="calendar1" runat="server" SkinID="calendarView" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />

    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ShowLines="true" />

    <asp:DataList ID="dlFiles" runat="server" Font-Names="Arial">
        <HeaderStyle Font-Bold="true" />
        <HeaderTemplate>Directory File List</HeaderTemplate>
        <AlternatingItemStyle BackColor="#7DCCF7" />
        <ItemTemplate> 
         <a href="DisplayCode.aspx?filename= 
           <%# Container.DataItem %>" target="_blank"> 
           <%# Container.DataItem %></a> 
        </ItemTemplate>
        </asp:DataList>
</asp:Content>

