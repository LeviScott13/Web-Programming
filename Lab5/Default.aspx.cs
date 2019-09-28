using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lab5_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbxNames1_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
        progress1.Visible = true;

        if (lbxNames1.Items.Count > 0)
        {
            lbxNames2.Items.Add(lbxNames1.SelectedItem.ToString());
            lbxNames1.Items.Remove(lbxNames1.SelectedItem);
        }
        lbxNames1.SelectedIndex = -1;
    }
    protected void lbxNames2_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
        if (lbxNames2.Items.Count > 0)
        {
            lbxNames1.Items.Add(lbxNames2.SelectedItem.ToString());
            lbxNames2.Items.Remove(lbxNames2.SelectedItem);
        }
        lbxNames2.SelectedIndex = -1;
    }

    protected void btnMoveFirst_Click(object sender, EventArgs e)
    {
        lbxNames2.Items.Add(lbxNames1.Items[0]);
        lbxNames1.Items.Remove(lbxNames1.Items[0]);
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToLongTimeString();
    }
}