using Microsoft.AspNetCore.Mvc;

namespace IBook.API.Controllers
{
    [Route("api/home")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        [HttpGet]
        public string Test()
        {
            return "teste develop";
        }
    }
}
