using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Tylers_Food_Mart_WebApp.Data;
using Microsoft.AspNetCore.Identity;


namespace Tylers_Food_Mart_WebApp.Pages
{
    [Authorize(Roles = "Employee")]
    public class ShoppingCartModel : PageModel
    {
        private readonly ILogger<ShoppingCartModel> _logger;
        private readonly ApplicationDbContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public ShoppingCartModel(ILogger<ShoppingCartModel> logger, ApplicationDbContext context, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
        }

        public IList<ApplicationDbContext.Product> _AllProducts { get; set; }
        public List<ApplicationDbContext.Product> _CookieProducts = new List<ApplicationDbContext.Product>();
        public List<int> _CartQty = new List<int>();
        public IList<ApplicationDbContext.Product> _AllProductsPost { get; set; }
        public List<ApplicationDbContext.Product> _CookieProductsPost = new List<ApplicationDbContext.Product>();
        public List<int> _CartQtyPost = new List<int>();
        public List<decimal> _Subtotal = new List<decimal>();
        public bool _cartEmpty { get; set; } 

        public async Task<IActionResult> OnGetAsync()
        {
            _AllProducts = await _context.Products.ToListAsync();
            foreach (var item in _AllProducts)
            {
                if(HttpContext.Request.Cookies[item.ProductName.Replace(" ", "_")] != null)
                {
                    _CookieProducts.Add(item);
                    _CartQty.Add(Int32.Parse(HttpContext.Request.Cookies[item.ProductName.Replace(" ", "_")]));
                    int w = Int32.Parse(HttpContext.Request.Cookies[item.ProductName.Replace(" ", "_")]);
                    decimal x = w * item.StandardCost.GetValueOrDefault();
                    _Subtotal.Add(x);
                }
                if(_CookieProducts.Count() > 0)
                {
                    _cartEmpty = false;
                }
                else
                {
                    _cartEmpty = true;
                }
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            _AllProductsPost = await _context.Products.ToListAsync();
            foreach (var item in _AllProductsPost)
            {
                if(Request.Form[item.ProductCode] == item.ProductCode)
                {
                    
                    _context.Products.Where((p) => p.ProductCode.Equals(item.ProductCode)).First().AvailableQty += Int32.Parse((Request.Form[$"{item.ProductCode}Qty"]));
                    _context.Products.Where((p) => p.ProductCode.Equals(item.ProductCode)).First().ReorderLevel -= Int32.Parse((Request.Form[$"{item.ProductCode}Qty"]));
                    HttpContext.Response.Cookies.Delete(item.ProductName.Replace(" ", "_"));
                }
            }
            await _context.SaveChangesAsync();
            return RedirectToPage("./ShoppingCart");
        }

        public async Task<IActionResult> OnPostDeleteAsync()
        {
            string pn = Request.Form["productName"].ToString().Replace(" ", "_");
            HttpContext.Response.Cookies.Delete(pn);
            return RedirectToPage("./ShoppingCart");
        }
    }
}
