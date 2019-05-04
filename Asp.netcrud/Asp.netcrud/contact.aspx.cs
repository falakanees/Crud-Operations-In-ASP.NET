using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Asp.netcrud
{
    public partial class contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@" Data Source=faculty-37;Initial Catalog=AspCrud;User ID=sa;Password=aptech");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Button2.Enabled = false;
                datafill();
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void clear()
        {
            HiddenField1.Value = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Button1.Text = "Save";
            Button2.Enabled = false;
            Label4.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                //ContactCreateOrUpdate is the name of procedure in database which we have made for insert and update
                SqlCommand cmd = new SqlCommand("ContactCreateOrUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //@contactId,@Name,@Mobile,@Address are the names of stored procedure's variable names
                cmd.Parameters.AddWithValue("@ContactID", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox3.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                string contactId = HiddenField1.Value;
                clear();
                if (contactId == "")
                {
                    Label4.Text = "Saved Successfully";
                    datafill();
                }
                else
                {
                    Label4.Text = "Updated Successfully";
                    datafill();                   
                }
            }
        }
        void datafill()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                //ContactView is the name of procedure in database for view all records
                SqlDataAdapter adapter = new SqlDataAdapter("ContactView", con);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable tbl = new DataTable();
                adapter.Fill(tbl);
                con.Close();
                GridView1.DataSource = tbl;
                GridView1.DataBind();
            }
        }
        protected void link_btnclick(object sender, EventArgs e)
        {
            int contactId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                //ContactviewbyId is the name of procedure in database for viewing contact by specific id
                SqlDataAdapter adapter = new SqlDataAdapter("ContactviewbyId", con);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //@ContactID is the name of the procedure cantactviewbyid variable's name
                //contactId is the above int contactId
                adapter.SelectCommand.Parameters.AddWithValue("@ContactID", contactId);
                DataTable tbl = new DataTable();
                adapter.Fill(tbl);
                con.Close();
                HiddenField1.Value = contactId.ToString();
                //rows[][these are column names of database table]
                TextBox1.Text = tbl.Rows[0]["Name"].ToString();
                TextBox2.Text = tbl.Rows[0]["Mobile"].ToString();
                TextBox3.Text = tbl.Rows[0]["Address"].ToString();
                Button1.Text = "Update";
                Button2.Enabled = true;

            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ContactdeletebyId", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ContactID", Convert.ToInt32(HiddenField1.Value));
                cmd.ExecuteNonQuery();
                con.Close();
                clear();
                datafill();
                Label4.Text = "Deleted Successfully";
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SearchById", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ContactID", TextBox4.Text.Trim());                  
                     SqlDataReader dr = cmd.ExecuteReader();
                    //DataTable dt = new DataTable();
                    if (dr.HasRows)
                    {
                          //dt.Load(dr);
                        GridView1.DataSource = dr;
                        GridView1.DataBind();
                    }
                    else
                    {
                     
                        Response.Write("<script>alert('No Data With This Id Present In DataBase');</script>");
                    }  
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
           
        }
    }
}