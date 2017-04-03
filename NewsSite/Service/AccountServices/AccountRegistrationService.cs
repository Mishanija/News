using NewsSite.Models;
using WebMatrix.WebData;

namespace NewsSite.Service.AccountServices
{
    public class AccountRegistrationService
    {
        private readonly UserInfoCrudService _crudUserInfoService = new UserInfoCrudService();

        public void ToRegisterUser(RegisterModel model)
        {
            string confirmationToken = WebSecurity.CreateUserAndAccount(model.UserName, model.Password, null, true);

            new RegistrationEmail(model.Email, model.UserName, model.Password, confirmationToken);

            _crudUserInfoService.AddUserInfo(WebSecurity.GetUserId(model.UserName), model.Email);
        }
    }
}