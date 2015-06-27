using System.ServiceModel;
using System.ServiceModel.Web;

namespace OmnilexService
{
    [ServiceContract]
    public interface IDefinitionService
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/{from}/{to}/{word}")]
        string GetString(string from, string to, string word);
    }
}
