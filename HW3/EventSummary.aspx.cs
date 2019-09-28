using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
public partial class EventSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEventName.Text = Session["EventName"].ToString();

        List<Customer> thisPerson = (List<Customer>)Session["customer"];
        if (thisPerson == null)
        {
            txtSummary.Text = "Error";
        }
        else
        {
            displayCustomer(thisPerson);
        }
    }
    private void displayCustomer(List<Customer> customer)
    {
        StringBuilder buildCustomer = new StringBuilder("");
        String header = String.Format("{0, -15} {1, -6} {2, -5} {3, -10}", "Name", "Seat", "Age", "Price") + Environment.NewLine;
        buildCustomer.Append("--------------- ----- ---- -------");
        buildCustomer.Append(Environment.NewLine);

        ArrayList removeableCustomers = new ArrayList();

        Session["TotalPrice"].ToString();
        foreach (Customer thisPerson in customer)
        {
            buildCustomer.Append(thisPerson.ToString());
            buildCustomer.Append(Environment.NewLine);
            removeableCustomers.Add(thisPerson.Names);
        }
        if (!Page.IsPostBack)
        {
            lbxRemoveCustomer.DataSource = removeableCustomers;
            lbxRemoveCustomer.DataBind();
        }
        int totalCost = (int)Session["TotalPrice"];
        Session["TotalPrice"] = totalCost;
        int ticketsSold = (int)Session["TicketsSold"];
        Session["TicketsSold"] = ticketsSold;
        double average = (double)totalCost / ticketsSold;
        Session["Average"] = average.ToString("#.##");

        buildCustomer.Append("--------------- ----- ---- -------");
        buildCustomer.Append(Environment.NewLine);
        buildCustomer.Append("Tickets Sold:  " + Session["TicketsSold"]);
        buildCustomer.Append(Environment.NewLine);
        buildCustomer.Append("Tickets Available:  " + Session["TicketsAvailable"].ToString());
        buildCustomer.Append(Environment.NewLine);
        buildCustomer.Append("Total Ticket Prices:  " + "$" + Session["TotalPrice"] + ".00");
        buildCustomer.Append(Environment.NewLine);
        buildCustomer.Append("Average Ticket Prices:  " + "$" + Session["Average"]);
        buildCustomer.Append(Environment.NewLine);
        buildCustomer.Append("Available Seats: ");

        List<int> seats = (List<int>)(Session["AvailableSeats"]);
        for (int i = 0; i < seats.Count; i++)
        {
            buildCustomer.Append(seats[i] + ",");
        }
        txtSummary.Text = header + buildCustomer.ToString();
    }
    protected void btnSellTickets_Click(object sender, EventArgs e)
    {
        e = (EventArgs)Session["Event"];
        Response.Redirect("Default.aspx");
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        List<Customer> removePerson = (List<Customer>)Session["customer"];
        List<int> rSeats = (List<int>)Session["AvailableSeats"];

        int totalCost = 0;
        int rIndex = 0;
        foreach (Customer rPerson in removePerson.ToList())
        {
            if (lbxRemoveCustomer.Items[rIndex].Selected)
            {
                totalCost = rPerson.ticketPrice;
                lbxRemoveCustomer.Items.RemoveAt(rIndex);
                rSeats.Add(rPerson.seat);
                break;
            }
            rIndex++;
        }

        Session["TotalPrice"] = (int)Session["TotalPrice"] - totalCost;
        Session["TicketsAvailable"] = Convert.ToInt32(Session["TicketsAvailable"]) + 1;
        Session["TicketsSold"] = Convert.ToInt32(Session["TicketsSold"]) - 1;

        removePerson.RemoveAt(rIndex);
        lbxRemoveCustomer.DataSource = removePerson;
        lbxRemoveCustomer.DataBind();
        Response.Redirect("EventSummary.aspx");
    }
    protected void RBpurchased_CheckedChanged(object sender, EventArgs e)
    {
        List<Customer> thisPerson = (List<Customer>)Session["customer"];

        if (RBpurchased.Checked)
        {
            thisPerson.Sort((x, y) => x.ticketPrice.CompareTo(y.ticketPrice));
        }
    }

    protected void RBname_CheckedChanged(object sender, EventArgs e)
    {
        List<Customer> thisPerson = (List<Customer>)Session["customer"];

        if (RBname.Checked)
        {
            thisPerson.Sort((x, y) => x.names.CompareTo(y.names));
        }
    }

    protected void RBseat_CheckedChanged(object sender, EventArgs e)
    {
        List<Customer> thisPerson = (List<Customer>)Session["customer"];

        if (RBseat.Checked)
        {
            thisPerson.Sort((x, y) => x.seat.CompareTo(y.seat));
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("EventSummary.aspx");
    }
}