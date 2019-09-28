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
    private String names;
    private int age;
    private int seat;
    private int ticket;
    public Customer(String names, int age, int seat, int ticket)
    {
        this.names = names;
        this.age = age;
        this.seat = seat;
        this.ticket = ticket;
    }
}