/*
Run this script on:

        .\SQL08.DNN_523    -  This database will be modified

to synchronize it with:

        .\SQL08.DNNspot_DEV

You are recommended to back up your database before running this script

Script created by SQL Compare version 8.1.0 from Red Gate Software Ltd at 4/2/2010 4:17:14 PM

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
PRINT N'Dropping foreign keys from [dbo].[DNNspot_Store_ShippingRate_Weight]'
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingRate_Weight] DROP
CONSTRAINT [FK_DNNspot_Store_ShippingRate_Weight_DNNspot_Store_ShippingMethod]
GO
PRINT N'Dropping constraints from [dbo].[DNNspot_Store_ShippingRate_Weight]'
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingRate_Weight] DROP CONSTRAINT [IX_DNNspot_Store_ShippingRate_Weight]
GO
PRINT N'Dropping constraints from [dbo].[DNNspot_Store_Product]'
GO
ALTER TABLE [dbo].[DNNspot_Store_Product] DROP CONSTRAINT [DF_DNNspot_Store_Product_CheckoutAssignRoleIds]
GO
PRINT N'Creating [dbo].[DNNspot_Store_Discount]'
GO
CREATE TABLE [dbo].[DNNspot_Store_Discount]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[StoreId] [int] NOT NULL,
[DnnRoleId] [int] NOT NULL,
[DiscountType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PercentOff] [decimal] (10, 2) NULL,
[AmountOff] [money] NULL
)
GO
PRINT N'Creating primary key [PK_DNNspot_Store_Discount] on [dbo].[DNNspot_Store_Discount]'
GO
ALTER TABLE [dbo].[DNNspot_Store_Discount] ADD CONSTRAINT [PK_DNNspot_Store_Discount] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Altering [dbo].[DNNspot_Store_ShippingRate_Weight]'
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingRate_Weight] ADD
[CountryCode] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_DNNspot_Store_ShippingRate_Weight_CountryCode] DEFAULT (''),
[Region] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_DNNspot_Store_ShippingRate_Weight_Region] DEFAULT ('')
GO
PRINT N'Altering [dbo].[DNNspot_Store_ShippingMethod]'
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingMethod] ADD
[SortOrder] [smallint] NOT NULL CONSTRAINT [DF_DNNspot_Store_ShippingMethod_SortOrder] DEFAULT ((99))
GO
PRINT N'Refreshing [dbo].[vDNNspot_Store_ProductsSoldCounts]'
GO
EXEC sp_refreshview N'[dbo].[vDNNspot_Store_ProductsSoldCounts]'
GO
PRINT N'Altering [dbo].[DNNspot_Store_Product]'
GO
ALTER TABLE [dbo].[DNNspot_Store_Product] ADD
[CheckoutAssignRoleInfoJson] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_DNNspot_Store_Product_CheckoutAssignRoleIds] DEFAULT ('')
GO
ALTER TABLE [dbo].[DNNspot_Store_Product] DROP
COLUMN [CheckoutAssignRoleIds]
GO
PRINT N'Refreshing [dbo].[vDNNspot_Store_ShippingRateWeight]'
GO
EXEC sp_refreshview N'[dbo].[vDNNspot_Store_ShippingRateWeight]'
GO
PRINT N'Refreshing [dbo].[vDNNspot_Store_MainProductPhoto]'
GO
EXEC sp_refreshview N'[dbo].[vDNNspot_Store_MainProductPhoto]'
GO
PRINT N'Altering [dbo].[vDNNspot_Store_CartItemProductInfo]'
GO






ALTER VIEW [dbo].[vDNNspot_Store_CartItemProductInfo]
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
FROM dbo.DNNspot_Store_CartItem ci
INNER JOIN dbo.DNNspot_Store_Product p ON ci.ProductId = p.Id
LEFT JOIN dbo.vDNNspot_Store_MainProductPhoto mainPhoto ON p.Id = mainPhoto.ProductId








GO
PRINT N'Adding foreign keys to [dbo].[DNNspot_Store_Discount]'
GO
ALTER TABLE [dbo].[DNNspot_Store_Discount] ADD
CONSTRAINT [FK_DNNspot_Store_Discount_DNNspot_Store_Store] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[DNNspot_Store_Store] ([Id]) ON DELETE CASCADE,
CONSTRAINT [FK_DNNspot_Store_Discount_Roles] FOREIGN KEY ([DnnRoleId]) REFERENCES [dbo].[Roles] ([RoleID]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[DNNspot_Store_ShippingRate_Weight]'
GO
ALTER TABLE [dbo].[DNNspot_Store_ShippingRate_Weight] ADD
CONSTRAINT [FK_DNNspot_Store_ShippingRate_Weight_DNNspot_Store_ShippingMethod] FOREIGN KEY ([ShippingMethodId]) REFERENCES [dbo].[DNNspot_Store_ShippingMethod] ([Id]) ON DELETE CASCADE
GO
