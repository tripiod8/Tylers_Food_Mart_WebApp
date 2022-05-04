using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Tylers_Food_Mart_WebApp.Data;

namespace Tylers_Food_Mart_WebApp.Pages
{
    [Authorize(Roles = "Employee")]
    public class ProductModel : PageModel
    {
        private readonly ILogger<ProductModel> _logger;
        private readonly ApplicationDbContext _context;

        public ProductModel(ILogger<ProductModel> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public ApplicationDbContext.Product _Product { get; set; }
        public bool _addToCart { get; set; }
        public bool _lowStock { get; set; }
        public int _qtyCart { get; set;} 

        public async Task<IActionResult> OnGetAsync(int id, bool addToCart = false, bool lowStock = false, int qtyCart = 0)
        {
            _addToCart = addToCart;
            _lowStock = lowStock;
            _qtyCart = qtyCart;
            Console.WriteLine(_qtyCart);
            _Product = await _context.Products.Where((p) => p.ProductID.Equals(id)).FirstAsync();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int id)
        {
            string qtyCart = Request.Form["qtyCart"];
            string currentQty = Request.Form["currentQty"];
            string productName = Request.Form["productName"];
            string currentStock = Request.Form["currentStock"];
            int totalQty = Int32.Parse(currentQty) + Int32.Parse(qtyCart);

            if(Int32.Parse(qtyCart) <= Int32.Parse(currentStock))
            {
                HttpContext.Response.Cookies.Append(productName.Replace(" ", "_"), totalQty.ToString());
                await _context.SaveChangesAsync();
                return await this.OnGetAsync(id, true, false, totalQty);
            }
            else 
            {
                return await this.OnGetAsync(id, false, true);
            }
        }
    }
}
