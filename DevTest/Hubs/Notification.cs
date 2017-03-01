using DevTest.Respository;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TableDependency.Mappers;
using TableDependency.SqlClient;
using TableDependency.EventArgs;
using System.Configuration;
using TableDependency.Enums;

namespace DevTest.Hubs
{
    [HubName("notificationHUB")]
    public class Notification:Hub
    {
        
        private static SqlTableDependency<DevTest> _tableDependency;
        
        private void PushNotificationAdd(DevTest DT)
        {
            Clients.All.addLatestNotification(DT);
        }
        private void PushNotificationDelete(DevTest DT)
        {
            Clients.All.deleteLatestNotification(DT);
        }
        private void PushNotificationUpdate(DevTest DT)
        {
            Clients.All.updateLatestNotification(DT);
        }
        public override System.Threading.Tasks.Task OnConnected()
        {
            NotificationConnect(Clients);
            return base.OnConnected();

        }
        private void NotificationConnect(IHubConnectionContext<dynamic> clients)
        {
           // Clients = clients; 

            var mapper = new ModelToTableMapper<DevTest>();
            mapper.AddMapping(s => s.ID, "ID");

            _tableDependency = new SqlTableDependency<DevTest>(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString,
                "DevTest",
                mapper);

            _tableDependency.OnChanged += SqlTableDependency_Changed;
            _tableDependency.OnError += SqlTableDependency_OnError;
            _tableDependency.Start();
        }

        private void SqlTableDependency_OnError(object sender, ErrorEventArgs e)
        {
             throw e.Error;
        }

        private void SqlTableDependency_Changed(object sender, RecordChangedEventArgs<DevTest> e)
        {
            if (e.ChangeType == ChangeType.Insert)
            {
                PushNotificationAdd(e.Entity);
            }
            if (e.ChangeType == ChangeType.Delete)
            {
                PushNotificationDelete(e.Entity);
            }
            if (e.ChangeType == ChangeType.Update)
            {
                PushNotificationUpdate(e.Entity);
            }
        }
    }
}
