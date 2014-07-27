using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace OmnilexService
{
    public class OmnilexService : IOmnilexService
    {
        public string DoWork()
        {
            return "Testing...";
        }
    }
}
