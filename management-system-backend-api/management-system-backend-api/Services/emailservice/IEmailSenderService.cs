using management_system_backend_api.Models.Auth;

namespace management_system_backend_api.Services.emailservice
{
    public interface IEmailSenderService
    {
        public  Task<bool> SendEmail(emailInfo model);
    }
}
