using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    List<Account> accounts = new List<Account>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["accounts"] == null)
        {
            accounts = new List<Account>();
        }
        else
        {
            accounts = (List<Account>)Session["accounts"];
        }
        lblNumAccounts.Text = accounts.Count.ToString();
    }
    private void displayAccounts()
    {
        StringBuilder builder = new StringBuilder();
        foreach (Account a in accounts)
        {
            builder.Append(a.ToString() + Environment.NewLine);
        }
        txtMsg.Text = builder.ToString();
    }

    protected void btnAddAccount_Click(object sender, EventArgs e)
    {
        double bal = Convert.ToDouble(txtBalance.Text);
        Account a = new Account(bal);
        accounts.Add(a);
        displayAccounts();
        txtBalance.Text = "";
        txtBalance.Focus();

        Session.Add("accounts", accounts);

        lblNumAccounts.Text = accounts.Count.ToString();
    }

    protected void btnClearAccounts_Click(object sender, EventArgs e)
    {
        Session.Clear();
        txtMsg.Text = "";
        lblNumAccounts.Text = "0";
    }

    protected void btnSummary_Click(object sender, EventArgs e)
    {
        Response.Redirect("Summary.aspx");
    }
}