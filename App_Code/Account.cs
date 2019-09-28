using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Account
/// </summary>
public class Account
{
    private double balance;
    public Account(double balance)
    {
        this.balance = balance;
    }
    public double Balance
    {
        get
        {
            return balance;
        }
        set
        {
            if (value >= 0.0)
                balance = value;
            else
                balance = 0.0;
        }
    }
    public override string ToString()
    {
        return "Bal=" + Balance.ToString("C");
    }
}