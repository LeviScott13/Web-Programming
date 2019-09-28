using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    List<Customer> customer = new List<Customer>();
    protected void Page_Load(object sender, EventArgs e)
    {
        //First time on page
        if (!Page.IsPostBack)
        {

        }
        else if (Page.IsPostBack)
        {
            if (Session["AvailableSeats"] != null)
            {
                List<String> seatLeft = (List<String>)Session["AvailableSeats"];

                /*for (int i = 0; i <= seatLeft.Count; i++)
                {
                    seatLeft[i] = ;

                }*/
                lbxSeats.DataSource = seatLeft;
                lbxSeats.DataBind();
                lblTicketsAvailable.Text = seatLeft.Count.ToString();
                txtEventName.Text = (String)Session["Event"];
            }
        }
    }

    protected void btnMakeEvent_Click1(object sender, EventArgs e)
    {
        int firstSeat = Convert.ToInt32(txtFirstSeat.Text);
        int lastSeat = Convert.ToInt32(txtLastSeat.Text);
    
        int ticketCount = 1;
        for (int i = firstSeat; i < lastSeat; i++)
        {
            ticketCount++;
        }
        lblTicketsAvailable.Text = Convert.ToString(ticketCount);

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
        int ticketPrice = Convert.ToInt32(txtAge.Text);
        int total = 0;
        if (ticketPrice > 12)
        {
            ticketPrice = 10;
            total += ticketPrice;

        }
        else
        {
            ticketPrice = 5;
            total += ticketPrice;
        }
        Session["TotalPrice"] = total;

        String pae = Convert.ToString(txtCustomerName.Text);
        int personAge = Convert.ToInt32(txtAge.Text);
        int seatNumber = 0;
        for (int i = lbxSeats.Items.Count - 1; i >= 0; i--)
        {
            if (lbxSeats.Items[i].Selected)
            {
                seatNumber = Convert.ToInt32(lbxSeats.Items[i].ToString());
            }
        }
        Customer thisPerson = new Customer(pae, personAge, seatNumber, ticketPrice);
        customer.Add(thisPerson);
        Session.Add("customer", customer);

        int removeTicket = Convert.ToInt32(lblTicketsAvailable.Text);
        int count = 0;
        for (int i = lbxSeats.Items.Count - 1; i >= 0; i--)
        {
            ListItem seatNum = lbxSeats.Items[i];

            if (lbxSeats.Items.Contains(seatNum))
            {

                if (lbxSeats.Items[i].Selected)
                {
                    removeTicket--;
                    count++;
                    int average = total / count;
                    Session["TicketsSold"] = count;
                    Session["AverageCost"] = average;
                    lbxSeats.Items.Remove(seatNum);
                    lblTicketsAvailable.Text = Convert.ToString(removeTicket);
                    Session["TicketsAvailable"] = lblTicketsAvailable.Text;
                }
            }
            else if (!lbxSeats.Items.Contains(seatNum))
            {
                lblSeatNA.Visible = true;
            }

            else
            {
                lblSeatNA.Visible = false;
            }
            if (removeTicket == 0)
            {
                lblSoldOut.Visible = true;
                break;
            }
            
        }
        int input = 0;
        for (int i = 0; i < lbxSeats.Items.Count - 1; i++)
        {
            input++;
        }
        int[] seatNa = new int[input];
        int x = 0;
        String a = "";
        for(int i = 0; i < lbxSeats.Items.Count - 1; i++)
        {
            a = lbxSeats.Items[i].ToString();
            seatNa[x] = Convert.ToInt32(a);
            x++;
        }
        //this gives the wrong number out. FIND OUT WHY
        Session["AvailableSeats"] = seatNa;
    }
    protected void btnEventSummary_Click(object sender, EventArgs e)
    {
        Session["EventName"] = txtEventName.Text;
        Response.Redirect("EventSummary.aspx");
    }

}