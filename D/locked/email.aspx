<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    
    public void SendEmail(object sender, EventArgs e)
    {
        MailMessage newMsg = new MailMessage();
        
        foreach (GridViewRow gvRow in gv1.Rows)
        {
            CheckBox cb1 = (CheckBox)gvRow.FindControl("chkEmail");
            
            if (cb1 !=null && cb1.Checked)
            {
                newMsg.To.Add(new MailAddress(gvRow.Cells[1].Text, gvRow.Cells[0].Text + " " + gvRow.Cells[0].Text));
            }
        }
    
    newMsg.From = new MailAddress("BillnBen@billnben.com","BillnBen");
    newMsg.Subject = txSubject.Text;
    newMsg.Body = txBody.Text;
    
    try
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.monash.edu.au";
        smtp.Port = 25;
        smtp.Send(newMsg);
        lblMail.Text = "Mail Successfully Sent";
    }
    catch (Exception exc)
    {
        lblMail.Text = exc.Message;
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
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT * FROM [customers]"></asp:SqlDataSource>
    
    <asp:gridview ID="gv1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" AllowSorting="true">
        <columns>
            <asp:boundfield DataField="cust_name" HeaderText="Name" SortExpression="cust_name" />
            <asp:boundfield DataField="cust_email" HeaderText="Email" />
            <asp:TemplateField HeaderText="Select" >
                <ItemTemplate>
                     <asp:checkbox ID="chkEmail" runat="server"/>
                  </ItemTemplate>
            </asp:TemplateField>
        </columns>
    </asp:gridview>
    <asp:label ID="lbSubject" runat="server" Text="Subject:" /><br/>
    <asp:textbox ID="txSubject" runat="server" Columns="40" /><br/>
    <asp:label ID="lbBody" runat="server" Text="Body:" /><br/>
    <asp:textbox ID="txBody" runat="server" Columns="40" TextMode="MultiLine" Rows="6" /><br/>
    <asp:button ID="bt1" runat="server" OnClick="SendEmail" Text="Send Emails" /><br/>
    <asp:label id="lblMail" runat="server" Text="" />
</asp:Content>

