using Microsoft.AspNet.SignalR;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Hosting;
using Owin;
using RattleModels;
using System;
using System.Threading.Tasks;
using Microsoft.Owin.Host.SystemWeb;
using Microsoft.Owin.Host.HttpListener;
using Microsoft.Owin.Hosting.Builder;

namespace RattleNotifications
{
    class Program
    {
        static void Main(string[] args)
        {
            string url = "http://localhost:16221";
            using (WebApp.Start(url))
            {
                Console.WriteLine("Server running on {0}", url);
                Console.ReadLine();
            }


        }
    }
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCors(CorsOptions.AllowAll);
            
            app.MapSignalR("/signalr", new HubConfiguration
            {
                EnableDetailedErrors = true,
                EnableJavaScriptProxies = true
            });
            Console.WriteLine("Started SignalR");
        }
    }
    public class NotificationsHub : Hub
    {
        public override Task OnConnected()
        {
            Console.WriteLine("Client has connected");
            return base.OnConnected();
        }
        public void PushMessage(NotificationMessage message)
        {
            Clients.All.notify(message);
        }


        public void Send(string name, string message)
        {
            Clients.All.addMessage(name, message);
        }
    }
}
