<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    void findCustomer(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters.Add("ID", ID);
        Button bt = (Button)sender;
        switch (bt.CommandName)
        {
            case "ID": SqlDataSource1.SelectCommand = "SELECT * FROM customers WHERE ID LIKE '%" + tx1.Text.Trim(' ') + "%'"; break;
            case "Name": SqlDataSource1.SelectCommand="SELECT * FROM customers WHERE cust_name LIKE '%" + tx2.Text.Trim(' ') + "%'";break;
            case "Membership": SqlDataSource1.SelectCommand="SELECT * FROM customers WHERE cust_membership LIKE '%" + tx3.Text.Trim(' ') + "%'";break;
        }
        
        gv1.Visible = true;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content213" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder01" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">
    <asp:textbox ID="tx1" runat="server" />
    <asp:button ID="bt1" runat="server" Text="search by ID" OnClick="findCustomer" CommandName="ID" /><br/>
    <asp:textbox ID="tx2" runat="server" />
    <asp:button ID="bt2" runat="server" Text="search by Name" OnClick="findCustomer" CommandName="Name" /><br/>
    <asp:textbox ID="tx3" runat="server" />
    <asp:button ID="bt3" runat="server" Text="search by Membership" OnClick="findCustomer" CommandName="Membership" /><br/>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [customers]">

</asp:SqlDataSource>

    <asp:gridview ID="gv1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" Visible="false" >
        <columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="cust_name" HeaderText="Name" />
            <asp:BoundField DataField="cust_gender" HeaderText="Gender" />
            <asp:BoundField DataField="cust_age" HeaderText="Age" />
            <asp:BoundField DataField="cust_email" HeaderText="Email" />
        </columns>
    </asp:gridview>


</asp:Content>

