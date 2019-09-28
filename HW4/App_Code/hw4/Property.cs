namespace hw4
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;

    
    public class Property
    {
        public double listPrice{
            get;
            set;
        }

        public double sqFeet{
            get;
            set;
        }

        public double beds{
            get;
            set;
        }

        public double baths{
            get;
            set;
        }

        public double yearBuilt{
            get;
            set;
        }

        public double sqPerFoot{
            get;
            set;
        }
        public Property(double listPrice, double sqFeet, double beds, double baths, double yearBuilt, double sqPerFoot)
        {
            // asaf
            // TODO: Add constructor logic here
            //
            this.listPrice = listPrice;
            this.sqFeet = sqFeet;
            this.beds = beds;
            this.baths = baths;
            this.yearBuilt = yearBuilt;
            this.sqPerFoot = sqPerFoot;
        }

        public override string ToString()
        {
            String msg = String.Format("{0}     {1}   {2}     {3}    {4}     {5}", listPrice, sqFeet, beds, baths, yearBuilt, sqPerFoot);
            return msg;
        }
    }
}