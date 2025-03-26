using management_system_backend_api.Database.SqlConnectionPlace;
using management_system_backend_api.Repo.Interface;
using management_system_backend_api.Repo.Repository;
using management_system_backend_api.Services;
using management_system_backend_api.Services.emailservice;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("Database");

//Register a Jwt validation
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(
                    options =>
                    {
                        options.TokenValidationParameters = new TokenValidationParameters
                        {
                            ValidateIssuer = true,
                            ValidateAudience = true,
                            ValidateLifetime = true,
                            ValidateIssuerSigningKey = true,

                            ValidIssuer = builder.Configuration["JWT : issuer"],
                            ValidAudience = builder.Configuration["JWT : audience"],
                            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:secretKey"]))

                        };
                    }
                    
                );

//Add Repository for Container
builder.Services.AddScoped<IAuthRepository,AuthRepository>();

//Add Service for Container
builder.Services.AddTransient<IEmailSenderService, EmailSenderService>();
builder.Services.AddTransient<JwtService>();

//Add Sql Connection for Container
builder.Services.AddScoped<SqlConnectionFactory>();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Add Cors
builder.Services.AddCors(
        options =>
        {
            options.AddPolicy(
                    "ManagementCors",
                    policy =>
                    {
                        policy.WithOrigins("http://localhost:3000")
                              .AllowAnyHeader()
                              .AllowAnyMethod();
                    }
                );
        }
    );

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
// use the cors
app.UseCors("ManagementCors");

//use the authenticate
app.UseAuthentication();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
