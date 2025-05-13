using management_system_backend_api.Models.Auth;
using Microsoft.AspNetCore.Mvc;

namespace management_system_backend_api.Repo.Interface
{
    public interface IAuthRepository
    {
        public Task<Register?> registerUser(RegisterDTO model);

        public Task<emailInfo?> GetEmailInfo(emailInfo model);

        public Task<VerifyRegister?> verifyuser(VerifyRegister model);

        public Task<RegisterDTO?> loginuser(loginDTO model);
    }
}
