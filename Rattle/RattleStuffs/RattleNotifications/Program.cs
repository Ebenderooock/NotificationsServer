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
using System.Management.Automation;
using System.Collections.ObjectModel;
using Newtonsoft.Json;
using Hangfire;
using Hangfire.MemoryStorage;

namespace RattleNotifications
{
    class Program
    {
        public static int count = 0;
        public static int[] values = new int[]
        {
            802,10,7,27,33,37,41,51,1277,45,61,55,67,785,997,1108,64,162,81,76,84,89,93,99,106,116,125,122,128,942,1006,1015,1018,1079,131,680,670,143,135,1268,1025,1028,1041,1062,153,149,651,159,820,826,763,167,173,184,180,188,191,207,204,216,1287,210,219,223,595,234,240,247,1301,1316,1031,873,884,904,925,916,850,255,264,261,267,894,271,281,292,289,990,796,809,298,985,1240,908,309,1044,1137,1054,888,318,322,324,328,350,343,1182,1195,1257,1205,1228,1233,1247,1215
        };
        static void Main(string[] args)
        {




            // Invoke-WebRequest -Uri "https://app.sqldbm.com/api/SqlConvert/ToSqlCreate" 
            // -Method "POST" 
            // -Headers @{"cookie"="_ga=GA1.2.1688143627.1563998765; _gid=GA1.2.1650752624.1563998765; _fbp=fb.1.1563998766000.1185458567; ASP.NET_SessionId=b0y3isw1tucinqd3wyfrtieh; ai_user=fco03|2019-07-24T20:11:05.952Z; _gat=1; AWSALB=pn7kCW4YEIM+K5n1NflZSjUt3me99hwOhG4NUz/dd1TWyb9ertNvLLy6Hg1wzrZD6WOh/AEl7+dLmffRir6PEFnSl3TSdwcnozwmjA5lH6XMNuMttyQBhXptUaPF; dbm.auth=1vdMx-jOdfLqru4clbLObL7Ee-FYKeOfcUz9zpAs5DjivGrvNOC161U0D8y6hrDTAk5-ewiGtX3puB4ESvbOVTlvtPKL3ea8aeJEs4k-gp3LGZ0GJgitCXPENyNnY3rFSEyzdPded1zIJdGEB2R6gFta6jWf4g0Veza6QzvL11M6pWWzJwd1W5aIjRmdkb8oVISgmJHnZQCTDQLvdL5IUq-uvDNv0O7I1acBQsq_MSRuu8THyUDNXL6ewo6QJADxzGJtUbsQenXXaRKS174nUwEreuEf2xavdLniTvPt3QSb7XhX0gAcVWvttCMCboqXukZMTtF9gr19EO9wrMULlslYEcFX5TuDKBzGux7hkPD61kFv4C8JIzbayE1VDDT4UZHuuCcUre1hXIRClOKIpvvSNmG852EGCXiZDiI1dSQJsgyN00LGmDOWJdyV9NZFNpgjlWUHYgEaHmxq1gpr3S9lS13H8kDpcFMXXpQ_BzSFGaOwflU5mI5Xvb9fBrVkT4ScoPv97Ytw0DfY; ai_session=8+XhO|1563999068011|1563999166858.835"; "origin"="https://app.sqldbm.com"; "accept-encoding"="gzip, deflate, br"; "accept-language"="en-US,en;q=0.9"; "authorization"="Bearer 8MKt_FqpX7icD7Z-hBQUcezAA0UQ0pvobeP0EK4nvWJDAtVuPAs6X1OA3uHcCbahc-hSss_gACnXy9o_LBPKrgS71khqPrbAEVkQmhRtHf3l8Z7Ljj7c5guzu9jZkr5sQrHHA3mi120jvVcQWFg1cmb0JlPa1tXsI0r3HjHIHMmJeyTwK_jb6YiDsxxqMNHdpsngDUfIqscGVzFtq9AWHB0NBSUFWLBV0gFwW6NgNGNVbwqoFtlplcKXYE1CxFhLnZFIbBKAEuhHon78FClRw_SmB_-UBhZcin5M-uX9LpP-cygMTcc9yRIDYlMLuRg53d5REnW-9dZLa_TTT4olOxwyhTlG1xeWmbwrS81DGYm0nZ_JQSdYd4CUeSjnoJ7imeSH8Kt6gVcNFYjAVhFgHwkd6ikckkB9uSsi5apCiGKBJ65TGvevcUVSzAdSZhUJ5SP1uzIf6KtTv3HkjatGBHlqC14IIPxBVfmk54sA0zmZ0GKVBuFrFiDEuv5Aw_NDQyjwicbV8ZmmSDuN"; "x-requested-with"="XMLHttpRequest"; "request-id"="|+C/kp.Voary"; "request-context"="appId=cid-v1:394bf920-75a3-4d49-8dbc-ddeef856bd3a"; "path"="/api/SqlConvert/ToSqlCreate"; "user-agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36"; "accept"="application/json, text/javascript, */*; q=0.01"; "referer"="https://app.sqldbm.com/SQLServer/Edit/p72351/"; "authority"="app.sqldbm.com"; "scheme"="https"; "method"="POST"} 
            // -ContentType "application/json; charset=UTF-8" 
            // -Body "{`"projectInfo`":{`"name`":`"DbR2 Database Design`",`"dbType`":0,`"dataVersion`":4,`"revName`":`"Initial Revision`",`"projectId`":72351,`"revisionId`":734749,`"revNumber`":21,`"isArchived`":false,`"latestRevNumber`":21,`"shareKey`":`"EjIcX1F1KHO1pdPWZgzKbkGFrngIE8md_DYjF4jNYw0`"},
            // `"filter`":{`"tables`":[744,730,764,748,752,713,721,736,219,502,99,176,132,136,140,557,528,238,463,106,114,109,272,537,544,594,578,574,570,566,358,366,440,477,506,119,125,350,552,519,426,467,700,376,456,523,144,155,169,161,299,511,515,472,641,585,263,335,315,449,326,344,283,291]}}"


            string url = "http://localhost:16221";
            using (WebApp.Start(url))
            {
                Console.WriteLine("Server running on {0}", url);


                for (int i = 0; i < values.Length; i++)
                {
                    int v1 = values[i];
                    int[] vs = new int[1];
                    if (i + 1 >= values.Length)
                    {
                        vs[0] = v1;
                    }
                    else
                    {
                        int v2 = values[i + 1];
                        vs = new int[2];
                        vs[0] = v1;
                        vs[1] = v2;

                        i++;
                    }

                    BackgroundJob.Enqueue(() => ExportSql(vs));
                }
                Console.ReadLine();
            }


        }



