using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tylers_Food_Mart_WebApp.Data;

public class ApplicationDbContext : IdentityDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<Supplier>? Suppliers { get; set; }
    public DbSet<Product>? Products { get; set; }
    public DbSet<Category>? Categories { get; set; }
    public DbSet<PurchaseOrder>? PurchaseOrders { get; set; }

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

    public class Product 
    {
        public int ProductID  {get; set; }
        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public int? CategoryID { get; set; }
        public decimal? StandardCost { get; set; }
        public decimal ListPrice { get; set; }
        public int? ReorderLevel { get; set; }
        public int? TargetLevel { get; set; }
        public bool Discontinued { get; set; }
        public int? SupplierID { get; set; }
        public int? AvailableQty { get; set; }
        public bool? Reordered { get; set; }

    }

    [Table("Category")]
    public class Category
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
    }

    public class PurchaseOrder
    {
        public int PurchaseOrderID { get; set; }
        public string EmpID { get; set; }
    }
}
