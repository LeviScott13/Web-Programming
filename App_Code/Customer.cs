using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MyEvents
/// </summary>
public class Customer
{
    public String names
    {
        get;
        set;
    }
    public int seat
    {
        get;
        set;
    }
    public int age
    {
        get;
        set;
    }
    public int ticketPrice
    {
        get;
        set;
    }
    public Customer(String names, int seat, int age, int ticketPrice)
    {
        this.names = names;
        this.seat = seat;
        this.age = age;
        this.ticketPrice = ticketPrice;
    }
    public String Names
    {
        get {
            return names;
        }
        set {
            this.names = value; }
    }
    /*public int CompareTo(object obj)
    {
        return ToString().CompareTo(names.ToString());
    }*/
    public override string ToString()
    {
        String summary = String.Format("{0, -18} {1, -5} {2, -3} {3, -10}", names, seat, age, "$" + ticketPrice + ".00");
        return summary;
    }
}