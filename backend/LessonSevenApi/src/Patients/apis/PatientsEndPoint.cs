using System.Text.Json;

namespace App.Patients.Apis;

public static class PatientsEndPoints
{
    public static void ConfigurePatientsEndPoints(this WebApplication app)
    {
        app.MapGet(pattern: "/", handler: () => "Welcome back to Patients page");
        app.MapGet(pattern: "/patients", handler: GetPatients);
        
    }

    internal static IResult GetPatients()
    {
        var patients = new[] {
            new {
                FirstName = "Rach",
                LastName = "Kals",
                Age = 7
            },
            new {
                FirstName = "Jolly",
                LastName = "Leti",
                Age = 74
            },
            new {
                FirstName = "Oge",
                LastName = "Joy",
                Age = 27
            },
            new {
                FirstName = "Ayo",
                LastName = "Wendy",
                Age = 90
            },
        };

        // var results = JsonSerializer.Serialize(patients);
        // return Results.Ok("Yes Patients are retrieved");
        return Results.Ok(patients);
    }

}