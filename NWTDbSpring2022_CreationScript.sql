USE [master]
GO
/****** Object:  Database NWTDbFinalProjSpring2022    ******/
CREATE DATABASE NWTDbFinalProjSpring2022
GO


USE NWTDbFinalProjSpring2022
GO

CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(100,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpID] [char](36) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[JobTitle] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[CreditCard] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransactions]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransactions](
	[TransactionID] [int] IDENTITY(700,1) NOT NULL,
	[TransactionType] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseOrderID] [int] NULL,
	[CustomerOrderID] [int] NULL,
	[Comments] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_InventoryTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(100,1) NOT NULL,
	[ProductCode] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NOT NULL,
	[ReorderLevel] [int] NULL,
	[TargetLevel] [int] NULL,
	[Discontinued] [bit] NOT NULL,
	[SupplierID] [int] NULL,
	[AvailableQty] [int] NULL,
	[Reordered] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[OrderDetailID] [int] IDENTITY(600,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[PostedToInventory] [bit] NULL,
	[InventoryID] [int] NULL,
 CONSTRAINT [PK_PurchaseOrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrders]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[PurchaseOrderID] [int] IDENTITY(500,1) NOT NULL,
	[CreationDate] [datetime2](7) NULL,
	[StatusID] [int] NULL,
	[ExpectedDate] [datetime2](7) NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [datetime2](7) NULL,
	[EmpID] [char](36) NOT NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [char](36) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[StandardCost] [money] NOT NULL,
	[QuantityToOrder] [int] NOT NULL,
	[Subtotal]  AS ([QuantityToOrder]*[StandardCost]),
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(300,1) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[BusinessPhone] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (100, N'Beverages')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (101, N'Canned Fruit & Vegetables')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (102, N'Dried Fruit')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (103, N'Condiments')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (104, N'Soups')
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[Employees] ([EmpID], [Username], [JobTitle], [Address], [City], [State], [Country], [CreditCard]) VALUES (N'1532895E-5901-4F90-BB9B-97DA7CF93081', N'user1', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([EmpID], [Username], [JobTitle], [Address], [City], [State], [Country], [CreditCard]) VALUES (N'3604207C-66DB-4CDC-BE8A-543DC38B5236', N'user2', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (103, N'NWTB-87', N'Northwind Traders Tea', N'none', 100, 2.0000, 4.0000, 20, 50, 0, 300, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (104, N'NWTB-81', N'Northwind Traders Green Tea', N'none', 100, 2.0000, 2.9900, 100, 125, 0, 300, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (105, N'NWTB-43', N'Northwind Traders Coffee', N'none', 100, 25.0000, 35.0000, 15, 100, 0, 305, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (106, N'NWTB-34', N'Northwind Traders Beer', N'none', 100, 11.0000, 16.0000, 10, 50, 0, 305, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (107, N'NWTB-1', N'Northwind Traders Chai', N'none', 100, 12.0000, 14.0000, 10, 40, 0, 304, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (108, N'NWTCF-94', N'Northwind Traders Peas', N'none', 101, 1.0000, 1.5000, 10, 40, 0, 304, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (110, N'NWTCF-92', N'Northwind Traders Green Beans', N'none', 101, 1.0000, 1.2000, 10, 40, 0, 304, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (111, N'NWTCF-89', N'Northwind Traders  Peaches', N'none', 101, 1.0000, 1.5000, 10, 40, 0, 302, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (112, N'NWTCF-90', N'Northwind Traders Pineapple', N'none', 101, 1.0000, 1.8000, 101, 40, 0, 302, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (113, N'NWTCF-88', N'Northwind Traders Pears', N'none', 101, 1.0000, 1.3000, 10, 40, 0, 303, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (114, N'NWTDF-80', N'Northwind Traders Dried Plums', N'none', 102, 3.0000, 3.5000, 50, 75, 0, 304, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (115, N'NWTDF-74', N'Northwind Traders Almonds', N'none', 102, 7.5000, 10.0000, 10, 50, 0, 301, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (116, N'NWTDF-51', N'Northwind Traders Dried Apples', N'none', 102, 15.0000, 19.0000, 10, 40, 0, 301, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (117, N'NWTDF-14', N'Northwind Traders Walnuts', N'none', 102, 22.0000, 30.0000, 30, 100, 0, 303, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (118, N'NWTDF-7', N'Northwind Traders Dreid Pears', N'none', 102, 25.0000, 30.0000, 30, 100, 0, 304, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (119, N'NWTCO-77', N'Northwind Traders Mustard', N'none', 103, 16.5000, 20.0000, 15, 60, 0, 301, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (120, N'NWTCO-4', N'Northwind Traders Cajun Seasoning', N'none', 103, 20.0000, 30.0000, 15, 60, 0, 301, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (121, N'NWTCO-3', N'Northwind Traders Syrup', N'none', 103, 15.0000, 20.0000, 15, 100, 0, 304, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (122, N'NWTSO-99', N'Northwind Traders Chicken Soup', N'none', 104, 1.9500, 3.0000, 100, 300, 0, 305, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (123, N'NWTSO-98', N'Northwind Traders Vegetable Soup', N'none', 104, 5.5000, 8.0000, 10, 100, 0, 302, 5, 0)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [StandardCost], [ListPrice], [ReorderLevel], [TargetLevel], [Discontinued], [SupplierID], [AvailableQty], [Reordered]) VALUES (124, N'NWTSO-41', N'Northwind Traders Clam Chowder', N'none', 104, 10.0000, 15.0000, 40, 100, 0, 303, 5, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [Company], [LastName], [FirstName], [BusinessPhone], [City], [State]) VALUES (300, N'Supplier A', N'Anderson', N'Elizabeth', NULL, N'Pittsburgh', N'PA')
INSERT [dbo].[Suppliers] ([SupplierID], [Company], [LastName], [FirstName], [BusinessPhone], [City], [State]) VALUES (301, N'Supplier B', N'Weiler', N'Cornelia', NULL, N'Washington', N'DC')
INSERT [dbo].[Suppliers] ([SupplierID], [Company], [LastName], [FirstName], [BusinessPhone], [City], [State]) VALUES (302, N'Supplier C', N'Glasson', N'Stuart', NULL, N'Houston', N'TX')
INSERT [dbo].[Suppliers] ([SupplierID], [Company], [LastName], [FirstName], [BusinessPhone], [City], [State]) VALUES (303, N'Supplier D', N'Sandberg', N'Mikael', NULL, N'Dallas', N'TX')
INSERT [dbo].[Suppliers] ([SupplierID], [Company], [LastName], [FirstName], [BusinessPhone], [City], [State]) VALUES (304, N'Supplier E', N'Sousa', N'Luis', NULL, N'Savannah', N'GA')
INSERT [dbo].[Suppliers] ([SupplierID], [Company], [LastName], [FirstName], [BusinessPhone], [City], [State]) VALUES (305, N'Supplier F', N'Dunton', N'Bryan', NULL, N'Austin', N'TX')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
ALTER TABLE [dbo].[InventoryTransactions] ADD  CONSTRAINT [DF_InventoryTransactions_TransactionType]  DEFAULT ((1)) FOR [TransactionType]
GO
ALTER TABLE [dbo].[InventoryTransactions] ADD  CONSTRAINT [DF_InventoryTransactions_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Reordered]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] ADD  CONSTRAINT [DF_PurchaseOrderDetails_PostedToInventory]  DEFAULT ((0)) FOR [PostedToInventory]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT ((0)) FOR [StatusID]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT (getdate()+(5)) FOR [ExpectedDate]
GO
ALTER TABLE [dbo].[InventoryTransactions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransactions_PurchaseOrders] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[InventoryTransactions] CHECK CONSTRAINT [FK_InventoryTransactions_PurchaseOrders]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_Products]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_PurchaseOrder]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Products]
GO
/****** Object:  StoredProcedure [dbo].[spAddPurchaseOrderDetail]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[spAddPurchaseOrderDetail]
(@PurchaseOrderID int,
@ProductID int,
@Quantity int,
@UnitCost money, -- should be named ListPrice in table
@OrderDetailID int out)

AS
BEGIN
	Insert into PurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, UnitCost)
	Values (@PurchaseOrderID, @ProductID, @Quantity, @UnitCost);
	
	set @orderDetailID = @@identity;
END

GO
/****** Object:  StoredProcedure [dbo].[spAddToInventory]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAddToInventory]
(@prodid int)
AS

BEGIN

	declare @quantity int
	declare @purchaseorderid int

	select @quantity = quantity, @purchaseorderid = purchaseorderid
	from purchaseorderdetails
	where productid = @prodid

	insert into inventorytransactions (productid, quantity, purchaseorderid, comments)
	values (@prodid, @quantity, @purchaseorderid, 'none')
	
	declare @transactionid int = @@identity


	update PurchaseOrderDetails
	set postedtoinventory = 1, inventoryid = @transactionid
	where ProductID = @prodid

	update products
	set reordered = 0, availableqty = availableqty + @quantity
	where productid = @prodid




END
GO
/****** Object:  StoredProcedure [dbo].[spAddUserInfoToDB]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spAddUserInfoToDB]
@UserName nvarchar(50),
@EmpId char(36)
AS

	insert into Employees(EmpId, Username)
	values (@EmpId, @UserName)
GO
/****** Object:  StoredProcedure [dbo].[spCalcFinalPriceForOrderDetail]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spCalcFinalPriceForOrderDetail]
(@OrderDetailID int)
AS

BEGIN
	Select (quantity * unitcost) 
	from PurchaseOrderDetails
	where OrderDetailID = @OrderDetailID
	
END

GO
/****** Object:  StoredProcedure [dbo].[spCalcOrderTotal]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spCalcOrderTotal]
(@PurchaseOrderID int)

AS
BEGIN

	select sum(Quantity *  UnitCost) from PurchaseOrderDetails
	where purchaseorderID = @PurchaseOrderID

END

GO
/****** Object:  StoredProcedure [dbo].[spCreatePurchaseOrder]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spCreatePurchaseOrder]

(@CartID char(36), @EmpID char(36))

AS
BEGIN
	/* Insert a new record into Orders */
	DECLARE @PurchaseOrderID int
	INSERT INTO PurchaseOrders (EmpID) VALUES (@EmpID)
	
	/* Save the new Order ID */
	SET @PurchaseOrderID = @@IDENTITY
	
	/* Add the order details to OrderDetail */
	INSERT INTO PurchaseOrderDetails
	(PurchaseOrderID, ProductID, ProductName, Quantity, UnitCost)
	
	SELECT
	@PurchaseOrderID, ProductID, ProductName, QuantityToOrder, StandardCost
	FROM ShoppingCart
	WHERE CartID = @CartID

	/* Clear the shopping cart */
	DELETE FROM ShoppingCart
	WHERE CartID = @CartID

	

END



GO
/****** Object:  StoredProcedure [dbo].[spDeletePurchaseOrderDetail]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spDeletePurchaseOrderDetail]
(@OrderDetailID int)
AS

BEGIN
	Delete from PurchaseOrderDetails
	where OrderDetailID = @OrderDetailID

END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllCategories]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spGetAllCategories]
as
begin 
	select categoryID, CategoryName
	from category
end

GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeID]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetEmployeeID]
		@UserName nvarchar(50),
		@EmpID nvarchar output
		AS

			select @EmpID = EmpID from Employees
			where username = @UserName
GO
/****** Object:  StoredProcedure [dbo].[spGetProductsByCategoryID]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetProductsByCategoryID]
( @categoryID int )
as

begin
	select p.productID, name, 
	case 
		when len(description) <= 60 then description
		else SUBSTRING(description, 1, 60) + '...'
	end as description,
	price, thumbnail, image, promofront, promodept
	from products P inner join ProductCategory PC
	on P.productID = PC.ProductID
	where categoryid = @categoryID

end

GO





/****** Object:  StoredProcedure [dbo].[spShoppingCartAdditem]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spShoppingCartAdditem]
(@cartid char(36),
@prodid int
)
AS

BEGIN

	if Not exists
	(Select Cartid from shoppingcart 
	where cartid=@cartid and productid=@prodid)
	
	begin
			declare @productname nvarchar(100)
			declare @standardcost money
			declare @quantitytoorder int

			Select @productname = productname, @standardcost = standardcost,
			@quantitytoorder = targetlevel - availableqty
			from products 
			where productid = @prodid

			insert into shoppingcart (cartID, ProductID, ProductName, StandardCost, QuantityToOrder)
			values(@cartID, @prodID, @productname, @standardcost, @quantitytoorder)

			Update Products
			set Reordered = 1
			where productid = @prodid
	end

END

GO


-- adding supplier image to supplier tables
alter table suppliers
add SupplierImage nvarchar(50)
go

update suppliers
set supplierImage = 'SupplierImage.jpg'
go


USE [master]
GO
ALTER DATABASE NWTDbFinalProjSpring2022 SET  READ_WRITE 
GO
