using management_system_backend_api.Models.Auth;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace management_system_backend_api.Services
{
    public class JwtService
    {
        private readonly IConfiguration _configuration;  

        
        public JwtService(IConfiguration configuration)
        {
            _configuration = configuration;
        }


        public String GenerateJwtToken(RegisterDTO model)
        {

            // Get the secret key, issuer, and audience from appsettings.json
            var secretKey = _configuration["JWT:secretKey"];
            var issuer = _configuration["JWT:Issuer"];
            var audience = _configuration["JWT:Audience"];

            //jwt body (PAYLOAD:DATA)
            var claims = new[]
            {
                new Claim("id", model.id.ToString()), // Fixed the missing closing parenthesis
                new Claim("userName", model.userName),
                new Claim("password", model.password)
            };


            //jwt secret key (VERIFY SIGNATURE)
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            //jwt header (HEADER:ALGORITHM & TOKEN TYPE)
            var signingCredentials = new SigningCredentials(securityKey,SecurityAlgorithms.HmacSha256);


            // Now combine above three into single that makes jwt security token
            var AuthToken = new JwtSecurityToken(
                issuer: issuer,  
                audience: audience,  
                expires: DateTime.Now.AddMinutes(30),  
                signingCredentials: signingCredentials,
                claims: claims
            );

            return new JwtSecurityTokenHandler().WriteToken(AuthToken);

        }
    }
}
