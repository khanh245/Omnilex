using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Omnilex_Website.Startup))]
namespace Omnilex_Website
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
