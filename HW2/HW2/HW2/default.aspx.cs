using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ListItem[] availableCourses = buildAvailableCourseList();
            lbxAvailableClasses.DataSource = availableCourses;
            lbxAvailableClasses.DataTextField = "Text";
            lbxAvailableClasses.DataValueField = "Value";
            lbxAvailableClasses.DataBind();
        }
    }
    private ListItem[] buildAvailableCourseList()
    {
        ListItem[] tempList =
        {
            new ListItem("CS 1301-4", "CS 1301-4"),
            new ListItem("CS 1302-4", "CS 1302-4"),
            new ListItem("CS 1303-4", "CS 1303-4"),
            new ListItem("CS 2202-2", "CS 2202-2"),
            new ListItem("CS 2224-2", "CS 2224-2"),
            new ListItem("CS 3300-3", "CS 3300-3"),
            new ListItem("CS 3301-1", "CS 3301-1"),
            new ListItem("CS 3302-1", "CS 3302-1"),
            new ListItem("CS 3340-3", "CS 3340-3"),
            new ListItem("CS 4321-3", "CS 4321-3"),
            new ListItem("CS 4322-3", "CS 4322-3"),
        };
        return tempList;

    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        String addClass = "CS " + lbxClass.Text;
        String addCredits = "-" + lbxCredits.Text;
        String addAvailable = addClass + addCredits;

        double hours = HoursRegisteredFor(0);
        double extra = ExtraCost();
        double extraCost = extra;
        lblCost.Text = Convert.ToString("$" + extraCost);

        for (int i = lbxAvailableClasses.Items.Count - 1; i >= 0; i--)
        {
            if (lbxAvailableClasses.Items[i].Selected)
            {
                ListItem addClasses = lbxAvailableClasses.Items[i];

                if (!lbxRegisteredClasses.Items.Contains(lbxAvailableClasses.Items[i]))
                {
                    lbxRegisteredClasses.Items.Add(addClasses);
                    lbxAvailableClasses.Items.Remove(addClasses);

                    hours = HoursRegisteredFor(0);
                    lblHours.Text = hours.ToString();
                    double cost = hours * 100;
                    lblCost.Text = Convert.ToString("$" + cost);


                    Label3.Visible = false;
                    
                    if (hours > 19)
                    {
                        Label1.Visible = true;
                    }
                    else if (hours <= 19)
                    {
                        Label1.Visible = false;
                    }
                }
                
                else if (lbxRegisteredClasses.Items.Contains(lbxAvailableClasses.Items[i]))
                {
                    Label3.Visible = true;
                    break;
                }
            }
        }
    }
    protected void RemoveButton_Click(object sender, EventArgs e)
    {
        int removeHours = 0;
        for (int i = lbxRegisteredClasses.Items.Count - 1; i >= 0; i--)
        {
            if (lbxRegisteredClasses.Items[i].Selected)
            {
                String[] removeArray = lbxRegisteredClasses.Items[i].Value.Split('-');
                removeHours += Convert.ToInt32(removeArray[1]);

                ListItem removeClasses = lbxRegisteredClasses.Items[i];
                lbxAvailableClasses.Items.Add(removeClasses);
                lbxRegisteredClasses.Items.Remove(removeClasses);
            }
        }
        double hours = Convert.ToInt32(lblHours.Text) - removeHours;
        lblHours.Text = hours.ToString();
        double cost = 100 * hours + ExtraCost();
        lblCost.Text = Convert.ToString("$" + cost);
        if (hours > 19)
        {
            Label1.Visible = true;
        }
        else if (hours <= 19)
        {
            Label1.Visible = false;
        }

    }
    protected void ResetButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    public double HoursRegisteredFor(int sum)
    {
        sum = 0;
        for (int i = lbxRegisteredClasses.Items.Count - 1; i >= 0; i--)
        {
            String[] addArray = (lbxRegisteredClasses.Items[i].Value.Split('-'));
            sum += Convert.ToInt32(addArray[1]);

        }
        for (int i = lbxAvailableClasses.Items.Count - 1; i >= 0; i--)
        {
            if (lbxAvailableClasses.Items[i].Selected)
            {
                String[] addArray = (lbxAvailableClasses.Items[i].Value.Split('-'));
                sum += Convert.ToInt32(addArray[1]);
            }
        }
        return sum;
    }

    public double ExtraCost()
    {
        double totalCost = 0;

        for (int i = 0; i < lbxCheckBox.Items.Count; i++)
        {
            if (lbxCheckBox.Items[i].Selected)
            {
                totalCost += Convert.ToInt32(lbxCheckBox.Items[i].Value);
            }
        }
        return totalCost;
    }
    protected void MakeAvailable_Click(object sender, EventArgs e)
    {
        String addClass = "CS " + lbxClass.Text;
        String addCredits = "-" + lbxCredits.Text;
        String addAvailable = addClass + addCredits;

        for (int i = lbxAvailableClasses.Items.Count - 1; i >= 0; i--)
        {
            String[] duplicateArray = lbxAvailableClasses.Items[i].Value.Split('-');
            String duplicate = duplicateArray[0];

            if (duplicate.Contains(addClass))
            {
                Label2.Visible = true;
                break;
            }
            else if (!duplicate.Contains(addClass))
            {
                Label2.Visible = false;
                lbxAvailableClasses.Items.Add(addAvailable);
                break;
            }
        }
    }
    protected void RemoveFromAvailable_Click(object sender, EventArgs e)
    {
        String removeAvailable = "CS " + lbxClass.Text + "-" + lbxCredits.Text;
        lbxAvailableClasses.Items.Remove(removeAvailable);
    }
}