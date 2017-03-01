using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DevTest.Startup))]
namespace DevTest
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //ConfigureAuth(app);
            app.MapSignalR();
        }
    }
}
