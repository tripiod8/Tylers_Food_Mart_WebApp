using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Tylers_Food_Mart_WebApp.Data;

namespace Tylers_Food_Mart_WebApp.Pages
{
    [Authorize(Roles = "Employee")]
    public class CategoryProductsModel : PageModel
    {
        private readonly ILogger<CategoryProductsModel> _logger;
        private readonly ApplicationDbContext _context;

        public CategoryProductsModel(ILogger<CategoryProductsModel> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IList<ApplicationDbContext.Product>? _Products { get; set;}
        public ApplicationDbContext.Category? _Category { get; set; }
        public string imageName { get; set; }

        public async Task OnGetAsync(int id)
        {
            _Products = await _context.Products.Where((p) => p.CategoryID.Equals(id)).ToListAsync();
            _Category = await _context.Categories.Where((c) => c.CategoryID.Equals(id)).FirstAsync();
            switch (_Category.CategoryName)
            {   
                case "Beverages":
                    imageName = "beverages.jpg";
                    break;
                case "Canned Fruit & Vegetables":
                    imageName = "vegetables.jpg";
                    break;
                case "Dried Fruit":
                    imageName = "fruits.jpg";
                    break;
                case "Condiments":
                    imageName = "condiments.jpg";
                    break;
                case "Soups":
                    imageName = "Soups.jpg";
                    break;
            }
        }
    }
}
