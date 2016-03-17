<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    void gv2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        lb1.Text = "Customer ID:<br />" + gv2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text + 
            "<br />Customer Name:<br/>" + gv2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text + 
            "<br/>Customer Gender:<br/>" + gv2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text + 
            "<br/>Customer Age:<br/>" + gv2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text + 
            "<br/>Customer Email:<br/>" + gv2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder01" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [customers]"></asp:SqlDataSource>
    <asp:gridview ID="gv2" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" OnRowCommand="gv2_RowCommand">
        <columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="cust_name" HeaderText="Name" />
            <asp:BoundField DataField="cust_gender" HeaderText="Gender" />
            <asp:BoundField DataField="cust_age" HeaderText="Age" />
            <asp:BoundField DataField="cust_email" HeaderText="Email" />
            <asp:ButtonField ButtonType="Button" Text="Display" HeaderText="Display" />
        </columns>
    </asp:gridview>

    <asp:label ID="lb1" runat="server" Text="" />

</asp:Content>