        public static void ExportSql(int[] vs)
        {
            using (PowerShell PowerShellInstance = PowerShell.Create())
            {


                // use "AddScript" to add the contents of a script file to the end of the execution pipeline.
                // use "AddCommand" to add individual commands/cmdlets to the end of the execution pipeline.
                PowerShellInstance.AddScript("Invoke-WebRequest -Uri \"https://app.sqldbm.com/api/SqlConvert/ToSqlCreate\" -Method \"POST\" -Headers @{\"cookie\"=\"_ga=GA1.2.1688143627.1563998765; _fbp=fb.1.1563998766000.1185458567; ASP.NET_SessionId=b0y3isw1tucinqd3wyfrtieh; ai_user=fco03|2019-07-24T20:11:05.952Z; _gid=GA1.2.1363239364.1564115804; dbm.auth=ZjUjQDefoo5anXx2iHcWH-0PaXX0v9K6NS51Qgt7aT5OJ5DDIBNfZUOmAXYoj_BkDULWeLsvRPhe85ol7pazahDWYI6TjRVQY6WY17w5LyA7vIStmUQOsom0obf9PNYaBOFekaUgkoI0sGzDEBILVfGL0Q451m_YWL2U6vfI3NjZT4yH7vavBI4NJST-_kIKSZsNGItJoaQrBuybM0cRWXg_K6q8z2x-6E_FcF2NljqRHGte5ND0r3gUDB3T1KUDBtntLypxe2WP_89MscmIEymZXVtZ3-N1vgJbWzrqvQI99RzVJkPQu5vYLOJ-NR_TZSnupV4Fk1uJJ9HDmVDa_yzYp6c7YNIzu_yoB9bsac3OxNyV4wgGx3DTQlvTPIX2wE8nqioLWZaiDaCilXGvxmh9LtS-uGJZ9FvVhRVY1LuVo_nvoFiJCQPrv75mvGEGok51jII82nIM-vlwBK1no3Ja3jCpfgyYEyNIqqyBRZuHCNhVyhm6_DnY5uiYLW_XJHFmTo22dgKaUCB1; ai_session=b5AXB|1564115823348|1564115826315.545; AWSALB=IOEqz3xKVlfK/w8eYl7fq6CufA+pxKxaPnImZ2lFRSzT27L0yS1lypUo3ajeh4Bpyf3z+Qmp8vkIwYh6QXDYfy3fuUbCYPgwzlkwXlI7tXUl5VCt2fVa2VwZR23p; _gat=1\"; \"origin\"=\"https://app.sqldbm.com\"; \"accept-encoding\"=\"gzip, deflate, br\"; \"accept-language\"=\"en-US,en;q=0.9\"; \"authorization\"=\"Bearer Yv_WVK9l4nzgl2ybme85MwEqdWsh5Eu4QLKTe3df4QkOBMoZLaM2rKrg5DLW3ih2GoiC4BKGYcX3C3jVE74p07btCedmzhR6sxRWx03jYNehMOhYtVZTIobbMjt5zw4EevYClG-7oFndk8C1sBJsua5jf9G1AAbDl7ExnHjNkvCQEHXpM6tWKneeAbvVGQ7ph0ftkzU6vtkeo6Vj_kmYPE74MDzWcgJsoHkmMS4jlB1FN6piQmyWYt8vvfuj6OPkeikH5vB79ntMPJbem_A9XMOFpDHxfCKC609CO4zTELhzEMjgMe9WaC5B7BpOTFE9gYKFIqRyNkaw8FSJX9e7XF2Aql7XDkN_WbF34XwWwMfC0H7bKiSR5ctMDN7GAljl3FYDf-C9E2p8nv82Zqs839CJuqT5kzrabRcPRAwbbtsqQJOTySmeo01T2tk3zqzm6iKB797FvGDM04qFWt2mODixJv4PnCSjFsj6kp_Lzh4vq3O60ORDMowD-oSmT2wMJY91UMUfXJlXnOZI\"; \"x-requested-with\"=\"XMLHttpRequest\"; \"request-id\"=\"|6RA8z.nKMjQ\"; \"request-context\"=\"appId=cid-v1:394bf920-75a3-4d49-8dbc-ddeef856bd3a\"; \"path\"=\"/api/SqlConvert/ToSqlCreate\"; \"user-agent\"=\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\"; \"accept\"=\"application/json, text/javascript, */*; q=0.01\"; \"referer\"=\"https://app.sqldbm.com/SQLServer/Edit/p72499/\"; \"authority\"=\"app.sqldbm.com\"; \"scheme\"=\"https\"; \"method\"=\"POST\"} -ContentType \"application/json; charset=UTF-8\" -Body \"{`\"projectInfo`\":{`\"name`\":`\"DbR2 Database`\",`\"dbType`\":0,`\"dataVersion`\":4,`\"revName`\":`\"Initial Revision`\",`\"projectId`\":72499,`\"revisionId`\":740704,`\"revNumber`\":36,`\"isArchived`\":false,`\"latestRevNumber`\":36,`\"shareKey`\":`\"ijMYPhK_1qBLkiVlWJTFkkGFrngIE8md_DYjF4jNYw0`\"},`\"filter`\":{`\"tables`\":[" + string.Join(",", vs) + "]}}\"");
                // invoke execution on the pipeline (collecting output)
                Collection<PSObject> PSOutput = PowerShellInstance.Invoke();

                // loop through each output object item
                foreach (PSObject outputItem in PSOutput)
                {
                    string value = outputItem.ToString();
                    Console.WriteLine(value);
                    System.IO.File.AppendAllText(@"C:\Temp\New folder\export_multithread_2.sql", value.Replace("\\r\\n", "\r\n").Replace("\\n", "\r\n") + "\r\n\r\n");
                    count += vs.Length;
                    Console.WriteLine($"Completed {count} out of {values.Length}");
                }
            }

        }
    }
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCors(CorsOptions.AllowAll);
            GlobalConfiguration.Configuration.UseStorage(new MemoryStorage());
            app.UseHangfireServer();
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
