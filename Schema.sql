/****** Object:  Table [dbo].[DNNspot_Store_PaymentStatus]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_PaymentStatus](
	[Id] [smallint] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_PaymentProvider]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_PaymentProvider](
	[Id] [smallint] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_PaymentProcessor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_OrderStatus]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_OrderStatus](
	[Id] [smallint] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_DeliveryMethod]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_DeliveryMethod](
	[Id] [smallint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_DeliveryMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Currency]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Currency](
	[Code] [varchar](3) NOT NULL,
	[CultureName] [nvarchar](10) NULL,
	[Description] [varchar](500) NOT NULL,
	[Symbol] [nvarchar](10) NOT NULL,
	[SymbolPosition] [varchar](20) NOT NULL,
	[GroupSeparator] [nvarchar](50) NOT NULL,
	[DecimalSeparator] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_Currency] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_EmailTemplate]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_EmailTemplate](
	[Id] [smallint] NOT NULL,
	[NameKey] [varchar](75) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DefaultSubject] [nvarchar](300) NOT NULL,
	[DefaultBody] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DNNspot_Store_EmailTemplate] ON [dbo].[DNNspot_Store_EmailTemplate] 
(
	[NameKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Store](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PortalId] [int] NOT NULL,
	[Name] [varchar](300) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedByUserId] [int] NULL,
	[StoreGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_Store] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vDNNspot_Store_ShippingRateWeight]    Script Date: 09/14/2010 17:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDNNspot_Store_ShippingRateWeight]
AS
SELECT
method.StoreId
,method.Id as ShippingMethodId
,method.Name as ShippingMethodName
,rate.Id as ShippingRateWeightId
,rate.MinRange
,rate.MaxRange
,rate.ShippingCost
FROM dbo.DNNspot_Store_ShippingMethod method
INNER JOIN dbo.DNNspot_Store_ShippingRate_Weight rate ON method.Id = rate.ShippingMethodId
GO
/****** Object:  Table [dbo].[DNNspot_Store_TaxRegion]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_TaxRegion](
	[StoreId] [int] NOT NULL,
	[CountryCode] [nvarchar](2) NOT NULL,
	[Region] [nvarchar](150) NOT NULL,
	[TaxRate] [decimal](10, 6) NULL,
 CONSTRAINT [PK_DNNspot_Store_RegionTax] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[CountryCode] ASC,
	[Region] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_StoreSetting]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_StoreSetting](
	[StoreId] [int] NOT NULL,
	[Name] [varchar](300) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_StoreSetting] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_StorePaymentProviderSetting]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_StorePaymentProviderSetting](
	[StoreId] [int] NOT NULL,
	[PaymentProviderId] [smallint] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_StorePaymentProcessorSetting] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[PaymentProviderId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_StorePaymentProvider]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_StorePaymentProvider](
	[StoreId] [int] NOT NULL,
	[PaymentProviderId] [smallint] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_StorePaymentProcessor] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[PaymentProviderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_StoreEmailTemplate]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_StoreEmailTemplate](
	[StoreId] [int] NOT NULL,
	[EmailTemplateId] [smallint] NOT NULL,
	[SubjectTemplate] [nvarchar](300) NOT NULL,
	[BodyTemplate] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_StoreEmailTemplate] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[EmailTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Order]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserId] [int] NULL,
	[OrderNumber] [nvarchar](150) NOT NULL,
	[OrderStatusId] [smallint] NOT NULL,
	[PaymentStatusId] [smallint] NOT NULL,
	[CustomerFirstName] [nvarchar](150) NOT NULL,
	[CustomerLastName] [nvarchar](150) NOT NULL,
	[CustomerEmail] [nvarchar](400) NOT NULL,
	[BillAddress1] [nvarchar](150) NOT NULL,
	[BillAddress2] [nvarchar](150) NOT NULL,
	[BillCity] [nvarchar](150) NOT NULL,
	[BillRegion] [nvarchar](150) NOT NULL,
	[BillPostalCode] [nvarchar](20) NOT NULL,
	[BillCountryCode] [nvarchar](2) NOT NULL,
	[BillTelephone] [nvarchar](30) NOT NULL,
	[ShipRecipientName] [nvarchar](150) NOT NULL,
	[ShipRecipientBusinessName] [nvarchar](150) NOT NULL,
	[ShipAddress1] [nvarchar](150) NOT NULL,
	[ShipAddress2] [nvarchar](150) NOT NULL,
	[ShipCity] [nvarchar](150) NOT NULL,
	[ShipRegion] [nvarchar](150) NOT NULL,
	[ShipPostalCode] [nvarchar](50) NOT NULL,
	[ShipCountryCode] [nvarchar](2) NOT NULL,
	[ShipTelephone] [nvarchar](30) NOT NULL,
	[CreditCardType] [varchar](50) NOT NULL,
	[CreditCardNumberLast4] [varchar](4) NOT NULL,
	[CreditCardNumberEncrypted] [nvarchar](500) NOT NULL,
	[CreditCardExpiration] [varchar](10) NOT NULL,
	[CreditCardNameOnCard] [nvarchar](150) NOT NULL,
	[ShippingServiceOption] [nvarchar](100) NULL,
	[SubTotal] [money] NOT NULL,
	[ShippingAmount] [money] NOT NULL,
	[DiscountAmount] [money] NOT NULL,
	[TaxAmount] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedByIP] [varchar](15) NOT NULL,
	[CreatedFromCartId] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ShippingServiceProvider] [nvarchar](200) NOT NULL,
	[ShippingServicePrice] [money] NULL,
	[ShippingServiceTrackingNumber] [nvarchar](200) NOT NULL,
	[ShippingServiceLabelFile] [nvarchar](300) NOT NULL,
	[CustomerNotes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Coupon]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[DescriptionForCustomer] [nvarchar](250) NOT NULL,
	[IsCombinable] [bit] NOT NULL,
	[ValidFromDate] [datetime] NULL,
	[ValidToDate] [datetime] NULL,
	[DiscountType] [varchar](50) NOT NULL,
	[MinOrderAmount] [money] NULL,
	[MaxUsesPerUser] [int] NULL,
	[MaxUsesLifetime] [int] NULL,
	[MaxDiscountAmountPerOrder] [money] NULL,
	[AppliesToProductIds] [varchar](max) NOT NULL,
	[AppliesToShippingRateTypes] [varchar](max) NOT NULL,
	[PercentOff] [decimal](10, 2) NULL,
	[AmountOff] [money] NULL,
 CONSTRAINT [PK_DNNspot_Store_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DNNspot_Store_Coupon] ON [dbo].[DNNspot_Store_Coupon] 
(
	[StoreId] ASC,
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Category]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[NestingLevel] [smallint] NOT NULL,
	[IsDisplayed] [bit] NOT NULL,
	[Slug] [varchar](50) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SeoTitle] [varchar](300) NOT NULL,
	[SeoDescription] [varchar](500) NOT NULL,
	[SeoKeywords] [varchar](500) NOT NULL,
	[SortOrder] [smallint] NOT NULL,
	[IsSystemCategory] [bit] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_DNNspot_Store_Category] UNIQUE NONCLUSTERED 
(
	[StoreId] ASC,
	[Slug] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_DNNspot_Store_Category_1] UNIQUE NONCLUSTERED 
(
	[StoreId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Product]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Slug] [varchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Sku] [nvarchar](50) NOT NULL,
	[SpecialNotes] [nvarchar](500) NOT NULL,
	[Price] [money] NOT NULL,
	[Weight] [decimal](10, 4) NOT NULL,
	[DeliveryMethodId] [smallint] NULL,
	[ShippingAdditionalFeePerItem] [money] NOT NULL,
	[QuantityWidget] [varchar](50) NOT NULL,
	[QuantityOptions] [varchar](2000) NOT NULL,
	[InventoryIsEnabled] [bit] NOT NULL,
	[InventoryAllowNegativeStockLevel] [bit] NOT NULL,
	[InventoryQtyInStock] [int] NULL,
	[InventoryQtyLowThreshold] [int] NULL,
	[DigitalFileDisplayName] [nvarchar](250) NOT NULL,
	[DigitalFilename] [nvarchar](500) NOT NULL,
	[SeoTitle] [varchar](300) NOT NULL,
	[SeoDescription] [varchar](500) NOT NULL,
	[SeoKeywords] [varchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[IsTaxable] [bit] NOT NULL,
	[CheckoutAssignRoleInfoJson] [varchar](max) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_DNNspot_Store_Product_UniqueStoreIdAndName] UNIQUE NONCLUSTERED 
(
	[StoreId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_DNNspot_Store_Product_UniqueStoreIdAndSlug] UNIQUE NONCLUSTERED 
(
	[StoreId] ASC,
	[Slug] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ShippingService]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ShippingService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ShippingProviderType] [smallint] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ShippingService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_DNNspot_Store_ShippingService] UNIQUE NONCLUSTERED 
(
	[StoreId] ASC,
	[ShippingProviderType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Cart]    Script Date: 09/14/2010 17:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Cart](
	[Id] [uniqueidentifier] NOT NULL,
	[StoreId] [int] NOT NULL,
	[UserId] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedByIP] [varchar](15) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedByIP] [varchar](15) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vDNNspot_Store_StoreEmailTemplate]    Script Date: 09/14/2010 17:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDNNspot_Store_StoreEmailTemplate]
AS
SELECT
email.NameKey
,email.[Description]
,storeEmail.*
FROM dbo.DNNspot_Store_StoreEmailTemplate storeEmail
INNER JOIN dbo.DNNspot_Store_EmailTemplate email ON storeEmail.EmailTemplateId = email.Id
GO
/****** Object:  Table [dbo].[DNNspot_Store_PaymentTransaction]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_PaymentTransaction](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [int] NULL,
	[PaymentProviderId] [smallint] NOT NULL,
	[GatewayUrl] [nvarchar](2000) NOT NULL,
	[GatewayTransactionId] [nvarchar](100) NOT NULL,
	[GatewayResponse] [nvarchar](2000) NOT NULL,
	[GatewayDebugResponse] [nvarchar](max) NOT NULL,
	[GatewayError] [nvarchar](1000) NOT NULL,
	[Amount] [money] NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_PaymentTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_OrderItem]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Sku] [nvarchar](150) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductFieldData] [nvarchar](max) NOT NULL,
	[DigitalFileDisplayName] [nvarchar](250) NOT NULL,
	[DigitalFilename] [nvarchar](500) NOT NULL,
	[WeightTotal] [decimal](10, 4) NOT NULL,
	[PriceTotal] [money] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_OrderCoupon]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_OrderCoupon](
	[OrderId] [int] NOT NULL,
	[CouponCode] [nvarchar](50) NOT NULL,
	[DiscountAmount] [money] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_OrderCoupon] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[CouponCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_CartItem]    Script Date: 09/14/2010 17:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_CartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [uniqueidentifier] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductFieldData] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ShippingServiceSetting]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ShippingServiceSetting](
	[ShippingServiceId] [int] NOT NULL,
	[Name] [varchar](300) NOT NULL,
	[Value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ShippingServiceSetting] PRIMARY KEY CLUSTERED 
(
	[ShippingServiceId] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ShippingServiceRateType]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ShippingServiceRateType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShippingServiceId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DisplayName] [varchar](100) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[SortOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ShippingProviderRateType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ProductField]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ProductField](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[WidgetType] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[PriceAdjustment] [money] NULL,
	[WeightAdjustment] [decimal](10, 4) NULL,
	[SortOrder] [smallint] NOT NULL,
	[Slug] [nvarchar](100) NULL,
 CONSTRAINT [PK_DNNspot_Store_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DNNspot_Store_ProductField] ON [dbo].[DNNspot_Store_ProductField] 
(
	[ProductId] ASC,
	[Slug] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ProductDescriptor]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ProductDescriptor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[SortOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ProductDescriptor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ProductCategory]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ProductCategory](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ProductQuantityPrice]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ProductQuantityPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Min] [int] NOT NULL,
	[Max] [int] NOT NULL,
	[PricePerItem] [money] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ProductQuantityPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ProductPhoto]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ProductPhoto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[DisplayName] [nvarchar](250) NOT NULL,
	[Filename] [nvarchar](500) NOT NULL,
	[SortOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ProductFieldChoice]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ProductFieldChoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductFieldId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PriceAdjustment] [money] NULL,
	[WeightAdjustment] [decimal](10, 4) NULL,
	[SortOrder] [smallint] NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ProductAttributeOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_ShippingServiceRate]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_ShippingServiceRate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RateTypeId] [int] NOT NULL,
	[CountryCode] [nvarchar](2) NOT NULL,
	[Region] [nvarchar](150) NOT NULL,
	[WeightMin] [decimal](14, 4) NULL,
	[WeightMax] [decimal](14, 4) NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_ShippingProviderRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DNNspot_Store_Discount]    Script Date: 09/14/2010 17:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNNspot_Store_Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DnnRoleId] [int] NULL,
	[DiscountType] [varchar](50) NOT NULL,
	[PercentOff] [decimal](10, 2) NULL,
	[AmountOff] [money] NULL,
	[IsCombinable] [bit] NOT NULL,
	[ValidFromDate] [datetime] NULL,
	[ValidToDate] [datetime] NULL,
	[AppliesToProductIds] [varchar](max) NOT NULL,
	[AppliesToCategoryIds] [varchar](max) NOT NULL,
 CONSTRAINT [PK_DNNspot_Store_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vDNNspot_Store_ProductsSoldCounts]    Script Date: 09/14/2010 17:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDNNspot_Store_ProductsSoldCounts]
AS
SELECT
ProductId
,COUNT(ProductId) as NumSold
FROM dbo.DNNspot_Store_OrderItem oi
GROUP BY ProductId
GO
/****** Object:  View [dbo].[vDNNspot_Store_MainProductPhoto]    Script Date: 09/14/2010 17:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDNNspot_Store_MainProductPhoto]
AS
WITH NumberedProductPhotos
AS
(
SELECT
photo.ProductId
,photo.Filename
,photo.SortOrder
,ROW_NUMBER() OVER (PARTITION BY photo.ProductId ORDER BY photo.SortOrder ASC) AS PhotoNumber
FROM dbo.DNNspot_Store_Product p
INNER JOIN dbo.DNNspot_Store_ProductPhoto photo ON p.Id = photo.ProductId
)
SELECT ProductId, [Filename] as MainPhotoFilename FROM NumberedProductPhotos WHERE PhotoNumber = 1
GO
/****** Object:  View [dbo].[vDNNspot_Store_ShippingServiceRates]    Script Date: 09/14/2010 17:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDNNspot_Store_ShippingServiceRates]
AS
SELECT
rate.Id as RateId
,rate.CountryCode as CountryCode
,rate.Region as Region
,rate.WeightMin as WeightMin
,rate.WeightMax as WeightMax
,rate.Cost as Cost
,rateType.Id as RateTypeId
,rateType.Name as RateTypeName
,rateType.DisplayName as RateTypeDisplayName
,rateType.IsEnabled as RateTypeIsEnabled
,rateType.SortOrder as RateTypeSortOrder
FROM DNNspot_Store_ShippingServiceRateType rateType
INNER JOIN DNNspot_Store_ShippingServiceRate rate ON rate.RateTypeId = rateType.Id
GO
/****** Object:  View [dbo].[vDNNspot_Store_CartItemProductInfo]    Script Date: 09/14/2010 17:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDNNspot_Store_CartItemProductInfo]
AS
SELECT
ci.*
,mainPhoto.MainPhotoFilename
,p.Name as ProductName
,p.Slug as ProductSlug
--,p.Price as ProductItemPrice
,p.[Weight] as ProductWeight
,p.ShippingAdditionalFeePerItem as ProductShippingAdditionalFeePerItem
,p.DeliveryMethodId as ProductDeliveryMethodId
,p.IsTaxable as ProductIsTaxable
FROM dbo.[DNNspot_Store_CartItem] ci
INNER JOIN dbo.[DNNspot_Store_Product] p ON ci.ProductId = p.Id
LEFT JOIN dbo.[vDNNspot_Store_MainProductPhoto] mainPhoto ON p.Id = mainPhoto.ProductId
GO
/****** Object:  Default [DF_DNNspot_Store_Cart_CreatedOn]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_Cart] ADD  CONSTRAINT [DF_DNNspot_Store_Cart_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Cart_CreatedByIP]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_Cart] ADD  CONSTRAINT [DF_DNNspot_Store_Cart_CreatedByIP]  DEFAULT ('') FOR [CreatedByIP]
GO
/****** Object:  Default [DF_DNNspot_Store_Cart_ModifiedOn]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_Cart] ADD  CONSTRAINT [DF_DNNspot_Store_Cart_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Cart_ModifiedByIP]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_Cart] ADD  CONSTRAINT [DF_DNNspot_Store_Cart_ModifiedByIP]  DEFAULT ('') FOR [ModifiedByIP]
GO
/****** Object:  Default [DF_DNNspot_Store_CartItems_Attributes]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_CartItem] ADD  CONSTRAINT [DF_DNNspot_Store_CartItems_Attributes]  DEFAULT ('') FOR [ProductFieldData]
GO
/****** Object:  Default [DF_DNNspot_Store_CartItem_CreatedOn]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_CartItem] ADD  CONSTRAINT [DF_DNNspot_Store_CartItem_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_CartItem_ModifiedOn]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_CartItem] ADD  CONSTRAINT [DF_DNNspot_Store_CartItem_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_NestingLevel]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_NestingLevel]  DEFAULT ((0)) FOR [NestingLevel]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_IsFilter]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_IsFilter]  DEFAULT ((1)) FOR [IsDisplayed]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_Slug]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_Slug]  DEFAULT ('') FOR [Slug]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_Description]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_SeoTitle]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_SeoTitle]  DEFAULT ('') FOR [SeoTitle]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_SeoDescription]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_SeoDescription]  DEFAULT ('') FOR [SeoDescription]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_SeoKeywords]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_SeoKeywords]  DEFAULT ('') FOR [SeoKeywords]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_SortOrder]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_DNNspot_Store_Category_IsSystemCategory]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category] ADD  CONSTRAINT [DF_DNNspot_Store_Category_IsSystemCategory]  DEFAULT ((0)) FOR [IsSystemCategory]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_IsActive]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_Description]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_Description]  DEFAULT ('') FOR [DescriptionForCustomer]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_IsCombinable]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_IsCombinable]  DEFAULT ((1)) FOR [IsCombinable]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_AppliesTo]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_AppliesTo]  DEFAULT ('') FOR [DiscountType]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_MinPurchaseAmount]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_MinPurchaseAmount]  DEFAULT ((0)) FOR [MinOrderAmount]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_AppliesToProductIds]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_AppliesToProductIds]  DEFAULT ('') FOR [AppliesToProductIds]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_AppliesToShippingIds]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_AppliesToShippingIds]  DEFAULT ('') FOR [AppliesToShippingRateTypes]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_PercentOff]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_PercentOff]  DEFAULT ((0)) FOR [PercentOff]
GO
/****** Object:  Default [DF_DNNspot_Store_Coupon_AmountOff]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon] ADD  CONSTRAINT [DF_DNNspot_Store_Coupon_AmountOff]  DEFAULT ((0)) FOR [AmountOff]
GO
/****** Object:  Default [DF_DNNspot_Store_Discount_IsActive]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Discount] ADD  CONSTRAINT [DF_DNNspot_Store_Discount_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_DNNspot_Store_Discount_Name]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Discount] ADD  CONSTRAINT [DF_DNNspot_Store_Discount_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_DNNspot_Store_Discount_IsCombinable]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Discount] ADD  CONSTRAINT [DF_DNNspot_Store_Discount_IsCombinable]  DEFAULT ((0)) FOR [IsCombinable]
GO
/****** Object:  Default [DF_DNNspot_Store_Discount_AppliesToProductIds]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Discount] ADD  CONSTRAINT [DF_DNNspot_Store_Discount_AppliesToProductIds]  DEFAULT ('') FOR [AppliesToProductIds]
GO
/****** Object:  Default [DF_DNNspot_Store_Discount_AppliesToCategoryIds]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Discount] ADD  CONSTRAINT [DF_DNNspot_Store_Discount_AppliesToCategoryIds]  DEFAULT ('') FOR [AppliesToCategoryIds]
GO
/****** Object:  Default [DF_DNNspot_Store_EmailTemplate_DefaultSubject]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_EmailTemplate] ADD  CONSTRAINT [DF_DNNspot_Store_EmailTemplate_DefaultSubject]  DEFAULT ('') FOR [DefaultSubject]
GO
/****** Object:  Default [DF_DNNspot_Store_EmailTemplate_DefaultTemplate]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_EmailTemplate] ADD  CONSTRAINT [DF_DNNspot_Store_EmailTemplate_DefaultTemplate]  DEFAULT ('') FOR [DefaultBody]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_IsDeleted]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_OrderNumber]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_OrderNumber]  DEFAULT ('') FOR [OrderNumber]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_OrderStatus]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_OrderStatus]  DEFAULT ('') FOR [OrderStatusId]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_PaymentStatus]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_PaymentStatus]  DEFAULT ('') FOR [PaymentStatusId]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CustomerEmail]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CustomerEmail]  DEFAULT ('') FOR [CustomerEmail]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_Address1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_Address1]  DEFAULT ('') FOR [BillAddress1]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_Address2]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_Address2]  DEFAULT ('') FOR [BillAddress2]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_City]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_City]  DEFAULT ('') FOR [BillCity]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_StateOrRegion]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_StateOrRegion]  DEFAULT ('') FOR [BillRegion]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_ZipOrPostalCode]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_ZipOrPostalCode]  DEFAULT ('') FOR [BillPostalCode]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CountryCode]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CountryCode]  DEFAULT ('') FOR [BillCountryCode]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_BillTelephone]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_BillTelephone]  DEFAULT ('') FOR [BillTelephone]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_ShipToName]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_ShipToName]  DEFAULT ('') FOR [ShipRecipientName]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_ShipRecipientName2]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_ShipRecipientName2]  DEFAULT ('') FOR [ShipRecipientBusinessName]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_Address1_1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_Address1_1]  DEFAULT ('') FOR [ShipAddress1]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_Address2_1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_Address2_1]  DEFAULT ('') FOR [ShipAddress2]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_City_1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_City_1]  DEFAULT ('') FOR [ShipCity]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_StateOrRegion_1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_StateOrRegion_1]  DEFAULT ('') FOR [ShipRegion]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_ZipOrPostalCode_1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_ZipOrPostalCode_1]  DEFAULT ('') FOR [ShipPostalCode]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CountryCode_1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CountryCode_1]  DEFAULT ('') FOR [ShipCountryCode]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_ShipTelephone]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_ShipTelephone]  DEFAULT ('') FOR [ShipTelephone]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CreditCardType]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CreditCardType]  DEFAULT ('') FOR [CreditCardType]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CreditCardNumLast4]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CreditCardNumLast4]  DEFAULT ('') FOR [CreditCardNumberLast4]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CreditCardNumberEncrypted]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CreditCardNumberEncrypted]  DEFAULT ('') FOR [CreditCardNumberEncrypted]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CreditCardExpiration]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CreditCardExpiration]  DEFAULT ('') FOR [CreditCardExpiration]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CreditCardNameOnCard]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CreditCardNameOnCard]  DEFAULT ('') FOR [CreditCardNameOnCard]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_ShippingOption]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_ShippingOption]  DEFAULT ('') FOR [ShippingServiceOption]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_DiscountAmount]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_Tax]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_Tax]  DEFAULT ((0)) FOR [TaxAmount]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CreatedOn]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_CreatedByIP]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_CreatedByIP]  DEFAULT ('') FOR [CreatedByIP]
GO
/****** Object:  Default [DF_DNNspot_Store_Order_ModifiedOn]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  CONSTRAINT [DF_DNNspot_Store_Order_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
/****** Object:  Default [DF__DNNspot_S__Shipp__4F3DA442]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  DEFAULT ('') FOR [ShippingServiceProvider]
GO
/****** Object:  Default [DF__DNNspot_S__Shipp__5031C87B]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  DEFAULT ('') FOR [ShippingServiceTrackingNumber]
GO
/****** Object:  Default [DF__DNNspot_S__Shipp__5125ECB4]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  DEFAULT ('') FOR [ShippingServiceLabelFile]
GO
/****** Object:  Default [DF__DNNspot_S__Custo__521A10ED]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order] ADD  DEFAULT ('') FOR [CustomerNotes]
GO
/****** Object:  Default [DF_DNNspot_Store_OrderItem_Attributes]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_OrderItem] ADD  CONSTRAINT [DF_DNNspot_Store_OrderItem_Attributes]  DEFAULT ('') FOR [ProductFieldData]
GO
/****** Object:  Default [DF_DNNspot_Store_OrderItem_DigitalFileDisplayName]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_OrderItem] ADD  CONSTRAINT [DF_DNNspot_Store_OrderItem_DigitalFileDisplayName]  DEFAULT ('') FOR [DigitalFileDisplayName]
GO
/****** Object:  Default [DF_DNNspot_Store_OrderItem_DigitalFile]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_OrderItem] ADD  CONSTRAINT [DF_DNNspot_Store_OrderItem_DigitalFile]  DEFAULT ('') FOR [DigitalFilename]
GO
/****** Object:  Default [DF_DNNspot_Store_OrderItem_WeightTotal]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_OrderItem] ADD  CONSTRAINT [DF_DNNspot_Store_OrderItem_WeightTotal]  DEFAULT ((0)) FOR [WeightTotal]
GO
/****** Object:  Default [DF_DNNspot_Store_PaymentTransaction_Id]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] ADD  CONSTRAINT [DF_DNNspot_Store_PaymentTransaction_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_DNNspot_Store_PaymentTransaction_GatewayUrl]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] ADD  CONSTRAINT [DF_DNNspot_Store_PaymentTransaction_GatewayUrl]  DEFAULT ('') FOR [GatewayUrl]
GO
/****** Object:  Default [DF_DNNspot_Store_PaymentTransaction_GatewayTransactionId]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] ADD  CONSTRAINT [DF_DNNspot_Store_PaymentTransaction_GatewayTransactionId]  DEFAULT ('') FOR [GatewayTransactionId]
GO
/****** Object:  Default [DF_DNNspot_Store_PaymentTransaction_GatewayResponse_1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] ADD  CONSTRAINT [DF_DNNspot_Store_PaymentTransaction_GatewayResponse_1]  DEFAULT ('') FOR [GatewayResponse]
GO
/****** Object:  Default [DF_DNNspot_Store_PaymentTransaction_GatewayResponse]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] ADD  CONSTRAINT [DF_DNNspot_Store_PaymentTransaction_GatewayResponse]  DEFAULT ('') FOR [GatewayDebugResponse]
GO
/****** Object:  Default [DF_DNNspot_Store_PaymentTransaction_GatewayErrors]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] ADD  CONSTRAINT [DF_DNNspot_Store_PaymentTransaction_GatewayErrors]  DEFAULT ('') FOR [GatewayError]
GO
/****** Object:  Default [DF_DNNspot_Store_PaymentTransaction_CreatedOn]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] ADD  CONSTRAINT [DF_DNNspot_Store_PaymentTransaction_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_IsActive]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_Sku]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_Sku]  DEFAULT ('') FOR [Sku]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_ShortDescription]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_ShortDescription]  DEFAULT ('') FOR [SpecialNotes]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_Weight]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_Weight]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_DeliveryMethodId]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_DeliveryMethodId]  DEFAULT ((1)) FOR [DeliveryMethodId]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_ShippingCost]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_ShippingCost]  DEFAULT ((0)) FOR [ShippingAdditionalFeePerItem]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_QuantityType]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_QuantityType]  DEFAULT ('textbox') FOR [QuantityWidget]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_QuantityOptions]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_QuantityOptions]  DEFAULT ('') FOR [QuantityOptions]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_IsInventoryEnabled]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_IsInventoryEnabled]  DEFAULT ((0)) FOR [InventoryIsEnabled]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_AllowNegativeInventory]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_AllowNegativeInventory]  DEFAULT ((0)) FOR [InventoryAllowNegativeStockLevel]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_DigitalFileDisplayName]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_DigitalFileDisplayName]  DEFAULT ('') FOR [DigitalFileDisplayName]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_DigitalFile]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_DigitalFile]  DEFAULT ('') FOR [DigitalFilename]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_SeoTitle]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_SeoTitle]  DEFAULT ('') FOR [SeoTitle]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_SeoDescription]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_SeoDescription]  DEFAULT ('') FOR [SeoDescription]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_SeoKeywords]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_SeoKeywords]  DEFAULT ('') FOR [SeoKeywords]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_CreatedOn]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_ModifiedOn]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_IsTaxable]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_IsTaxable]  DEFAULT ((1)) FOR [IsTaxable]
GO
/****** Object:  Default [DF_DNNspot_Store_Product_CheckoutAssignRoleIds]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD  CONSTRAINT [DF_DNNspot_Store_Product_CheckoutAssignRoleIds]  DEFAULT ('') FOR [CheckoutAssignRoleInfoJson]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductDescriptor_Text]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductDescriptor] ADD  CONSTRAINT [DF_DNNspot_Store_ProductDescriptor_Text]  DEFAULT ('') FOR [Text]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductDescriptor_SortOrder]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductDescriptor] ADD  CONSTRAINT [DF_DNNspot_Store_ProductDescriptor_SortOrder]  DEFAULT ((99)) FOR [SortOrder]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductField_IsRequired]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductField] ADD  CONSTRAINT [DF_DNNspot_Store_ProductField_IsRequired]  DEFAULT ((0)) FOR [IsRequired]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductField_PriceAdjustment]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductField] ADD  CONSTRAINT [DF_DNNspot_Store_ProductField_PriceAdjustment]  DEFAULT ((0)) FOR [PriceAdjustment]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductField_WeightAdjustment]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductField] ADD  CONSTRAINT [DF_DNNspot_Store_ProductField_WeightAdjustment]  DEFAULT ((0)) FOR [WeightAdjustment]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductAttribute_SortOrder]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductField] ADD  CONSTRAINT [DF_DNNspot_Store_ProductAttribute_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductAttributeOption_PriceAdjustment]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductFieldChoice] ADD  CONSTRAINT [DF_DNNspot_Store_ProductAttributeOption_PriceAdjustment]  DEFAULT ((0)) FOR [PriceAdjustment]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductAttributeChoice_WeightAdjustment]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductFieldChoice] ADD  CONSTRAINT [DF_DNNspot_Store_ProductAttributeChoice_WeightAdjustment]  DEFAULT ((0)) FOR [WeightAdjustment]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductAttributeOption_SortOrder]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductFieldChoice] ADD  CONSTRAINT [DF_DNNspot_Store_ProductAttributeOption_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductFieldChoice_Value]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductFieldChoice] ADD  CONSTRAINT [DF_DNNspot_Store_ProductFieldChoice_Value]  DEFAULT ('') FOR [Value]
GO
/****** Object:  Default [DF_DNNspot_Store_ProductPhoto_SortOrder]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductPhoto] ADD  CONSTRAINT [DF_DNNspot_Store_ProductPhoto_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_DNNspot_Store_ShippingProviderRate_CountryCode]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRate] ADD  CONSTRAINT [DF_DNNspot_Store_ShippingProviderRate_CountryCode]  DEFAULT ('') FOR [CountryCode]
GO
/****** Object:  Default [DF_DNNspot_Store_ShippingProviderRate_Region]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRate] ADD  CONSTRAINT [DF_DNNspot_Store_ShippingProviderRate_Region]  DEFAULT ('') FOR [Region]
GO
/****** Object:  Default [DF_DNNspot_Store_ShippingProviderOption_IsEnabled]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRateType] ADD  CONSTRAINT [DF_DNNspot_Store_ShippingProviderOption_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
GO
/****** Object:  Default [DF_DNNspot_Store_ShippingProviderOption_SortOrder]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRateType] ADD  CONSTRAINT [DF_DNNspot_Store_ShippingProviderOption_SortOrder]  DEFAULT ((99)) FOR [SortOrder]
GO
/****** Object:  Default [DF_DNNspot_Store_Store_CreatedOn]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Store] ADD  CONSTRAINT [DF_DNNspot_Store_Store_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_DNNspot_Store_Store_StoreGuid]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Store] ADD  CONSTRAINT [DF_DNNspot_Store_Store_StoreGuid]  DEFAULT (newid()) FOR [StoreGuid]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Cart_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_Cart]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Cart_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_Cart] CHECK CONSTRAINT [FK_DNNspot_Store_Cart_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_CartItems_DNNspot_Store_Cart]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_CartItem]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_CartItems_DNNspot_Store_Cart] FOREIGN KEY([CartId])
REFERENCES [dbo].[DNNspot_Store_Cart] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_CartItem] CHECK CONSTRAINT [FK_DNNspot_Store_CartItems_DNNspot_Store_Cart]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_CartItems_DNNspot_Store_Product]    Script Date: 09/14/2010 17:44:10 ******/
ALTER TABLE [dbo].[DNNspot_Store_CartItem]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_CartItems_DNNspot_Store_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DNNspot_Store_Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_CartItem] CHECK CONSTRAINT [FK_DNNspot_Store_CartItems_DNNspot_Store_Product]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Category_DNNspot_Store_Category1]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Category_DNNspot_Store_Category1] FOREIGN KEY([ParentId])
REFERENCES [dbo].[DNNspot_Store_Category] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_Category] CHECK CONSTRAINT [FK_DNNspot_Store_Category_DNNspot_Store_Category1]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Category_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Category]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Category_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_Category] CHECK CONSTRAINT [FK_DNNspot_Store_Category_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Coupon_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Coupon]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Coupon_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_Coupon] CHECK CONSTRAINT [FK_DNNspot_Store_Coupon_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Discount_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Discount]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Discount_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_Discount] CHECK CONSTRAINT [FK_DNNspot_Store_Discount_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Discount_Roles]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Discount]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Discount_Roles] FOREIGN KEY([DnnRoleId])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_Discount] CHECK CONSTRAINT [FK_DNNspot_Store_Discount_Roles]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Order_DNNspot_Store_OrderStatus]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Order_DNNspot_Store_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[DNNspot_Store_OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_Order] CHECK CONSTRAINT [FK_DNNspot_Store_Order_DNNspot_Store_OrderStatus]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Order_DNNspot_Store_PaymentStatus]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Order_DNNspot_Store_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[DNNspot_Store_PaymentStatus] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_Order] CHECK CONSTRAINT [FK_DNNspot_Store_Order_DNNspot_Store_PaymentStatus]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Order_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Order]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Order_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_Order] CHECK CONSTRAINT [FK_DNNspot_Store_Order_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_OrderCoupon_DNNspot_Store_Order]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_OrderCoupon]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_OrderCoupon_DNNspot_Store_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[DNNspot_Store_Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_OrderCoupon] CHECK CONSTRAINT [FK_DNNspot_Store_OrderCoupon_DNNspot_Store_Order]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_OrderItem_DNNspot_Store_Order]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_OrderItem_DNNspot_Store_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[DNNspot_Store_Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_OrderItem] CHECK CONSTRAINT [FK_DNNspot_Store_OrderItem_DNNspot_Store_Order]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_OrderItem_DNNspot_Store_Product]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_OrderItem_DNNspot_Store_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DNNspot_Store_Product] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DNNspot_Store_OrderItem] CHECK CONSTRAINT [FK_DNNspot_Store_OrderItem_DNNspot_Store_Product]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_PaymentTransaction_DNNspot_Store_Order]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_PaymentTransaction_DNNspot_Store_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[DNNspot_Store_Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] CHECK CONSTRAINT [FK_DNNspot_Store_PaymentTransaction_DNNspot_Store_Order]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_PaymentTransaction_DNNspot_Store_PaymentProvider]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_PaymentTransaction_DNNspot_Store_PaymentProvider] FOREIGN KEY([PaymentProviderId])
REFERENCES [dbo].[DNNspot_Store_PaymentProvider] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_PaymentTransaction] CHECK CONSTRAINT [FK_DNNspot_Store_PaymentTransaction_DNNspot_Store_PaymentProvider]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_Product_DNNspot_Store_DeliveryMethod]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_Product]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_Product_DNNspot_Store_DeliveryMethod] FOREIGN KEY([DeliveryMethodId])
REFERENCES [dbo].[DNNspot_Store_DeliveryMethod] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DNNspot_Store_Product] CHECK CONSTRAINT [FK_DNNspot_Store_Product_DNNspot_Store_DeliveryMethod]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ProductCategory_DNNspot_Store_Category]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ProductCategory_DNNspot_Store_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[DNNspot_Store_Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ProductCategory] CHECK CONSTRAINT [FK_DNNspot_Store_ProductCategory_DNNspot_Store_Category]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ProductCategory_DNNspot_Store_Product]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ProductCategory_DNNspot_Store_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DNNspot_Store_Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ProductCategory] CHECK CONSTRAINT [FK_DNNspot_Store_ProductCategory_DNNspot_Store_Product]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ProductDescriptor_DNNspot_Store_Product]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductDescriptor]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ProductDescriptor_DNNspot_Store_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DNNspot_Store_Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ProductDescriptor] CHECK CONSTRAINT [FK_DNNspot_Store_ProductDescriptor_DNNspot_Store_Product]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ProductAttribute_DNNspot_Store_Product]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductField]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ProductAttribute_DNNspot_Store_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DNNspot_Store_Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ProductField] CHECK CONSTRAINT [FK_DNNspot_Store_ProductAttribute_DNNspot_Store_Product]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ProductAttributeOption_DNNspot_Store_ProductAttribute]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductFieldChoice]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ProductAttributeOption_DNNspot_Store_ProductAttribute] FOREIGN KEY([ProductFieldId])
REFERENCES [dbo].[DNNspot_Store_ProductField] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ProductFieldChoice] CHECK CONSTRAINT [FK_DNNspot_Store_ProductAttributeOption_DNNspot_Store_ProductAttribute]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ProductPhoto_DNNspot_Store_Product]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ProductPhoto_DNNspot_Store_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DNNspot_Store_Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ProductPhoto] CHECK CONSTRAINT [FK_DNNspot_Store_ProductPhoto_DNNspot_Store_Product]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ProductQuantityPrice_DNNspot_Store_ProductQuantityPrice]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ProductQuantityPrice]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ProductQuantityPrice_DNNspot_Store_ProductQuantityPrice] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DNNspot_Store_Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ProductQuantityPrice] CHECK CONSTRAINT [FK_DNNspot_Store_ProductQuantityPrice_DNNspot_Store_ProductQuantityPrice]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ShippingService_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingService]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ShippingService_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingService] CHECK CONSTRAINT [FK_DNNspot_Store_ShippingService_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ShippingServiceRate_DNNspot_Store_ShippingServiceRateType]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRate]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ShippingServiceRate_DNNspot_Store_ShippingServiceRateType] FOREIGN KEY([RateTypeId])
REFERENCES [dbo].[DNNspot_Store_ShippingServiceRateType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRate] CHECK CONSTRAINT [FK_DNNspot_Store_ShippingServiceRate_DNNspot_Store_ShippingServiceRateType]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ShippingServiceRateType_DNNspot_Store_ShippingService]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRateType]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ShippingServiceRateType_DNNspot_Store_ShippingService] FOREIGN KEY([ShippingServiceId])
REFERENCES [dbo].[DNNspot_Store_ShippingService] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceRateType] CHECK CONSTRAINT [FK_DNNspot_Store_ShippingServiceRateType_DNNspot_Store_ShippingService]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_ShippingServiceSetting_DNNspot_Store_ShippingService]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceSetting]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_ShippingServiceSetting_DNNspot_Store_ShippingService] FOREIGN KEY([ShippingServiceId])
REFERENCES [dbo].[DNNspot_Store_ShippingService] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingServiceSetting] CHECK CONSTRAINT [FK_DNNspot_Store_ShippingServiceSetting_DNNspot_Store_ShippingService]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_StoreEmailTemplate_DNNspot_Store_EmailTemplate]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_StoreEmailTemplate]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_StoreEmailTemplate_DNNspot_Store_EmailTemplate] FOREIGN KEY([EmailTemplateId])
REFERENCES [dbo].[DNNspot_Store_EmailTemplate] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_StoreEmailTemplate] CHECK CONSTRAINT [FK_DNNspot_Store_StoreEmailTemplate_DNNspot_Store_EmailTemplate]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_StoreEmailTemplate_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_StoreEmailTemplate]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_StoreEmailTemplate_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_StoreEmailTemplate] CHECK CONSTRAINT [FK_DNNspot_Store_StoreEmailTemplate_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_StorePaymentProcessor_DNNspot_Store_PaymentProcessor]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProvider]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessor_DNNspot_Store_PaymentProcessor] FOREIGN KEY([PaymentProviderId])
REFERENCES [dbo].[DNNspot_Store_PaymentProvider] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProvider] CHECK CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessor_DNNspot_Store_PaymentProcessor]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_StorePaymentProcessor_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProvider]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessor_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProvider] CHECK CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessor_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_StorePaymentProcessorSetting_DNNspot_Store_PaymentProcessor]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProviderSetting]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessorSetting_DNNspot_Store_PaymentProcessor] FOREIGN KEY([PaymentProviderId])
REFERENCES [dbo].[DNNspot_Store_PaymentProvider] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProviderSetting] CHECK CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessorSetting_DNNspot_Store_PaymentProcessor]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_StorePaymentProcessorSetting_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProviderSetting]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessorSetting_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
GO
ALTER TABLE [dbo].[DNNspot_Store_StorePaymentProviderSetting] CHECK CONSTRAINT [FK_DNNspot_Store_StorePaymentProcessorSetting_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_StoreSetting_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_StoreSetting]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_StoreSetting_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_StoreSetting] CHECK CONSTRAINT [FK_DNNspot_Store_StoreSetting_DNNspot_Store_Store]
GO
/****** Object:  ForeignKey [FK_DNNspot_Store_RegionTax_DNNspot_Store_Store]    Script Date: 09/14/2010 17:44:11 ******/
ALTER TABLE [dbo].[DNNspot_Store_TaxRegion]  WITH CHECK ADD  CONSTRAINT [FK_DNNspot_Store_RegionTax_DNNspot_Store_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DNNspot_Store_Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DNNspot_Store_TaxRegion] CHECK CONSTRAINT [FK_DNNspot_Store_RegionTax_DNNspot_Store_Store]
GO
