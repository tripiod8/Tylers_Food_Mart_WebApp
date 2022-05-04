using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;

namespace Tylers_Food_Mart_WebApp.Pages
{
    [Authorize(Roles = "Administrator")]
    public class AdminModel : PageModel
    {
        public void OnGet()
        {
        }
    }
}
