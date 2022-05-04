using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Tylers_Food_Mart_WebApp.Data;

namespace Tylers_Food_Mart_WebApp.Pages
{
    [AllowAnonymous]
    public class SupplierModel : PageModel
    {
        private readonly ILogger<SupplierModel> _logger;
        private readonly ApplicationDbContext _context;

        public SupplierModel(ILogger<SupplierModel> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public string hello = "HHEHELLLOOO";

        public ApplicationDbContext.Supplier? _Supplier { get; set; }

        public async Task OnGetAsync(int id)
        {
            _Supplier = await _context.Suppliers.Where(s => s.SupplierID.Equals(id)).FirstAsync();
            Console.WriteLine(_Supplier);
            
        }
    }
}
