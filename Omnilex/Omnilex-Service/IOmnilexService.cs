using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace OmnilexService
{
    [ServiceContract]
    public interface IOmnilexService
    {
        [OperationContract]
        [WebGet(ResponseFormat=WebMessageFormat.Json)]
        IList<string> GetString();
    }
}
