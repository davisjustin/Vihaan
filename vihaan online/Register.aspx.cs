using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace vihaan_online
{
    public partial class register : System.Web.UI.Page
    {
        String Name, Email, Ph, Department, College, Year;
        bool Acco, Workshop;
        SqlConnection sqlCon;

        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void bReg_Click(object sender, EventArgs e)
        {
            //Local DB
            //String conStr = "Data Source=.\\SQLEXPRESS;Initial Catalog=vihaan;User Id=sa;Password=sqlserver";
            //Online DB
            String conStr = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BBD1D_vihaan;User Id=DB_9BBD1D_vihaan_admin;Password=vihaanreg";

            
            if (getEntry_and_Check_nonDB() == "OK")
            {
                try
                {
                    sqlCon = new SqlConnection(conStr);
                    sqlCon.Open();

                    if (checkEmail() == "OK")
                    {
                        if (enterData() == "OK")
                        {
                            errMsg.Text = "You have been successfuly registered";
                            errMsg.ForeColor = System.Drawing.Color.RoyalBlue;
                        }
                        else { errMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#C03055"); }
                    }
                    else { errMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#C03055"); }
                }
                catch { errMsg.Text = "Cannot connect to server, please try again"; }
                finally { sqlCon.Close(); }
            }
            else { errMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#C03055"); }

        }

        ///////////////////////////////////////////////    << Space for sub functions>>   /////////////////////////////

        // gets the India Standard Time
        private DateTime getIST()
        {
            DateTime nowUTC = DateTime.UtcNow;
            TimeZoneInfo infoIST = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime nowIST = TimeZoneInfo.ConvertTime(nowUTC, infoIST);
            return nowIST;
        }

        //gets data from the page and performs nonDB validation
        private string getEntry_and_Check_nonDB()
        {
            Name = tbName.Text;
            Email = tbEmail.Text;
            Ph = tbPh.Text;
            Department = tbDept.Text;
            College = tbCollege.Text;

            Acco = cbAcco.Checked;
            Workshop = cbWork.Checked;

            Year = rblYear.SelectedValue;

            if (Year == "") return errMsg.Text = "Please select the year";
            if (Name == "") return errMsg.Text = "Please fill in the Name field";
            if (Email == "") return errMsg.Text = "Please fill in the Email field";
            if (College == "") return errMsg.Text = "Please fill in the College feild";

            return "OK";
        }

        //checks if the Email is already registered (DB)
        private string checkEmail()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            //set string
            String cmdStr = "select Email from registry where Email like '" + Email + "'; ";

            using (SqlCommand emailCmd = new SqlCommand(cmdStr, sqlCon))
            {
                da.SelectCommand = emailCmd;
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count == 0)
                { ds.Dispose(); da.Dispose(); return "OK"; }
                else
                { ds.Dispose(); da.Dispose(); return errMsg.Text = "This email is already registered"; }
            }
        }

        //Gets the new RegID and Performs data entry (DB)
        private string enterData()
        {
            //SQL vars
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            //other vars
            DateTime nowIST = getIST();
            int RegID;

            try
            {
                using (SqlCommand getIdCmd = new SqlCommand("Select max(RegID) from [dbo].[registry];", sqlCon))
                {
                    adapter.SelectCommand = getIdCmd;
                    adapter.Fill(ds);

                    //if there is no entry in the table at all, the reg id is set as 1
                    if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "") { RegID = 1; }
                    else { RegID = 1 + int.Parse(ds.Tables[0].Rows[0].ItemArray[0].ToString()); }
                }

                ds.Dispose();
                adapter.Dispose();

                String ins = "insert into [dbo].[registry] (RegID, Name, Email, Ph, Department, College, Year, Accomodation, Workshop, DnT_IST) "
                                                    + "values ('" + RegID + "', '" + Name + "', '" + Email + "', '" + Ph + "', '" + Department + "', '" + College + "', '" + Year + "', '" + (Acco ? "yes" : "no") + "', '" + (Workshop ? "yes" : "no") + "', '" + nowIST + "');";
                using (SqlCommand insertCmd = new SqlCommand(ins, sqlCon))
                {
                    try { insertCmd.ExecuteNonQuery(); }
                    catch (SqlException e) { return errMsg.Text = /*"ins=>" + e.Message; */"Server error, please try again after some time"; }
                }
            }
            catch (SqlException ee) { return errMsg.Text = /*"get=>" + ee.Message;*/ "Server error, please try again after some time"; }
            return "OK";
        }
    }
}