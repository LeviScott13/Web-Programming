using hw4;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    // Set database type. If working on campus use:
    string dbType = "SQL_Server";
    // Open App_Code/hw4/ConnectionFactory.cs and examine the GetCommand method.
    // Open Web.config and examine the connectionStrings node.

    // If working from home, use:
    //String dbType = "Access_Players";

    protected void Page_Load(object sender, EventArgs e)
    {
        // These three lines of code are correct and do not need modifying.
        // You will write the referenced methods below.
        List<Property> props = getPropertyList(dbType);
        displayPropertStats(props);
        displayProperties(props);
    }

    private List<Property> getPropertyList(string dbType)
    {
        List<Property> listProperty = new List<Property>();
        IDbCommand cmd = ConnectionFactory.GetCommand(dbType);
        cmd.CommandText = getSQL();
        //txtProperties.Text += cmd.CommandText;
        try
        {
            cmd.Connection.Open();
            IDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                double listPrice = dr.GetDouble(0);
                int sqFeet = Convert.ToInt16(dr.GetDouble(1));
                int beds = Convert.ToInt16(dr.GetDouble(2));
                int baths = Convert.ToInt16(dr.GetDouble(3));
                int yearBuilt = Convert.ToInt16(dr.GetDouble(4));
                double sqPerFoot = Math.Round(listPrice / sqFeet, 2);
                listProperty.Add(new Property (listPrice, sqFeet, beds, baths, yearBuilt, sqPerFoot));
            
            }
            dr.Close();
            cmd.Connection.Close();
            return listProperty;
        
         
        }
        catch (Exception ex)
        {
            txtMsg.Text = "\r\nError reading data\r\n";
            txtMsg.Text += ex.ToString();
            return null;
        }
    }

    private static string getSQL()
    {
        
        String sql = 
                      "SELECT " +
                      "Properties.ListPrice, " +
                      "Properties.SqFeet, " +
                      "Properties.Beds, " +
                      "Properties.Baths, " +
                      "Properties.YearBuilt " +
                      "FROM " +
                      "Properties " +
                      "ORDER BY " +
                      "Properties.ListPrice Asc";
        return sql;
    }

    private void displayPropertStats(List<Property> props)
    {


            lblNumProperties.Text = props.Count.ToString();
            double totalPrice = 0;
            foreach (Property item in props)
        {
            totalPrice += item.listPrice;
        }
            double avgPrice = Math.Round(totalPrice / props.Count,2);
            lblAveragePrice.Text = avgPrice.ToString();

            int numAboveAvgPrice = 0;
            foreach (Property item in props)
        {
                if (item.listPrice > avgPrice)
                    numAboveAvgPrice++;
        }
        lblNumAboveAvgPrice.Text = numAboveAvgPrice.ToString();
    }

    private void displayProperties(List<Property> props)
    {
        

        // txtProperties.Text = ...
        if (props != null)
        {
            foreach (Property item in props)
            {
                txtProperties.Text += item.ToString() + Environment.NewLine;
            }
        }
    }
    protected void rblSortType_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Implement this if you can. It will require some changes to the code above and
        // some refactoring.
    }
}