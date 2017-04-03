using System.Linq;
using NewsSite.Models.Membership;

namespace NewsSite.Service.AccountServices
{
    public class UserInfoCrudService : CrudService<UserInfo>
    {
        public UserInfoCrudService()
        {
            Table = db.UserInfoes;
        }

        public override UserInfo GetObjectById(int id)
        {
            return Table.Single(n => n.UserId == id);
        }

        public void AddUserInfo(int id, string email)
        {
            var user = new UserInfo {UserId = id, Email = email};
            SaveObject(user);
        }
    }
}