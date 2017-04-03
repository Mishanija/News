using System.Linq;
using NewsSite.Models.Membership;

namespace NewsSite.Service.AccountServices
{
    public class UserCrudService : CrudService<webpages_Membership>
    {
        public UserCrudService()
        {
            Table = db.webpages_Membership;
        }

        public override webpages_Membership GetObjectById(int id)
        {
            return Table.Single(n => n.UserId == id);
        }


        public void DeleteConfirmationToken(string confirmationToken)
        {
            webpages_Membership user = FindUserByConfirmationToken(confirmationToken);
            user.ConfirmationToken = null;
            UpdateObject(user);
        }

        private webpages_Membership FindUserByConfirmationToken(string confirmationToken)
        {
            return (from user in Table where user.ConfirmationToken == confirmationToken select user).First();
        }
    }
}