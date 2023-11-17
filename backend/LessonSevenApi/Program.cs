using App.Home.Apis;
using App.Patients.Apis;
using App.Posts.Apis;

var builder = WebApplication.CreateBuilder(args);
{
builder.Services.AddAuthorization();
}
var app = builder.Build();
{
    app.ConfigureHomeEndPoints();
    app.ConfigurePatientsEndPoints();
    app.ConfigurePostsEndPoints();
    app.Run();
}