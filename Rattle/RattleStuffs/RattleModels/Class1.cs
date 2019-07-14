using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RattleModels
{
    public class NotificationMessage
    {
        public int UserId { get; set; }
        public object Message { get; set; }
        public int ApplicationId { get; set; }
        public string Locator
        {
            get
            {
                return $"{ApplicationId}_{UserId}";
            }
        }
    }
}
