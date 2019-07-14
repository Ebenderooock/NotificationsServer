using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace RattleNotifications.Api
{
    [RoutePrefix("Ping")]
    public class PingController : ApiController
    {
        [Route("/")]
        public string Ping()
        {
            return "Pong";
        }
    }
}
