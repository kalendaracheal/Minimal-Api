using System.Text.Json;

namespace App.Home.Apis;

public static class HomeEndPoints
{
    public static void ConfigureHomeEndPoints(this WebApplication app)
    {
        app.MapGet(pattern: "/", handler: () => "Welcome back to Home page");
        
    }



}