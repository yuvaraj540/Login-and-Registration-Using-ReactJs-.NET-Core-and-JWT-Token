using management_system_backend_api.Database.SqlConnectionPlace;
using management_system_backend_api.Models.Auth;
using management_system_backend_api.Repo.Interface;
using Microsoft.AspNetCore.Mvc;
using Dapper;
using System.Data;

namespace management_system_backend_api.Repo.Repository
{
    public class AuthRepository : IAuthRepository
    {

        private readonly SqlConnectionFactory _connectionFactory;

        public AuthRepository(SqlConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }
        public async Task<Register?> registerUser(RegisterDTO model)
        {
            var _dbconnection = _connectionFactory.OpenSqlConnection();

            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("@userName", model.userName);
            parameters.Add("@password", model.password);
            parameters.Add("@email", model.email);
            parameters.Add("@phoneNumber", model.phoneNumber);
            parameters.Add("@gender", model.gender);
            parameters.Add("@dob", model.dob);

            var res = await _dbconnection.QuerySingleOrDefaultAsync<Register>("RegisterUser", parameters, commandType: CommandType.StoredProcedure);

            return res;
        }

        public async Task<emailInfo?> GetEmailInfo(emailInfo model)
        {
            var _dbconnection = _connectionFactory.OpenSqlConnection();

            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("@id",model.id);
            parameters.Add("@email",model.email);

            var res = await _dbconnection.QuerySingleOrDefaultAsync<emailInfo>("getemailotp",parameters,commandType : CommandType.StoredProcedure);

            return res;
        }

        public async Task<VerifyRegister?> verifyuser(VerifyRegister model)
        {
            var _dbconnection = _connectionFactory.OpenSqlConnection();

            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("@email", model.email);
            parameters.Add("@otp", model.otp);

            var res = await _dbconnection.QuerySingleOrDefaultAsync<VerifyRegister>("VerifyUser", parameters, commandType: CommandType.StoredProcedure);

            return res;
        }


        public async Task<RegisterDTO?> loginuser(loginDTO model)
        {
            var _dbconnection =_connectionFactory.OpenSqlConnection();

            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("@userName", model.userName);
            parameters.Add("@password",model.password);

            var result = await _dbconnection.QuerySingleOrDefaultAsync<RegisterDTO>("LoginUser",parameters,commandType : CommandType.StoredProcedure);

            return result;
        }
    }
}
