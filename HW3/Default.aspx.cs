using System;
using System.Text;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    List<Customer> customer = new List<Customer>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["customer"] == null)
        {
            customer = new List<Customer>();
        }
        else
        {
            customer = (List<Customer>)Session["customer"];
        }
        if (Session["EventName"] != null)
        {
            txtEventName.Text = (String)Session["EventName"];
        }
        if (Session["FirstSeat"] != null)
        {
            txtFirstSeat.Text = Session["FirstSeat"].ToString();
        }

        if (Session["LastSeat"] != null)
        {
            txtLastSeat.Text = Session["LastSeat"].ToString();
        }
        
        if (!Page.IsPostBack)
        {
            if (Session["AvailableSeats"] != null)
            {
                List<int> seatsLeft = (List<int>) Session["AvailableSeats"];

                lbxSeats.DataSource = Session["AvailableSeats"];
                lbxSeats.DataBind();
                lblTicketsAvailable.Text = lbxSeats.Items.Count.ToString();
            }
        }
    }
    protected void btnMakeEvent_Click1(object sender, EventArgs e)
    {
        int firstSeat = Convert.ToInt32(txtFirstSeat.Text);//variable to store the first seat
        Session["FirstSeat"] = firstSeat;//Stores first seat in session
        int lastSeat = Convert.ToInt32(txtLastSeat.Text);//variable to store the last seat
        Session["LastSeat"] = lastSeat;//Stores last seat in session

        //Loop to count the number of tickets
        int ticketCount = 1;
        for (int i = firstSeat; i < lastSeat; i++)
        {
            ticketCount++;
        }
        lblTicketsAvailable.Text = Convert.ToString(ticketCount);//initializes how many tickets are available to the label

        int[] seatsAvlb = new int[ticketCount];
        int seatCount = 0;
        for (int i = firstSeat; i <= lastSeat; i++)
        {
            seatsAvlb[seatCount] = i;
            seatCount++;
        }
        lbxSeats.DataSource = seatsAvlb;
        lbxSeats.DataBind();

    }

    protected void btnPurchase_Click(object sender, EventArgs e)
    {
        String pae = Convert.ToString(txtCustomerName.Text); //variable to store the customer name
        int personAge = Convert.ToInt32(txtAge.Text);//variable to store customer age

        int ticketPrice = 0;//variable to update ticket price
        if (personAge <= 12)
        {
            ticketPrice = 5;//if customers is <= 12, ticket price cost $5
        }
        else
        {
            ticketPrice = 10;//if customers is > 12, ticket price cost $10
        }
        if (Session["TotalPrice"] == null)
        {
            Session["TotalPrice"] = ticketPrice;
        }
        else
        {
            Session["TotalPrice"] = (int)Session["TotalPrice"] + ticketPrice;//ticket price put in session
        }

        int seatNumber = 0;//variable to update the selected seat number
        int removeTicket = Convert.ToInt32(lblTicketsAvailable.Text);//variable to update available tickets
        int count = 0;
        for (int i = 0; i < lbxSeats.Items.Count; i++)
        {
            if (lbxSeats.Items[i].Selected)
            {
                seatNumber = Convert.ToInt32(lbxSeats.Items[i].ToString());
                removeTicket--;
                count++;
                lbxSeats.Items.RemoveAt(i);
                lblTicketsAvailable.Text = removeTicket.ToString();

                if(removeTicket > 0)
                {
                    lblSoldOut.Visible = false;
                }
                else
                {
                    lblSoldOut.Visible = true;
                }
            }

            List<int> seatsLeft = new List<int>();
            String seats = " ";
            for (int j = 0; j < lbxSeats.Items.Count; j++)
            {
                seats = lbxSeats.Items[j].ToString();
                seatsLeft.Add(Convert.ToInt32(seats));
            }
            Session["AvailableSeats"] = seatsLeft;
        }
        if (Session["TicketsSold"] == null)
        {
            Session["TicketsSold"] = count;
        }
        else
        {
            Session["TicketsSold"] = (int)Session["TicketsSold"] + count;//ticket price put in session
        }
        Session["TicketsAvailable"] = lblTicketsAvailable.Text;

        Customer thisPerson = new Customer(pae, seatNumber, personAge, ticketPrice);
        customer.Add(thisPerson);
        Session.Add("customer", customer);
    }
    protected void btnEventSummary_Click(object sender, EventArgs e)
    {
        Session["EventName"] = txtEventName.Text; //Name of the event put in session

        Response.Redirect("EventSummary.aspx");//When button is pressed, directs to page2 (EventSummary)
    }
}