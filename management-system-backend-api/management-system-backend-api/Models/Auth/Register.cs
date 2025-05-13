namespace management_system_backend_api.Models.Auth
{
    public class Register
    {
        public Guid id { get; set; }
        
        public string? userName { get; set; }

        public string? password { get; set; }

        public string? email { get; set; }

        public string? phoneNumber { get; set; }

        public int otp { get; set; }

        public string? gender { get; set; }

        public DateOnly? dob { get; set; }

        public string? verify { get; set; }

        public Guid createdBy { get; set; }


    }

    public class RegisterDTO
    {
        public Guid id { get; set; }
        public string? userName { get; set; }

        public string? password { get; set; }

        public string? email { get; set; }

        public string? phoneNumber { get; set; }

        public string? gender { get; set; }

        public string? dob { get; set; }
    }

    public class VerifyRegister
    {


        public string? email { get; set; }

        public int otp { get; set; }


    }

    public class emailInfo
    {
        public Guid id { get; set; }

        public string? username { get; set; }

        public string? email { get; set; }

        public int otp { get; set; }

    }

    public class loginDTO 
    {
        public string? userName { get; set; }

        public string? password { get; set; }
    }
}
