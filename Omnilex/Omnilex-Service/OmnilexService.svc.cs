using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;

namespace OmnilexService
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class OmnilexService : IOmnilexService
    {
        public IList<string> GetString()
        {
            IList<string> list = new List<string> ( ) { "Hello", "Test", "World" };

            return list;
        }
    }
}
