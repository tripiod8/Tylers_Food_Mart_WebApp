using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Tylers_Food_Mart_WebApp.Data;

public class ApplicationDbContext : IdentityDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<Supplier>? Suppliers { get; set; }

    public class Supplier
    {
        public int SupplierID  {get; set; }
        public string Company { get; set; }
        public string? LastName { get; set; }
        public string FirstName { get; set; }
        public string? BusinessPhone { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? SupplierImage { get; set; }
    }
}
