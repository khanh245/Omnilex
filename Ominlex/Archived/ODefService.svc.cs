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
    public class ODefService : IDefinitionService
    {
        public string GetString(string from, string to, string word)
        {
            string result = "Some definition";
            return result;
        }
    }
}
