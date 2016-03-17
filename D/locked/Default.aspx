<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<%@ Page Title="" Language="C#" %>

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
    newMsg.Subject = tx1.Text;
    newMsg.Body = tx2.Text;
    
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



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" method="post" runat="server">
            <table>
        <tr><td><asp:label id="lblMail" runat="server" Text="this is a test!" /></td></tr>
        <tr><td>
    Subject<br/>
    <asp:textbox ID="tx1" runat="server" />
    </td><td>
    Content<br/>
    <asp:textbox ID="tx2" runat="server" />
    </td><asp:button ID="bt1" runat="server" OnClick="SendEmail" Text="Send Emails" /><td>    
    </td></tr></table><br/>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT * FROM [customers]"></asp:SqlDataSource>
    
    <asp:gridview ID="gv1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false">
        <columns>
            <asp:boundfield DataField="cust_name" HeaderText="Name" />
            <asp:boundfield DataField="cust_email" HeaderText="Email" />
            <asp:TemplateField HeaderText="Select" >
                <ItemTemplate>
                     <asp:checkbox ID="chkEmail" runat="server"/>
                  </ItemTemplate>
            </asp:TemplateField>
        </columns>
    </asp:gridview>

    </form>
</body>
</html>
