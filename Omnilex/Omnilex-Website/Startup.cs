using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OmnilexWebsite.Startup))]
namespace OmnilexWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
