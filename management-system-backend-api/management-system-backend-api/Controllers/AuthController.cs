using management_system_backend_api.Models.Auth;
using management_system_backend_api.Repo.Interface;
using management_system_backend_api.Services;
using management_system_backend_api.Services.emailservice;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace management_system_backend_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthRepository _authRepository;
        private readonly IEmailSenderService _emailSenderService;
        private readonly JwtService _jwtService;

        public AuthController(IAuthRepository authRepository,IEmailSenderService emailSenderService,JwtService jwtService)
        {
            _authRepository = authRepository;
            _emailSenderService = emailSenderService;
            _jwtService = jwtService;
        }

        //REgister a New User
        [HttpPost]
        [Route("register")]
        public async Task<ActionResult> Register(RegisterDTO model)
        {
            var data = await _authRepository.registerUser(model);
            return Ok(data);
        }

        //After Register,Send a Verufucation mail
        [HttpPost]
        [Route("sendingmail")]
        public async Task<ActionResult> Sendemail(emailInfo model)
        {
            var emaildata = await _authRepository.GetEmailInfo(model);

            if (emaildata == null)
            {
                return NotFound(); // Or handle the null case appropriately
            }

            await _emailSenderService.SendEmail(emaildata);

            return Ok();
        }

        //After Register,Verify a New User
        [HttpPut]
        [Route("verifyuser")]
        public async Task<IActionResult> VerifyUser(VerifyRegister model)
        {
            await _authRepository.verifyuser(model);
            return Ok();
        }

        //Login a user
        [HttpPost("login")]
        public async Task<IActionResult> Login(loginDTO model)
        {
            var res = await _authRepository.loginuser(model);


            if (res != null)
            {
                var Token = _jwtService.GenerateJwtToken(res);

                return Ok(new { Token = Token });
            }

            return Unauthorized("invalid name or password");
        }

    }
}
