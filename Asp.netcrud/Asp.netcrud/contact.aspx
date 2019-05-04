<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Asp.netcrud.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

<%-- 
  The HiddenField control is used to store a value that needs to be persisted across posts to the server,
     but you don't want the control or it's value visible to the user. For example, 
    when editing and updating an employee record, we don't want the user to see the EmployeeId. 
    So, we will store the EmployeeId in a HiddenField, 
    so that it can then be used on the server to update the correct employees record.  
    
     --%>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>

            </td>
            <td colspan="2">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>

            <td>
                <asp:Label ID="Label2" runat="server" Text="Contact"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="120px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>

            </td>
           <td colspan="2">
               <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
               <asp:Button ID="Button2" runat="server" Text="Delete" OnClick="Button2_Click" />
               <asp:Button ID="Button3" runat="server" Text="Clear" OnClick="Button3_Click" />
           </td>
            

        </tr>

        <tr>
            <td></td>
            <td colspan="2" class="auto-style1"><asp:Label ID="Label4" runat="server" ForeColor="Green"></asp:Label></td>
   
        </tr>
       
    </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
<Columns>
    <%--  DataField name must be equal to the name of the cloumns of database table   --%>
    <asp:BoundField DataField="Name" HeaderText="Name" />
     <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
     <asp:BoundField DataField="Address" HeaderText="Address" />
    <asp:TemplateField>
        <ItemTemplate>
            <%-- ContactID is the id of database columns name --%>
            <%--  Eval is used for one way binding - for reading from a database into a UI field. --%>
 <asp:LinkButton runat="server" ID="linkbutton1" CommandArgument='<% #Eval("ContactID") %>' OnClick="link_btnclick">view</asp:LinkButton>
        </ItemTemplate>

    </asp:TemplateField>
</Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <br />
        For Seaching With Specific ID<br />

    </div>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Click here for Searching" />

    </form>
</body>
</html>
