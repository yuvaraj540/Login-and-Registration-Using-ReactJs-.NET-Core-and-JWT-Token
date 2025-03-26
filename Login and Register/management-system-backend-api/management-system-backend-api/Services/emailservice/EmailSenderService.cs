using MailKit.Net.Smtp;
using management_system_backend_api.Models.Auth;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using MimeKit;


namespace management_system_backend_api.Services.emailservice
{
    public class EmailSenderService : IEmailSenderService
    {
        
        public Task<bool> SendEmail(emailInfo model)
        {
            var htmlbody = File.ReadAllText("C:\\Users\\yuvarajan\\Documents\\Yuva\\management-system-backend-api\\management-system-backend-api\\Views\\registerOtpEmail.cshtml");
            htmlbody = htmlbody.Replace("#000000#", model.otp.ToString())
                               .Replace("#userName#", model.username)
                               .Replace("#email#", model.email);


            //Create a Object for Mailkit Package
            MimeMessage email = new MimeMessage();

            //Use it to snd a message info like from,to,subject
            //email.From.Add(MailboxAddress.Parse("yuvarajdeveloper499@gmail.com"));
            //email.To.Add(MailboxAddress.Parse(model.toemail));
        
            MailboxAddress from_email = new MailboxAddress("Management CEO", "yuvarajdeveloper499@gmail.com");
            email.From.Add(from_email);

            MailboxAddress to_email = new MailboxAddress(model.username, model.email);
            email.To.Add(to_email);

            email.Subject = "Welcome to Management System";

            //Send a Html Designed Email via email vody
            BodyBuilder bodyBuilder = new BodyBuilder { HtmlBody = htmlbody};
            email.Body = bodyBuilder.ToMessageBody();

            using (SmtpClient emailserver = new SmtpClient())
            {
                emailserver.Connect("smtp.gmail.com",587,MailKit.Security.SecureSocketOptions.StartTls);
                emailserver.Authenticate("yuvarajdeveloper499@gmail.com", "bthy paaw lcss dnof");
                emailserver.Send(email);
                emailserver.Disconnect(true);
                emailserver.Dispose();
            }

            return Task.FromResult(true);
        }
    }
}
