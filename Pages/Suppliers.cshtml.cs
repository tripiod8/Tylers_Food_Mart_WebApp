using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Tylers_Food_Mart_WebApp.Data;

namespace Tylers_Food_Mart_WebApp.Pages
{
    [AllowAnonymous]
    public class SuppliersModel : PageModel
    {
        private readonly ILogger<SuppliersModel> _logger;
        private readonly ApplicationDbContext _context;

        public SuppliersModel(ILogger<SuppliersModel> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IList<ApplicationDbContext.Supplier>? _Suppliers { get; set; }
        public async Task OnGetAsync()
        {
            _Suppliers = await _context.Suppliers.ToListAsync();
        }
    }
}
