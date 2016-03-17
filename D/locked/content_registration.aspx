<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" StylesheetTheme="SkinFilecalendar1" %>

<script runat="server">

    void click(object sender, EventArgs e)
    {
        if (ckState1.Checked != ckState2.Checked)
        {
            panel1.Visible = true;
            
        }
        String checkbox = "";
        if (ckState1.Checked == false)
            checkbox = ckState2.Text;
        else
            checkbox = ckState1.Text;
        
        lb1.Text = listboxmember.SelectedItem.Text;
        lb2.Text = txAge.Text;
        lb3.Text = checkbox;
        lb4.Text = ddlCity.SelectedItem.Text;
        lb5.Text = txEmail.Text;
        lb6.Text = rbl1.SelectedItem.Text;
        lb7.Text = txPassword.Text;
        lb8.Text = txCMPassword.Text;
        lbUserName.Text = txUserName.Text;
        lbName.Text = txName.Text;
        if (panel1.Visible == true)
        {
            SqlDataSource1.InsertParameters[0].DefaultValue = txAge.Text;
            SqlDataSource1.InsertParameters[1].DefaultValue = listboxmember.SelectedItem.Text;
            SqlDataSource1.InsertParameters[2].DefaultValue = checkbox;
            SqlDataSource1.InsertParameters[3].DefaultValue = ddlCity.SelectedItem.Text;
            SqlDataSource1.InsertParameters[4].DefaultValue = rbl1.SelectedItem.Text;
            SqlDataSource1.InsertParameters[5].DefaultValue = txEmail.Text;
            SqlDataSource1.InsertParameters[6].DefaultValue = txPassword.Text;
            SqlDataSource1.InsertParameters[8].DefaultValue = txUserName.Text;
            SqlDataSource1.InsertParameters[9].DefaultValue = txName.Text;
            SqlDataSource1.Insert();
        }
    }



    protected void vldckState1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (((ckState1.Checked == true) && (ckState2.Checked == true)) || ((ckState1.Checked == false) && (ckState2.Checked == false)))
        {
            args.IsValid = false;
            ckState1.Checked = false;
            ckState2.Checked = false;
        }

        else
        {
            args.IsValid = true;
        }
            
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content213" ContentPlaceHolderID="content213" runat="server">
    <asp:Calendar ID="calendar1" runat="server" SkinID="calendarView" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder02" Runat="Server">
    <table>
        <tr>
            <td>UserName</td>
            <td>Name</td>
        </tr>
        <tr>
            <td>
                <asp:textbox ID="txUserName" runat="server" />
                <asp:requiredfieldvalidator ID="vldUserName" runat="server" ErrorMessage="User name cannot be blank!" ControlToValidate="txUserName" />
            </td>
            <td>
                <asp:textbox ID="txName" runat="server" />
                <asp:requiredfieldvalidator ID="vldName" runat="server" ErrorMessage="Name cannot be blank!" ControlToValidate="txName" />
            </td>
        </tr>
        <tr>
            <td>Membership Level</td>
            <td>Age</td>
        </tr>
        <tr>
            <td>
                <asp:listbox ID="listboxmember" runat="server">
                <asp:listitem>Gold</asp:listitem>
                <asp:listitem>Silver</asp:listitem>
                <asp:listitem>Brown</asp:listitem>
                </asp:listbox>
                <asp:requiredfieldvalidator ID="vldMember" runat="server" ErrorMessage="This box shouldn't be blank!" ControlToValidate="listboxmember" />
            </td>
            <td>
                <asp:textbox ID="txAge" runat="server" />
                <asp:requiredfieldvalidator ID="vldAge1" runat="server" ErrorMessage="This box shouldn't be blank!" ControlToValidate="txAge" />
                <asp:rangevalidator ID="vldAge2" runat="server" ErrorMessage="Your age should be between 0 to 150" ControlToValidate="txAge" Type="Integer" MinimumValue="0" MaximumValue="150" />
            </td>
        </tr>
        <tr>
            <td>
                State
            </td>
            <td>
                City
            </td>
        </tr>
        <tr>
            <td>
                <asp:checkbox ID="ckState1" runat="server" Text="Victory" /><br />
                <asp:checkbox ID="ckState2" runat="server" Text="New South Whale" />
                <asp:customvalidator ID="vldckState1" runat="server" ErrorMessage="Please choose one state!" OnServerValidate="vldckState1_ServerValidate"/>
            </td>
            <td>
                <asp:dropdownlist ID="ddlCity" runat="server">
                    <asp:listitem>Melbourne</asp:listitem>
                    <asp:listitem>Sydney</asp:listitem>
                    <asp:listitem>Adelaide</asp:listitem>
                </asp:dropdownlist>
                <asp:RequiredFieldValidator ID="vldCity1" runat="server" ErrorMessage="This box cannot be blank!" ControlToValidate="ddlCity" />
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>Gender</td>
        </tr>
        <tr>
            <td>
                <asp:textbox ID="txEmail" runat="server" />
                <asp:RequiredFieldValidator ID="vldEmail1" runat="server" ErrorMessage="This box cannot be blank!" ControlToValidate="txEmail" />
                <asp:RegularExpressionValidator ID="vldEmail2" runat="server" ErrorMessage="Please check your Email address!" ControlToValidate="txEmail" ValidationExpression=".*@.*\..*" />
            </td>
            <td>
                <asp:radiobuttonlist ID="rbl1" runat="server">
                <asp:listitem Selected="True">Male</asp:listitem>
                <asp:listitem>Female</asp:listitem>
                </asp:radiobuttonlist>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>Confirm your password</td>
        </tr>
        <tr>
            <td>
                <asp:textbox ID="txPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="vldPassword1" runat="server" ErrorMessage="This box cannot be blank!" ControlToValidate="txPassword" />
                <asp:comparevalidator ID="vldPassword2" runat="server" ErrorMessage="These two passwords do not match!" ControlToValidate="txPassword" ControlToCompare="txCMPassword" />
            </td>
            <td>
                <asp:textbox ID="txCMPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="vldCMPassword1" runat="server" ErrorMessage="This box cannot be blank!" ControlToValidate="txCMPassword" />
            </td>
        </tr>
        <tr>
            <td><asp:button ID="bt1" runat="server" Text="submit" OnClick="click" /><br /></td>
        </tr>
    </table>
    
    <asp:panel ID="panel1" runat="server" Visible="false">
        <table class="table">
        <tr>
            <td>User Name</td>
            <td>Name</td>
        </tr>
        <tr>
            <td><asp:label ID="lbUserName" runat="server" /></td>
            <td><asp:label ID="lbName" runat="server" /></td>
        </tr>
        <tr>
            <td>Membership Level</td>
            <td>Age</td>
        </tr>
        <tr>
            <td>
                <asp:label ID="lb1" runat="server" Text="abc" />
            </td>
            <td>
                <asp:label ID="lb2" runat="server" Text="abc" />
            </td>
        </tr>
        <tr>
            <td>
                State
            </td>
            <td>
                City
            </td>
        </tr>
        <tr>
            <td>
                <asp:label ID="lb3" runat="server" Text="abc" />
            </td>
            <td>
                <asp:label ID="lb4" runat="server" Text="abc" />
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>Gender</td>
        </tr>
        <tr>
            <td>
                <asp:label ID="lb5" runat="server" />
            </td>
            <td>
                <asp:label ID="lb6" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>Confirm your password</td>
        </tr>
        <tr>
            <td>
                <asp:label ID="lb7" runat="server" />
            </td>
            <td>
                <asp:label ID="lb8" runat="server" />
            </td>
        </tr>
    </table>

    </asp:panel>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [customers]" DeleteCommand="DELETE FROM [customers] WHERE [ID] = ?" InsertCommand="INSERT INTO [customers] ([cust_age], [cust_membership], [cust_state], [cust_city], [cust_gender], [cust_email], [cust_password], [cust_checked], [cust_username], [cust_name]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [customers] SET [cust_age] = ?, [cust_membership] = ?, [cust_state] = ?, [cust_city] = ?, [cust_gender] = ?, [cust_email] = ?, [cust_password] = ?, [cust_checked] = ?, [cust_username] = ?, [cust_name] = ? WHERE [ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="cust_age" Type="Int32" />
            <asp:Parameter Name="cust_membership" Type="String" />
            <asp:Parameter Name="cust_state" Type="String" />
            <asp:Parameter Name="cust_city" Type="String" />
            <asp:Parameter Name="cust_gender" Type="String" />
            <asp:Parameter Name="cust_email" Type="String" />
            <asp:Parameter Name="cust_password" Type="String" />
            <asp:Parameter Name="cust_checked" Type="Boolean" />
            <asp:Parameter Name="cust_username" Type="String" />
            <asp:Parameter Name="cust_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cust_age" Type="Int32" />
            <asp:Parameter Name="cust_membership" Type="String" />
            <asp:Parameter Name="cust_state" Type="String" />
            <asp:Parameter Name="cust_city" Type="String" />
            <asp:Parameter Name="cust_gender" Type="String" />
            <asp:Parameter Name="cust_email" Type="String" />
            <asp:Parameter Name="cust_password" Type="String" />
            <asp:Parameter Name="cust_checked" Type="Boolean" />
            <asp:Parameter Name="cust_username" Type="String" />
            <asp:Parameter Name="cust_name" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HyperLink ID="hl1" runat="server" Text="Click here to see all the customers" NavigateUrl="~/showall.aspx" /><br/>
    <asp:HyperLink ID="hl2" runat="server" Text="Click here to search a customer" NavigateUrl="~/select.aspx" />
</asp:Content>

