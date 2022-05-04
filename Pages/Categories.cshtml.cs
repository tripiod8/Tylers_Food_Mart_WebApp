using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Tylers_Food_Mart_WebApp.Data;


namespace Tylers_Food_Mart_WebApp.Pages
{
    [Authorize(Roles = "Employee")]
    public class CategoriesModel : PageModel
    {
        private readonly ILogger<CategoriesModel> _logger;
        private readonly ApplicationDbContext _context;
        public CategoriesModel(ILogger<CategoriesModel> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public string something = "jhrfcjhftjhfg";
        public IList<ApplicationDbContext.Category>? _Categories { get; set; }

        public async Task OnGetAsync()
        {
            _Categories = await _context.Categories.ToListAsync();
        }
    }
}
