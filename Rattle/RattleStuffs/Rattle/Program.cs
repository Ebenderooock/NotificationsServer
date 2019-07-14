using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Hangfire;
using Hangfire.MemoryStorage;
using Microsoft.AspNet.SignalR.Client;
using Microsoft.AspNet.SignalR.Client.Transports;
using RattleModels;

namespace Rattle
{
    public class Program
    {
        private static IHubProxy proxy;

        private static HubConnection connection;
        static void Main(string[] args)
        {

            GlobalConfiguration.Configuration.UseStorage<MemoryStorage>(new MemoryStorage(new MemoryStorageOptions
            {

            }));

            EnsureConnection();
            Thread.Sleep(1500);
            PushNotification();
            Hangfire.BackgroundJobServer server = new BackgroundJobServer();
            // RecurringJob.AddOrUpdate("PushNotification", () => PushNotification(), Cron.Minutely());




            string exitCode = "";
            while (exitCode != "exit")
            {
                // Thread.Sleep(5000);
                PushNotification();
                exitCode = Console.ReadLine();
            }



        }
        public static void EnsureConnection()
        {
            if (connection == null)
            {
                connection = new HubConnection("http://localhost:16221");
                connection.Error += Connection_Error;
            }
            if (connection.State == ConnectionState.Disconnected)
            {
                if (proxy == null)
                    proxy = connection.CreateHubProxy("NotificationsHub");
                Task connectionTask = connection.Start(new WebSocketTransport());

                while (!connectionTask.IsCompleted)
                {
                    Thread.Sleep(1500);
                }
            }
        }

        private static void Connection_Error(Exception obj)
        {
            Console.WriteLine("Error connection:", obj.Message);
        }

        public static void PushNotification()
        {
            EnsureConnection();


            Console.WriteLine("Pushing notification");

            proxy.Invoke("PushMessage", new NotificationMessage
            {
                ApplicationId = 1,
                UserId = 1,
                Message = "Hi, welcome to the server"
            }); ;
        }
    }
}
