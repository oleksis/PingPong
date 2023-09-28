using Microsoft.AspNetCore.Mvc;

namespace PingPongApi.Controllers;

[ApiController]
[Route("[controller]")]
public class PingController : ControllerBase
{
    [HttpGet]
    public string Get()
    {
        return "Pong";
    }
}

