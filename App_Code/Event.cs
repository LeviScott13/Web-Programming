using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Event
/// </summary>
public class Event
{
    ArrayList ticket = new ArrayList();
    String eventName;
    int numTickets;
    public Event(String eventName, int numTickets)
    {
        this.eventName = eventName;
        this.numTickets = numTickets;
    }

    public String EventName {
        get;
        set;
    }
    public int NumTickets {
        get;
        set;
    }
    public void Add(int tckt)
    {
        ticket.Add(tckt);
    }
}