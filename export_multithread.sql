"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[FileType]

CREATE TABLE [Lookup].[FileType]
(
 [Id]              int IDENTITY (1, 1) NOT NULL ,
 [Description]     nvarchar(100) NOT NULL ,
 [Extension]       nvarchar(50) NOT NULL ,
 [MineType]        nvarchar(100) NOT NULL ,
 [DisplayThumbnal] bit NOT NULL ,


 CONSTRAINT [PK_FileType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Affiliate].[FraudLocked]

CREATE TABLE [Affiliate].[FraudLocked]
(
 [AffiliateId] int NOT NULL ,
 [IsLocked]    bit NOT NULL ,
 [Reason]      nvarchar(max) NOT NULL ,
 [Date]        date NOT NULL ,
 [UpdatedBy]   int NOT NULL ,


 CONSTRAINT [PK_FraudLocked] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [Affiliate_FraudLocked_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_Login_FraudLocked_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_373] ON [Affiliate].[FraudLocked] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_732] ON [Affiliate].[FraudLocked] 
 (
  [UpdatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Authentication].[LoginRole]

CREATE TABLE [Authentication].[LoginRole]
(
 [Id]      int IDENTITY (1, 1) NOT NULL ,
 [RoleId]  int NOT NULL ,
 [LoginId] int NOT NULL ,


 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Login_LoginRole_LoginId] FOREIGN KEY ([LoginId])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Role_LoginRole_RoleId] FOREIGN KEY ([RoleId])  REFERENCES [Authentication].[Role]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_837] ON [Authentication].[LoginRole] 
 (
  [LoginId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_841] ON [Authentication].[LoginRole] 
 (
  [RoleId] ASC
 )

GO







-- ************************************** [Authentication].[LoginRoleAudit]

CREATE TABLE [Authentication].[LoginRoleAudit]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [LoginRoleId] int NOT NULL ,
 [UpdatedBy]   int NOT NULL ,
 [UpdatedDate] datetime NOT NULL ,


 CONSTRAINT [PK_LoginRoleAudit] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Login_LoginRoleAudit_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_LoginRole_LoginRoleAudit_LoginRoleId] FOREIGN KEY ([LoginRoleId])  REFERENCES [Authentication].[LoginRole]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_834] ON [Authentication].[LoginRoleAudit] 
 (
  [LoginRoleId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_844] ON [Authentication].[LoginRoleAudit] 
 (
  [UpdatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[Brand]

CREATE TABLE [Lookup].[Brand]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Code]        nvarchar(255) NOT NULL ,
 [Name]        nvarchar(255) NOT NULL ,
 [URL]         nvarchar(255) NOT NULL ,
 [WebsiteName] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Authentication].[Avatar]

CREATE TABLE [Authentication].[Avatar]
(
 [Id]      int IDENTITY (1, 1) NOT NULL ,
 [ImageId] int NOT NULL ,


 CONSTRAINT [PK_Avatar] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Image_Avatar_ImageId] FOREIGN KEY ([ImageId])  REFERENCES [Media].[Image]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_698] ON [Authentication].[Avatar] 
 (
  [ImageId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Media].[File]

CREATE TABLE [Media].[File]
(
 [Id]         int IDENTITY (1, 1) NOT NULL ,
 [Width]      int NOT NULL ,
 [Height]     int NOT NULL ,
 [FileTypeId] int NOT NULL ,


 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_FileType_File_FileTypeId] FOREIGN KEY ([FileTypeId])  REFERENCES [Lookup].[FileType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_686] ON [Media].[File] 
 (
  [FileTypeId] ASC
 )

GO







-- ************************************** [Affiliate].[Feed]

CREATE TABLE [Affiliate].[Feed]
(
 [AffiliateId] int NOT NULL ,
 [XMLKey]      nvarchar(255) NOT NULL ,
 [SportsKey]   nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_Feed] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [Affiliate_Feed_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_363] ON [Affiliate].[Feed] 
 (
  [AffiliateId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[DealRateType]

CREATE TABLE [Lookup].[DealRateType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_DealRateType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[DealConfigurationRangeType]

CREATE TABLE [Lookup].[DealConfigurationRangeType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_DealConfigurationRangeType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[ApplicationPaymentMethodCountry]

CREATE TABLE [SiteApplication].[ApplicationPaymentMethodCountry]
(
 [Id]                         int IDENTITY (1, 1) NOT NULL ,
 [ApplicationPaymentMethodId] int NULL ,
 [CountryId]                  int NULL ,


 CONSTRAINT [SiteApplication_ApplicationPaymentMethodCountry_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_ApplicationPaymentMethodCountry_198] FOREIGN KEY ([CountryId])  REFERENCES [Lookup].[Country]([Id]),
 CONSTRAINT [FK_ApplicationPaymentMethodCountry_200] FOREIGN KEY ([ApplicationPaymentMethodId])  REFERENCES [SiteApplication].[ApplicationPaymentMethod]([Id])
);
GO








-- ************************************** [SiteApplication].[ApplicationPaymentMethodCurrency]

CREATE TABLE [SiteApplication].[ApplicationPaymentMethodCurrency]
(
 [Id]                                int IDENTITY (1, 1) NOT NULL ,
 [ApplicationPaymentMethodCountryId] int NULL ,
 [CurrencyId]                        int NULL ,


 CONSTRAINT [SiteApplication_ApplicationPaymentMethodCurrency_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_ApplicationPaymentMethodCurrency_202] FOREIGN KEY ([ApplicationPaymentMethodCountryId])  REFERENCES [SiteApplication].[ApplicationPaymentMethodCountry]([Id]),
 CONSTRAINT [FK_ApplicationPaymentMethodCurrency_204] FOREIGN KEY ([CurrencyId])  REFERENCES [Lookup].[Currency]([Id])
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [KYC].[DocumentFields]

CREATE TABLE [KYC].[DocumentFields]
(
 [DocumentTypeId] int NOT NULL ,
 [FieldTypeId]    int NOT NULL ,


 CONSTRAINT [PK_DocumentFields] PRIMARY KEY CLUSTERED ([DocumentTypeId] ASC, [FieldTypeId] ASC),
 CONSTRAINT [FK_DocumentType_DocumentFields_DocumentTypeId] FOREIGN KEY ([DocumentTypeId])  REFERENCES [Lookup].[KycDocumentType]([Id]),
 CONSTRAINT [FK_KycFieldType_DocumentFields_FieldTypeId] FOREIGN KEY ([FieldTypeId])  REFERENCES [Lookup].[KycFieldType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1148] ON [KYC].[DocumentFields] 
 (
  [DocumentTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1152] ON [KYC].[DocumentFields] 
 (
  [FieldTypeId] ASC
 )

GO







-- ************************************** [KYC].[Document]

CREATE TABLE [KYC].[Document]
(
 [Id]           int IDENTITY (1, 1) NOT NULL ,
 [UploadedDate] datetime NOT NULL ,
 [FileName]     nvarchar(255) NOT NULL ,
 [FileType]     nvarchar(25) NULL ,
 [ContentType]  nvarchar(25) NULL ,
 [Content]      varbinary(max) NULL ,
 [CaseId]       int NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Case_Document_CaseId] FOREIGN KEY ([CaseId])  REFERENCES [KYC].[Case]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1099] ON [KYC].[Document] 
 (
  [CaseId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[KycTaskType]

CREATE TABLE [Lookup].[KycTaskType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(50) NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[KycStatusType]

CREATE TABLE [Lookup].[KycStatusType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(50) NULL ,


 CONSTRAINT [PK_StatusType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[Application]

CREATE TABLE [SiteApplication].[Application]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Name]        nvarchar(255) NULL ,
 [Code]        nvarchar(3) NULL ,
 [Description] nvarchar(max) NULL ,
 [DisplayName] nvarchar(255) NULL ,


 CONSTRAINT [SiteApplication_Application_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[AffiliateType]

CREATE TABLE [Lookup].[AffiliateType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_AffiliateType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[LoginAccess]

CREATE TABLE [Lookup].[LoginAccess]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_LoginAccess] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Authentication].[Login]

CREATE TABLE [Authentication].[Login]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [LoginTypeId] int NOT NULL ,
 [IsDeleted]   bit NOT NULL ,


 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_LoginType_Login_LoginTypeId] FOREIGN KEY ([LoginTypeId])  REFERENCES [Lookup].[LoginType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_767] ON [Authentication].[Login] 
 (
  [LoginTypeId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[ApplicationXmlFeed]

CREATE TABLE [SiteApplication].[ApplicationXmlFeed]
(
 [ApplicationId] int NOT NULL ,
 [XmlFeedId]     int NOT NULL ,


 CONSTRAINT [PK_ApplicationXmlFeed] PRIMARY KEY CLUSTERED ([ApplicationId] ASC, [XmlFeedId] ASC),
 CONSTRAINT [FK_Application_ApplicationXmlFeed_ApplicationId] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id]),
 CONSTRAINT [FK_XmlFeed_ApplicationXmlFeed_XmlFeedId] FOREIGN KEY ([XmlFeedId])  REFERENCES [SiteApplication].[XmlFeed]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1281] ON [SiteApplication].[ApplicationXmlFeed] 
 (
  [ApplicationId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1284] ON [SiteApplication].[ApplicationXmlFeed] 
 (
  [XmlFeedId] ASC
 )

GO







-- ************************************** [Deal].[Audit]

CREATE TABLE [Deal].[Audit]
(
 [Id]                  int IDENTITY (1, 1) NOT NULL ,
 [DealId]              int NOT NULL ,
 [DealConfigurationId] int NOT NULL ,
 [UpdatedDate]         datetime NOT NULL ,
 [UpdatedBy]           int NOT NULL ,


 CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Deal_DealAudit_DealId] FOREIGN KEY ([DealId])  REFERENCES [Deal].[Deal]([Id]),
 CONSTRAINT [DealConfiguration_Audit_DealConfigurationId] FOREIGN KEY ([DealConfigurationId])  REFERENCES [Deal].[DealConfiguration]([Id]),
 CONSTRAINT [FK_Login_Audit_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_628] ON [Deal].[Audit] 
 (
  [DealId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_717] ON [Deal].[Audit] 
 (
  [UpdatedBy] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_826] ON [Deal].[Audit] 
 (
  [DealConfigurationId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[KycFieldType]

CREATE TABLE [Lookup].[KycFieldType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(100) NOT NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[KycDocumentType]

CREATE TABLE [Lookup].[KycDocumentType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(50) NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[Language]

CREATE TABLE [Lookup].[Language]
(
 [Id]           int IDENTITY (1, 1) NOT NULL ,
 [Description]  nvarchar(255) NOT NULL ,
 [LanguageCode] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Media].[LandingPage]

CREATE TABLE [Media].[LandingPage]
(
 [Id]        int IDENTITY (1, 1) NOT NULL ,
 [Name]      nvarchar(255) NOT NULL ,
 [BrandId]   int NULL ,
 [Url]       nvarchar(255) NULL ,
 [IsDeleted] bit NULL ,


 CONSTRAINT [PK_LandingPage] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Brand_LandingPage_BrandId] FOREIGN KEY ([BrandId])  REFERENCES [Lookup].[Brand]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_667] ON [Media].[LandingPage] 
 (
  [BrandId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[DealType]

CREATE TABLE [Lookup].[DealType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_DealType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Notification].[Detail]

CREATE TABLE [Notification].[Detail]
(
 [NotificationId] int NOT NULL ,
 [FromLoginId]    int NOT NULL ,
 [ToLoginId]      int NOT NULL ,
 [CreatedOn]      datetime NOT NULL ,
 [Message]        nvarchar(max) NOT NULL ,
 [Title]          nvarchar(max) NOT NULL ,


 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED ([NotificationId] ASC),
 CONSTRAINT [FK_Login_Detail_FromLoginId] FOREIGN KEY ([FromLoginId])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Login_Detail_ToLoginId] FOREIGN KEY ([ToLoginId])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Notification_Detail_NotificationId] FOREIGN KEY ([NotificationId])  REFERENCES [Notification].[Notification]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_956] ON [Notification].[Detail] 
 (
  [NotificationId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_964] ON [Notification].[Detail] 
 (
  [FromLoginId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_967] ON [Notification].[Detail] 
 (
  [ToLoginId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[MaintenanceScheduleAudit]

CREATE TABLE [SiteApplication].[MaintenanceScheduleAudit]
(
 [Id]                    int IDENTITY (1, 1) NOT NULL ,
 [MaintenanceScheduleId] int NULL ,
 [CreatedDate]           datetime NULL ,
 [ModifiedDate]          datetime NULL ,
 [CreatedBy]             int NULL ,
 [UpdatedBy]             int NULL ,


 CONSTRAINT [SiteApplication_OfflineScheduleAudit_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Login_MaintenanceScheduleAudit_CreatedBy] FOREIGN KEY ([CreatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Login_MaintenanceScheduleAudit_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_MaintenanceScheduleAudit_194] FOREIGN KEY ([MaintenanceScheduleId])  REFERENCES [SiteApplication].[MaintenanceSchedule]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_726] ON [SiteApplication].[MaintenanceScheduleAudit] 
 (
  [UpdatedBy] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_729] ON [SiteApplication].[MaintenanceScheduleAudit] 
 (
  [CreatedBy] ASC
 )

GO







-- ************************************** [Affiliate].[Manager]

CREATE TABLE [Affiliate].[Manager]
(
 [AffiliateId]  int NOT NULL ,
 [LoginId]      int NULL ,
 [AssignedDate] datetime NULL ,


 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [Affiliate_Manager_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_Login_Manager_LoginId] FOREIGN KEY ([LoginId])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_355] ON [Affiliate].[Manager] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_741] ON [Affiliate].[Manager] 
 (
  [LoginId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [KYC].[Case]

CREATE TABLE [KYC].[Case]
(
 [Id]           int IDENTITY (1, 1) NOT NULL ,
 [StatusTypeId] int NOT NULL ,
 [AffiliateId]  int NOT NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Affiliate_Case_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_KycStatusType_Case_StatusTypeId] FOREIGN KEY ([StatusTypeId])  REFERENCES [Lookup].[KycStatusType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1096] ON [KYC].[Case] 
 (
  [StatusTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1105] ON [KYC].[Case] 
 (
  [AffiliateId] ASC
 )

GO







-- ************************************** [KYC].[CaseDetail]

CREATE TABLE [KYC].[CaseDetail]
(
 [CaseId]       int NOT NULL ,
 [AssignedTo]   int NOT NULL ,
 [AssignedDate] datetime NOT NULL ,
 [OpenedDate]   datetime NOT NULL ,
 [ClosedDate]   datetime NOT NULL ,
 [BannerStatus] int NOT NULL ,


 CONSTRAINT [PK_CaseDetail] PRIMARY KEY CLUSTERED ([CaseId] ASC),
 CONSTRAINT [FK_Case_CaseDetail_CaseId] FOREIGN KEY ([CaseId])  REFERENCES [KYC].[Case]([Id]),
 CONSTRAINT [FK_Login_CaseDetail_AssignedTo] FOREIGN KEY ([AssignedTo])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1116] ON [KYC].[CaseDetail] 
 (
  [CaseId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1164] ON [KYC].[CaseDetail] 
 (
  [AssignedTo] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[LoginType]

CREATE TABLE [Lookup].[LoginType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(50) NOT NULL ,


 CONSTRAINT [PK_LoginType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [SiteApplication].[MaintenanceSchedule]

CREATE TABLE [SiteApplication].[MaintenanceSchedule]
(
 [Id]                     int IDENTITY (1, 1) NOT NULL ,
 [ApplicationId]          int NULL ,
 [StartDate]              datetime NULL ,
 [EndDate]                datetime NULL ,
 [AuthenticatedStateOnly] bit NULL ,


 CONSTRAINT [SiteApplication_OfflineSchedule_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_MaintenanceSchedule_192] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id])
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[ApplicationPaymentMethod]

CREATE TABLE [SiteApplication].[ApplicationPaymentMethod]
(
 [Id]              int IDENTITY (1, 1) NOT NULL ,
 [ApplicationId]   int NULL ,
 [PaymentMethodId] int NULL ,


 CONSTRAINT [SiteApplication_ApplicationPaymentMethod_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_ApplicationPaymentMethod_196] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id]),
 CONSTRAINT [PaymentMethod_ApplicationPaymentMethod_PaymentMethodId] FOREIGN KEY ([PaymentMethodId])  REFERENCES [Lookup].[PaymentMethod]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_809] ON [SiteApplication].[ApplicationPaymentMethod] 
 (
  [PaymentMethodId] ASC
 )

GO







-- ************************************** [SiteApplication].[ApplicationBrand]

CREATE TABLE [SiteApplication].[ApplicationBrand]
(
 [Id]            int IDENTITY (1, 1) NOT NULL ,
 [ApplicationId] int NULL ,
 [BrandId]       int NOT NULL ,


 CONSTRAINT [PK_ApplicationBrand] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_ApplicationBrand_214] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id]),
 CONSTRAINT [FK_Brand_ApplicationBrand_BrandId] FOREIGN KEY ([BrandId])  REFERENCES [Lookup].[Brand]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_772] ON [SiteApplication].[ApplicationBrand] 
 (
  [BrandId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Authentication].[Action]

CREATE TABLE [Authentication].[Action]
(
 [Id]            int IDENTITY (1, 1) NOT NULL ,
 [Name]          nvarchar(50) NOT NULL ,
 [Description]   nvarchar(200) NOT NULL ,
 [ApplicationId] int NOT NULL ,
 [SortOrder]     int NOT NULL ,


 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Application_Action_ApplicationId] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_847] ON [Authentication].[Action] 
 (
  [ApplicationId] ASC
 )

GO







-- ************************************** [Affiliate].[Affiliate]

CREATE TABLE [Affiliate].[Affiliate]
(
 [Id]                     int IDENTITY (1, 1) NOT NULL ,
 [TypeId]                 int NOT NULL ,
 [Name]                   nvarchar(255) NOT NULL ,
 [Description]            nvarchar(max) NOT NULL ,
 [Address1]               nvarchar(255) NULL ,
 [Address2]               nvarchar(255) NULL ,
 [City]                   nvarchar(255) NULL ,
 [State]                  nvarchar(255) NULL ,
 [PostCode]               nvarchar(255) NULL ,
 [CountryId]              int NULL ,
 [LanguageId]             int NULL ,
 [DefaultCampaignId]      int NULL ,
 [DefaultPaymentDetailId] int NULL ,
 [PrimaryProductTypeId]   int NULL ,
 [IsUnsubscribed]         bit NULL ,
 [IsDeleted]              bit NULL ,
 [Value]                  nvarchar(10) NOT NULL ,


 CONSTRAINT [PK_Affiliate] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Affiliate_Language_LanguageId] FOREIGN KEY ([LanguageId])  REFERENCES [Lookup].[Language]([Id]),
 CONSTRAINT [AffiliateType_Affiliate_TypeId] FOREIGN KEY ([TypeId])  REFERENCES [Lookup].[AffiliateType]([Id]),
 CONSTRAINT [Campaign_Affiliate_DefaultCampaignId] FOREIGN KEY ([DefaultCampaignId], [Value])  REFERENCES [Affiliate].[Campaign]([Id], [Value]),
 CONSTRAINT [Country_Affiliate_CountryId] FOREIGN KEY ([CountryId])  REFERENCES [Lookup].[Country]([Id]),
 CONSTRAINT [PaymentDetail_Affiliate_DefaultPaymentDetailId] FOREIGN KEY ([DefaultPaymentDetailId])  REFERENCES [Affiliate].[PaymentDetail]([Id]),
 CONSTRAINT [ProductType_Affiliate_PrimaryProductTypeId] FOREIGN KEY ([PrimaryProductTypeId])  REFERENCES [Lookup].[ProductType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_309] ON [Affiliate].[Affiliate] 
 (
  [DefaultPaymentDetailId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_312] ON [Affiliate].[Affiliate] 
 (
  [DefaultCampaignId] ASC, 
  [Value] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_393] ON [Affiliate].[Affiliate] 
 (
  [CountryId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_683] ON [Affiliate].[Affiliate] 
 (
  [LanguageId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_792] ON [Affiliate].[Affiliate] 
 (
  [PrimaryProductTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_832] ON [Affiliate].[Affiliate] 
 (
  [TypeId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [KYC].[DocumentTag]

CREATE TABLE [KYC].[DocumentTag]
(
 [Id]             int IDENTITY (1, 1) NOT NULL ,
 [DocumentId]     int NOT NULL ,
 [DocumentTypeId] int NOT NULL ,
 [StatusTypeId]   int NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Doucment_DocumentTag_DocumentId] FOREIGN KEY ([DocumentId])  REFERENCES [KYC].[Document]([Id]),
 CONSTRAINT [FK_KycDocumentType_DocumentTag_DocumentTypeId] FOREIGN KEY ([DocumentTypeId])  REFERENCES [Lookup].[KycDocumentType]([Id]),
 CONSTRAINT [FK_KycStatusType_DocumentTag_StatusTypeId] FOREIGN KEY ([StatusTypeId])  REFERENCES [Lookup].[KycStatusType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1087] ON [KYC].[DocumentTag] 
 (
  [DocumentTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1090] ON [KYC].[DocumentTag] 
 (
  [StatusTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1173] ON [KYC].[DocumentTag] 
 (
  [DocumentId] ASC
 )

GO







-- ************************************** [KYC].[DocumentTagAudit]

CREATE TABLE [KYC].[DocumentTagAudit]
(
 [DocumentTagId] int NOT NULL ,
 [UpdatedBy]     int NOT NULL ,
 [UpdatedOn]     datetime NOT NULL ,


 CONSTRAINT [PK_DocumentTagAudit] PRIMARY KEY CLUSTERED ([DocumentTagId] ASC),
 CONSTRAINT [FK_DocumentTag_DocumentTagAudit_DocumentTagId] FOREIGN KEY ([DocumentTagId])  REFERENCES [KYC].[DocumentTag]([Id]),
 CONSTRAINT [FK_Login_DocumentTagAudit_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1119] ON [KYC].[DocumentTagAudit] 
 (
  [DocumentTagId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1158] ON [KYC].[DocumentTagAudit] 
 (
  [UpdatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[XmlFeedSource]

CREATE TABLE [SiteApplication].[XmlFeedSource]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,
 [URL]         nvarchar(500) NOT NULL ,
 [IsDeleted]   bit NOT NULL ,


 CONSTRAINT [PK_XmlFeedSource] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [SiteApplication].[XmlFeed]

CREATE TABLE [SiteApplication].[XmlFeed]
(
 [Id]           int IDENTITY (1, 1) NOT NULL ,
 [Description]  nvarchar(255) NOT NULL ,
 [URL]          nvarchar(500) NOT NULL ,
 [IsCPA]        bit NOT NULL ,
 [IsRevShare]   bit NOT NULL ,
 [IsDeleted]    bit NOT NULL ,
 [ToolTipKey]   nvarchar(255) NOT NULL ,
 [FeedTypeId]   int NOT NULL ,
 [IsPublic]     bit NOT NULL ,
 [FeedSourceId] int NOT NULL ,
 [IsExternal]   bit NOT NULL ,


 CONSTRAINT [PK_XmlFeed] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_XmlFeedSource_XmlFeed_FeedSourceId] FOREIGN KEY ([FeedSourceId])  REFERENCES [SiteApplication].[XmlFeedSource]([Id]),
 CONSTRAINT [FK_XmlFeedType_XmlFeed_FeedTypeId] FOREIGN KEY ([FeedTypeId])  REFERENCES [Lookup].[XmlFeedType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1209] ON [SiteApplication].[XmlFeed] 
 (
  [FeedTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1212] ON [SiteApplication].[XmlFeed] 
 (
  [FeedSourceId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[XmlFeedType]

CREATE TABLE [Lookup].[XmlFeedType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_XmlFeedType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [SiteApplication].[XmlFeedSourceAudit]

CREATE TABLE [SiteApplication].[XmlFeedSourceAudit]
(
 [XmlFeedSourceId] int NOT NULL ,
 [CreatedBy]       int NOT NULL ,
 [CreatedOn]       datetime NOT NULL ,
 [UpdatedBy]       int NOT NULL ,
 [UpdatedOn]       datetime NOT NULL ,


 CONSTRAINT [PK_XmlFeedSourceAudit] PRIMARY KEY CLUSTERED ([XmlFeedSourceId] ASC),
 CONSTRAINT [FK_XmlFeedSource_XmlFeedSourceAudit_XmlFeedSourceId] FOREIGN KEY ([XmlFeedSourceId])  REFERENCES [SiteApplication].[XmlFeedSource]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1264] ON [SiteApplication].[XmlFeedSourceAudit] 
 (
  [XmlFeedSourceId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[XmlSportsFeed]

CREATE TABLE [SiteApplication].[XmlSportsFeed]
(
 [Id]        int IDENTITY (1, 1) NOT NULL ,
 [Url]       nvarchar(500) NOT NULL ,
 [IsDeleted] bit NOT NULL ,


 CONSTRAINT [PK_XmlSportsFeed] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [SiteApplication].[XmlSportsFeedAffiliatePermission]

CREATE TABLE [SiteApplication].[XmlSportsFeedAffiliatePermission]
(
 [AffiliateId]  int NOT NULL ,
 [PermissionId] int NOT NULL ,


 CONSTRAINT [PK_XmlSportsFeedPermission] PRIMARY KEY CLUSTERED ([AffiliateId] ASC, [PermissionId] ASC),
 CONSTRAINT [FK_Affiliate_XmlSportsFeedAffiliatePermission_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_SportsFeedPermission_XmlSportsFeedAffiliatePermission_PermissionId] FOREIGN KEY ([PermissionId])  REFERENCES [Lookup].[SportsFeedPermission]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1237] ON [SiteApplication].[XmlSportsFeedAffiliatePermission] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1244] ON [SiteApplication].[XmlSportsFeedAffiliatePermission] 
 (
  [PermissionId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[XmlSportsFeedPermission]

CREATE TABLE [SiteApplication].[XmlSportsFeedPermission]
(
 [PermissionId] int NOT NULL ,
 [SportsFeedId] int NOT NULL ,


 CONSTRAINT [PK_XmlSportsFeedPermission] PRIMARY KEY CLUSTERED ([PermissionId] ASC, [SportsFeedId] ASC),
 CONSTRAINT [FK_SportsFeedPermission_XmlSportsFeedPermission_PermissionId] FOREIGN KEY ([PermissionId])  REFERENCES [Lookup].[SportsFeedPermission]([Id]),
 CONSTRAINT [FK_XmlSportsFeed_XmlSportsFeedPermission_SportsFeedId] FOREIGN KEY ([SportsFeedId])  REFERENCES [SiteApplication].[XmlSportsFeed]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1251] ON [SiteApplication].[XmlSportsFeedPermission] 
 (
  [PermissionId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1254] ON [SiteApplication].[XmlSportsFeedPermission] 
 (
  [SportsFeedId] ASC
 )

GO







-- ************************************** [SiteApplication].[XmlWhiteList]

CREATE TABLE [SiteApplication].[XmlWhiteList]
(
 [Id]             int IDENTITY (1, 1) NOT NULL ,
 [StartIPAddress] bigint NOT NULL ,
 [EndIPAddress]   bigint NOT NULL ,
 [FeedId]         int NOT NULL ,
 [AffiliateId]    int NOT NULL ,


 CONSTRAINT [PK_XmlWhiteList] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Affiliate_XmlWhiteList_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_XmlFeed_XmlWhiteList_FeedId] FOREIGN KEY ([FeedId])  REFERENCES [SiteApplication].[XmlFeed]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1222] ON [SiteApplication].[XmlWhiteList] 
 (
  [FeedId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1225] ON [SiteApplication].[XmlWhiteList] 
 (
  [AffiliateId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[RegistrationStatus]

CREATE TABLE [Lookup].[RegistrationStatus]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_RegistrationStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Affiliate].[RegistrationInformation]

CREATE TABLE [Affiliate].[RegistrationInformation]
(
 [AffiliateId]    int NOT NULL ,
 [IPAddress]      nvarchar(25) NOT NULL ,
 [ReferrerString] nvarchar(15) NOT NULL ,
 [Date]           datetime NOT NULL ,
 [ApplicationId]  int NOT NULL ,


 CONSTRAINT [PK_RegistrationInformation] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [Affiliate_RegistrationInformation_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [Application_RegistrationInformation_ApplicationId] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_341] ON [Affiliate].[RegistrationInformation] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_387] ON [Affiliate].[RegistrationInformation] 
 (
  [ApplicationId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Authentication].[Role]

CREATE TABLE [Authentication].[Role]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Description] nvarchar(200) NOT NULL ,
 [SortOrder]   int NOT NULL ,


 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Affiliate].[Restrictions]

CREATE TABLE [Affiliate].[Restrictions]
(
 [PaymentBlockId] int NOT NULL ,
 [AffiliateId]    int NOT NULL ,
 [Pep]            bit NULL ,
 [Sanctioned]     bit NULL ,
 [UpdatedBy]      int NOT NULL ,
 [UpdatedDate]    datetime NOT NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [FK_Affiliate_AffiliateRestrictions_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_PaymentBlock_Restrictions_PaymentBlockId] FOREIGN KEY ([PaymentBlockId], [AffiliateId])  REFERENCES [Affiliate].[PaymentBlock]([Id], [AffiliateId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1122] ON [Affiliate].[Restrictions] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1176] ON [Affiliate].[Restrictions] 
 (
  [PaymentBlockId] ASC, 
  [AffiliateId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Authentication].[Security]

CREATE TABLE [Authentication].[Security]
(
 [Id]                   int IDENTITY (1, 1) NOT NULL ,
 [Username]             nvarchar(50) NOT NULL ,
 [Password]             nvarchar(max) NOT NULL ,
 [PasswordFormat]       nvarchar(max) NOT NULL ,
 [PasswordSalt]         nvarchar(max) NOT NULL ,
 [Question]             nvarchar(max) NOT NULL ,
 [Answer]               nvarchar(max) NOT NULL ,
 [ResetToken]           nvarchar(255) NOT NULL ,
 [ResetTokenExpiryDate] datetime NOT NULL ,
 [LoginAccessId]        int NOT NULL ,


 CONSTRAINT [PK_Security] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [LoginAccess] FOREIGN KEY ([LoginAccessId])  REFERENCES [Lookup].[LoginAccess]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_768] ON [Authentication].[Security] 
 (
  [LoginAccessId] ASC
 )

GO







-- ************************************** [Authentication].[RoleAction]

CREATE TABLE [Authentication].[RoleAction]
(
 [RoleId]   int NOT NULL ,
 [ActionId] int NOT NULL ,


 CONSTRAINT [PK_RoleAction] PRIMARY KEY CLUSTERED ([RoleId] ASC, [ActionId] ASC),
 CONSTRAINT [FK_Action_RoleAction_ActionId] FOREIGN KEY ([ActionId])  REFERENCES [Authentication].[Action]([Id]),
 CONSTRAINT [FK_Role_RoleAction_RoleId] FOREIGN KEY ([RoleId])  REFERENCES [Authentication].[Role]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_813] ON [Authentication].[RoleAction] 
 (
  [RoleId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_816] ON [Authentication].[RoleAction] 
 (
  [ActionId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[SportsFeedPermission]

CREATE TABLE [Lookup].[SportsFeedPermission]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_SportsFeedPermission] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[SecurityQuestion]

CREATE TABLE [Lookup].[SecurityQuestion]
(
 [Id]       int NOT NULL ,
 [Question] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_SecurityQuestion] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Affiliate].[SubAffiliate]

CREATE TABLE [Affiliate].[SubAffiliate]
(
 [AffiliateId]         int NOT NULL ,
 [AffiliateCampaignId] int NOT NULL ,
 [Value]               nvarchar(10) NOT NULL ,


 CONSTRAINT [PK_SubAffiliate] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [Affiliate_SubAffiliate_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [Campaign_SubAffiliate_AffiliateCampaignId] FOREIGN KEY ([AffiliateCampaignId], [Value])  REFERENCES [Affiliate].[Campaign]([Id], [Value])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_320] ON [Affiliate].[SubAffiliate] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_323] ON [Affiliate].[SubAffiliate] 
 (
  [AffiliateCampaignId] ASC, 
  [Value] ASC
 )

GO







-- ************************************** [Notification].[Status]

CREATE TABLE [Notification].[Status]
(
 [NotificationId] int NOT NULL ,
 [ReceivedOn]     datetime NOT NULL ,
 [ReadOn]         datetime NOT NULL ,
 [StatusId]       int NOT NULL ,


 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([NotificationId] ASC),
 CONSTRAINT [FK_Notification_Status_NotificationId] FOREIGN KEY ([NotificationId])  REFERENCES [Notification].[Notification]([Id]),
 CONSTRAINT [FK_NotificationStatus_Status_StatusId] FOREIGN KEY ([StatusId])  REFERENCES [Lookup].[NotificationStatus]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_929] ON [Notification].[Status] 
 (
  [StatusId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_960] ON [Notification].[Status] 
 (
  [NotificationId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [KYC].[Task]

CREATE TABLE [KYC].[Task]
(
 [Id]              int IDENTITY (1, 1) NOT NULL ,
 [CaseId]          int NOT NULL ,
 [StatusTypeId]    int NOT NULL ,
 [TaskTypeId]      int NULL ,
 [CreatedDate]     datetime NOT NULL ,
 [CompletedDate]   datetime NULL ,
 [PaymentDetailId] int NULL ,
 [BlockPaymentId]  int NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Case_Task_CaseId] FOREIGN KEY ([CaseId])  REFERENCES [KYC].[Case]([Id]),
 CONSTRAINT [FK_KycStatusType_Task_StatusTypeId] FOREIGN KEY ([StatusTypeId])  REFERENCES [Lookup].[KycStatusType]([Id]),
 CONSTRAINT [FK_KycTaskType_Task_TaskTypeId] FOREIGN KEY ([TaskTypeId])  REFERENCES [Lookup].[KycTaskType]([Id]),
 CONSTRAINT [FK_PaymentDetail_Task_PaymentDetailId] FOREIGN KEY ([PaymentDetailId])  REFERENCES [Affiliate].[PaymentDetail]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1093] ON [KYC].[Task] 
 (
  [StatusTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1128] ON [KYC].[Task] 
 (
  [TaskTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1134] ON [KYC].[Task] 
 (
  [CaseId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1145] ON [KYC].[Task] 
 (
  [PaymentDetailId] ASC
 )

GO







-- ************************************** [KYC].[TaskAudit]

CREATE TABLE [KYC].[TaskAudit]
(
 [TaskId]    int NOT NULL ,
 [UpdatedBy] int NOT NULL ,
 [UpdatedOn] datetime NOT NULL ,


 CONSTRAINT [PK_TaskAudit] PRIMARY KEY CLUSTERED ([TaskId] ASC),
 CONSTRAINT [FK_Login_TaskAudit_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Task_TaskAudit_TaskId] FOREIGN KEY ([TaskId])  REFERENCES [KYC].[Task]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1142] ON [KYC].[TaskAudit] 
 (
  [TaskId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1167] ON [KYC].[TaskAudit] 
 (
  [UpdatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Notification].[Template]

CREATE TABLE [Notification].[Template]
(
 [Id]                 int IDENTITY (1, 1) NOT NULL ,
 [NotificationTypeId] int NOT NULL ,
 [Message]            nvarchar(max) NOT NULL ,
 [Title]              nvarchar(max) NOT NULL ,
 [IsDeleted]          bit NOT NULL ,


 CONSTRAINT [PK_MessageTemplate] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_NotificationType_Template_NotificationTypeId] FOREIGN KEY ([NotificationTypeId])  REFERENCES [Lookup].[NotificationType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_974] ON [Notification].[Template] 
 (
  [NotificationTypeId] ASC
 )

GO







-- ************************************** [KYC].[TaskDetail]

CREATE TABLE [KYC].[TaskDetail]
(
 [Id]               int IDENTITY (1, 1) NOT NULL ,
 [TaskId]           int NOT NULL ,
 [FieldTypeId]      int NOT NULL ,
 [TriggeredBy]      int NOT NULL ,
 [TriggeredDate]    datetime NULL ,
 [DocumentResolved] int NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_KycFieldType_TaskChangeLog_FieldTypeId] FOREIGN KEY ([FieldTypeId])  REFERENCES [Lookup].[KycFieldType]([Id]),
 CONSTRAINT [FK_Login_TaskChangeLog_TriggeredBy] FOREIGN KEY ([TriggeredBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Task_TaskChangeLog_TaskId] FOREIGN KEY ([TaskId])  REFERENCES [KYC].[Task]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1125] ON [KYC].[TaskDetail] 
 (
  [TaskId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1155] ON [KYC].[TaskDetail] 
 (
  [FieldTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1170] ON [KYC].[TaskDetail] 
 (
  [TriggeredBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Affiliate].[TrackingValueSeed]

CREATE TABLE [Affiliate].[TrackingValueSeed]
(
 [Value] nvarchar(15) NOT NULL ,


 CONSTRAINT [PK_TrackingValueSeed] PRIMARY KEY CLUSTERED ([Value] ASC)
);
GO








-- ************************************** [Affiliate].[TrackingValues]

CREATE TABLE [Affiliate].[TrackingValues]
(
 [AffiliateId] int NOT NULL ,
 [LegacyRef]   nvarchar(15) NULL ,
 [Value]       nvarchar(15) NULL ,


 CONSTRAINT [PK_TrackingValues] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [Affiliate_TrackingValues_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [TrackingValueSeed_TrackingValues_Value] FOREIGN KEY ([Value])  REFERENCES [Affiliate].[TrackingValueSeed]([Value])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_332] ON [Affiliate].[TrackingValues] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_347] ON [Affiliate].[TrackingValues] 
 (
  [Value] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Authentication].[UserDetail]

CREATE TABLE [Authentication].[UserDetail]
(
 [LoginId]   int NOT NULL ,
 [FirstName] nvarchar(50) NOT NULL ,
 [LastName]  nvarchar(50) NOT NULL ,
 [Email]     nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED ([LoginId] ASC),
 CONSTRAINT [FK_Login_UserDetail_LoginId] FOREIGN KEY ([LoginId])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_748] ON [Authentication].[UserDetail] 
 (
  [LoginId] ASC
 )

GO







-- ************************************** [Affiliate].[TrackingVariables]

CREATE TABLE [Affiliate].[TrackingVariables]
(
 [AffiliateId]    int NOT NULL ,
 [VariableTypeId] int NOT NULL ,
 [Variable]       nvarchar(2) NOT NULL ,


 CONSTRAINT [PK_TrackingVariables] PRIMARY KEY CLUSTERED ([AffiliateId] ASC, [VariableTypeId] ASC, [Variable] ASC),
 CONSTRAINT [Affiliate_TrackingVariables_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_288] ON [Affiliate].[TrackingVariables] 
 (
  [AffiliateId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Authentication].[WindowsLogin]

CREATE TABLE [Authentication].[WindowsLogin]
(
 [LoginId]         int NOT NULL ,
 [WindowsLogin]    nvarchar(255) NOT NULL ,
 [AvatarId]        int NOT NULL ,
 [TeamLeadLoginId] int NOT NULL ,


 CONSTRAINT [PK_WindowsLogin] PRIMARY KEY CLUSTERED ([LoginId] ASC),
 CONSTRAINT [FK_Avatar_WindowsLogin_AvatarId] FOREIGN KEY ([AvatarId])  REFERENCES [Authentication].[Avatar]([Id]),
 CONSTRAINT [FK_Login_WindowsLogin_LoginId] FOREIGN KEY ([LoginId])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Login_WindowsLogin_TeamLeadLoginId] FOREIGN KEY ([TeamLeadLoginId])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1327] ON [Authentication].[WindowsLogin] 
 (
  [TeamLeadLoginId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_667] ON [Authentication].[WindowsLogin] 
 (
  [LoginId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_782] ON [Authentication].[WindowsLogin] 
 (
  [AvatarId] ASC
 )

GO







-- ************************************** [Affiliate].[Websites]

CREATE TABLE [Affiliate].[Websites]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [AffiliateId] int NOT NULL ,
 [Website]     nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_Websites] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Affiliate_Websites_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_296] ON [Affiliate].[Websites] 
 (
  [AffiliateId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[News]

CREATE TABLE [SiteApplication].[News]
(
 [Id]            int IDENTITY (1, 1) NOT NULL ,
 [PublishDate]   date NULL ,
 [Name]          nvarchar(255) NULL ,
 [IsDeleted]     bit NULL ,
 [ProductTypeId] int NULL ,


 CONSTRAINT [SiteApplication_News_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [ProductType_News_ProductTypeId] FOREIGN KEY ([ProductTypeId])  REFERENCES [Lookup].[ProductType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_803] ON [SiteApplication].[News] 
 (
  [ProductTypeId] ASC
 )

GO







-- ************************************** [Affiliate].[NetworkLink]

CREATE TABLE [Affiliate].[NetworkLink]
(
 [AffiliateId]      int NOT NULL ,
 [ChildAffiliateId] int NOT NULL ,
 [StartDate]        date NOT NULL ,
 [EndDate]          date NOT NULL ,
 [ModifiedOn]       datetime NOT NULL ,
 [UpdatedBy]        int NOT NULL ,


 CONSTRAINT [PK_AffiliateNetworkLink] PRIMARY KEY CLUSTERED ([AffiliateId] ASC, [ChildAffiliateId] ASC),
 CONSTRAINT [Affiliate_AffiliateNetworkLink_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [Affiliate_AffiliateNetworkLink_ChildAffiliateId] FOREIGN KEY ([ChildAffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_Login_NetworkLink_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_604] ON [Affiliate].[NetworkLink] 
 (
  [ChildAffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_610] ON [Affiliate].[NetworkLink] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_735] ON [Affiliate].[NetworkLink] 
 (
  [UpdatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SiteApplication].[NewsContent]

CREATE TABLE [SiteApplication].[NewsContent]
(
 [Id]            int IDENTITY (1, 1) NOT NULL ,
 [NewsId]        int NULL ,
 [ApplicationId] int NULL ,
 [Heading]       nvarchar(255) NULL ,
 [Body]          nvarchar(max) NULL ,
 [Teaser]        nvarchar(255) NULL ,


 CONSTRAINT [SiteApplication_NewsContent_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_NewsContent_208] FOREIGN KEY ([NewsId])  REFERENCES [SiteApplication].[News]([Id]),
 CONSTRAINT [FK_NewsContent_210] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id])
);
GO








-- ************************************** [SiteApplication].[NewsAudit]

CREATE TABLE [SiteApplication].[NewsAudit]
(
 [Id]           int IDENTITY (1, 1) NOT NULL ,
 [NewsId]       int NULL ,
 [ModifiedDate] datetime NULL ,
 [CreatedDate]  datetime NULL ,
 [CreatedBy]    int NULL ,
 [UpdatedBy]    int NOT NULL ,


 CONSTRAINT [SiteApplication_NewsAudit_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Login_NewsAudit_CreatedBy] FOREIGN KEY ([CreatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Login_NewsAudit_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_NewsAudit_212] FOREIGN KEY ([NewsId])  REFERENCES [SiteApplication].[News]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_720] ON [SiteApplication].[NewsAudit] 
 (
  [UpdatedBy] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_723] ON [SiteApplication].[NewsAudit] 
 (
  [CreatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Affiliate].[Note]

CREATE TABLE [Affiliate].[Note]
(
 [Id]           int IDENTITY (1, 1) NOT NULL ,
 [AffiliateId]  int NOT NULL ,
 [ReminderDate] datetime NOT NULL ,
 [Title]        nvarchar(500) NOT NULL ,
 [Description]  nvarchar(max) NOT NULL ,
 [IsDeleted]    bit NOT NULL ,


 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Affiliate_Note_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1313] ON [Affiliate].[Note] 
 (
  [AffiliateId] ASC
 )

GO







-- ************************************** [Affiliate].[NoteAudit]

CREATE TABLE [Affiliate].[NoteAudit]
(
 [NoteId]    int NOT NULL ,
 [CreatedBy] int NOT NULL ,
 [CreatedOn] datetime NOT NULL ,
 [UpdatedBy] int NOT NULL ,
 [UpdatedOn] datetime NOT NULL ,


 CONSTRAINT [PK_NoteAudit] PRIMARY KEY CLUSTERED ([NoteId] ASC),
 CONSTRAINT [FK_Note_NoteAudit_NoteId] FOREIGN KEY ([NoteId])  REFERENCES [Affiliate].[Note]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1323] ON [Affiliate].[NoteAudit] 
 (
  [NoteId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Notification].[Notification]

CREATE TABLE [Notification].[Notification]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [TemplateId]  int NOT NULL ,
 [IsDeleted]   bit NOT NULL ,
 [IsProcessed] bit NOT NULL ,


 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Template_Notification_TemplateId] FOREIGN KEY ([TemplateId])  REFERENCES [Notification].[Template]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_981] ON [Notification].[Notification] 
 (
  [TemplateId] ASC
 )

GO







-- ************************************** [KYC].[Notes]

CREATE TABLE [KYC].[Notes]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [CaseId]      int NOT NULL ,
 [NoteAction]  nvarchar(4000) NOT NULL ,
 [Note]        nvarchar(max) NULL ,
 [CreatedDate] datetime NOT NULL ,
 [CreatedBy]   int NOT NULL ,


 CONSTRAINT [CLUSTERED] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Case_Notes_CaseId] FOREIGN KEY ([CaseId])  REFERENCES [KYC].[Case]([Id]),
 CONSTRAINT [FK_Login_Notes_CreatedBy] FOREIGN KEY ([CreatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1131] ON [KYC].[Notes] 
 (
  [CaseId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1161] ON [KYC].[Notes] 
 (
  [CreatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[NotificationSourceType]

CREATE TABLE [Lookup].[NotificationSourceType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_NotificationSourceType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[NotificationCategory]

CREATE TABLE [Lookup].[NotificationCategory]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_NotificationCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[NotificationStatus]

CREATE TABLE [Lookup].[NotificationStatus]
(
 [Id]          int NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_NotificationStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[NotificationType]

CREATE TABLE [Lookup].[NotificationType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,
 [CategoryId]  int NOT NULL ,


 CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_NotificationCategory_NotificationType_CategoryId] FOREIGN KEY ([CategoryId])  REFERENCES [Lookup].[NotificationCategory]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_922] ON [Lookup].[NotificationType] 
 (
  [CategoryId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Affiliate].[PaymentDetail]

CREATE TABLE [Affiliate].[PaymentDetail]
(
 [Id]              int IDENTITY (1, 1) NOT NULL ,
 [AffiliateId]     int NOT NULL ,
 [PaymentMethodId] int NOT NULL ,
 [Description]     nvarchar(255) NOT NULL ,
 [PaymentDetail]   varbinary(max) NOT NULL ,
 [CurrencyId]      int NOT NULL ,


 CONSTRAINT [PK_PaymentDetail] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Affiliate_PaymentDetail_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_Currency_PaymentDetail_CurrencyId] FOREIGN KEY ([CurrencyId])  REFERENCES [Lookup].[Currency]([Id]),
 CONSTRAINT [PaymentMethod_PaymentDetail_PaymentMethodId] FOREIGN KEY ([PaymentMethodId])  REFERENCES [Lookup].[PaymentMethod]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_306] ON [Affiliate].[PaymentDetail] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_647] ON [Affiliate].[PaymentDetail] 
 (
  [CurrencyId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_789] ON [Affiliate].[PaymentDetail] 
 (
  [PaymentMethodId] ASC
 )

GO







-- ************************************** [Affiliate].[PaymentBlock]

CREATE TABLE [Affiliate].[PaymentBlock]
(
 [Id]                 int IDENTITY (1, 1) NOT NULL ,
 [AffiliateId]        int NOT NULL ,
 [Reason]             nvarchar(250) NOT NULL ,
 [BlockedBy]          int NOT NULL ,
 [ReleaseBy]          int NOT NULL ,
 [BlockedDate]        datetme NOT NULL ,
 [AllowManualRelease] bit NOT NULL ,


 CONSTRAINT [PK_PaymentBlock] PRIMARY KEY CLUSTERED ([Id] ASC, [AffiliateId] ASC),
 CONSTRAINT [FK_Affiliate_PaymentBlock_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_Login_PamyentBlov] FOREIGN KEY ([ReleaseBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Login_PaymentBlock_BlockedBy] FOREIGN KEY ([BlockedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_859] ON [Affiliate].[PaymentBlock] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_865] ON [Affiliate].[PaymentBlock] 
 (
  [BlockedBy] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_868] ON [Affiliate].[PaymentBlock] 
 (
  [ReleaseBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[ProductType]

CREATE TABLE [Lookup].[ProductType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[PaymentMethod]

CREATE TABLE [Lookup].[PaymentMethod]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Media].[Publication]

CREATE TABLE [Media].[Publication]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Name]        nvarchar(255) NOT NULL ,
 [Description] nvarchar(max) NULL ,


 CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Notification].[Queue]

CREATE TABLE [Notification].[Queue]
(
 [NotificationId] int NOT NULL ,
 [SourceTypeId]   int NOT NULL ,
 [SourceId]       int NOT NULL ,
 [CustomText]     nvarchar(max) NOT NULL ,


 CONSTRAINT [PK_Queue] PRIMARY KEY CLUSTERED ([NotificationId] ASC),
 CONSTRAINT [FK_Notification_Queue_NotificationId] FOREIGN KEY ([NotificationId])  REFERENCES [Notification].[Notification]([Id]),
 CONSTRAINT [FK_NotificationSourceType_Queue_SourceTypeId] FOREIGN KEY ([SourceTypeId])  REFERENCES [Lookup].[NotificationSourceType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_953] ON [Notification].[Queue] 
 (
  [NotificationId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_971] ON [Notification].[Queue] 
 (
  [SourceTypeId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Deal].[Rate]

CREATE TABLE [Deal].[Rate]
(
 [Id]                  int IDENTITY (1, 1) NOT NULL ,
 [DealConfigurationId] int NOT NULL ,
 [DealRateTypeId]      int NOT NULL ,
 [MetricTypeId]        int NOT NULL ,
 [DealRate]            decimal(8,2) NOT NULL ,
 [UpdatedBy]           int NOT NULL ,
 [UpdatedDate]         int NOT NULL ,


 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [DealConfiguration_Rate_DealConfigurationId] FOREIGN KEY ([DealConfigurationId])  REFERENCES [Deal].[DealConfiguration]([Id]),
 CONSTRAINT [DealRateType_Rate_DealRateTypeId] FOREIGN KEY ([DealRateTypeId])  REFERENCES [Lookup].[DealRateType]([Id]),
 CONSTRAINT [FK_Login_Rate_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [MetricType_Rate_MetricTypeId] FOREIGN KEY ([MetricTypeId])  REFERENCES [Lookup].[MetricType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_612] ON [Deal].[Rate] 
 (
  [MetricTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_653] ON [Deal].[Rate] 
 (
  [DealRateTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_657] ON [Deal].[Rate] 
 (
  [DealConfigurationId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_707] ON [Deal].[Rate] 
 (
  [UpdatedBy] ASC
 )

GO







-- ************************************** [Deal].[Range]

CREATE TABLE [Deal].[Range]
(
 [RateId]        int NOT NULL ,
 [MeasureTypeId] int NOT NULL ,
 [RangeStart]    int NOT NULL ,
 [RangeEnd]      int NOT NULL ,


 CONSTRAINT [PK_Range] PRIMARY KEY CLUSTERED ([RateId] ASC),
 CONSTRAINT [MeasureType_Range_MeasureTypeId] FOREIGN KEY ([MeasureTypeId])  REFERENCES [Lookup].[MeasureType]([Id]),
 CONSTRAINT [Rate_Range_RateId] FOREIGN KEY ([RateId])  REFERENCES [Deal].[Rate]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_647] ON [Deal].[Range] 
 (
  [RateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_650] ON [Deal].[Range] 
 (
  [MeasureTypeId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[MeasureType]

CREATE TABLE [Lookup].[MeasureType]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_MeasureType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[Market]

CREATE TABLE [Lookup].[Market]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,
 [EntityId]    int NOT NULL ,


 CONSTRAINT [PK_Market] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Media].[Media]

CREATE TABLE [Media].[Media]
(
 [Id]            int IDENTITY (1, 1) NOT NULL ,
 [Name]          nvarchar(255) NOT NULL ,
 [Description]   nvarchar(max) NOT NULL ,
 [PublicationId] int NULL ,
 [ImageId]       int NULL ,
 [LandingPageId] int NULL ,
 [CountryId]     int NULL ,
 [DeviceId]      int NULL ,
 [ProductTypeId] int NULL ,
 [SubProductId]  int NULL ,
 [MetaDataId]    int NULL ,
 [CategoryId]    int NULL ,


 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Category_Media_CategoryId] FOREIGN KEY ([CategoryId])  REFERENCES [Media].[Category]([Id]),
 CONSTRAINT [Country_Media_CountryId] FOREIGN KEY ([CountryId])  REFERENCES [Lookup].[Country]([Id]),
 CONSTRAINT [Image_Media_ImageId] FOREIGN KEY ([ImageId])  REFERENCES [Media].[Image]([Id]),
 CONSTRAINT [LandingPage_Media_LandingPageId] FOREIGN KEY ([LandingPageId])  REFERENCES [Media].[LandingPage]([Id]),
 CONSTRAINT [MetaData_Media_MetaDataId] FOREIGN KEY ([MetaDataId])  REFERENCES [Media].[MetaData]([Id]),
 CONSTRAINT [ProductType_Media_ProductTypeId] FOREIGN KEY ([ProductTypeId])  REFERENCES [Lookup].[ProductType]([Id]),
 CONSTRAINT [Publication_Media_PublicationId] FOREIGN KEY ([PublicationId])  REFERENCES [Media].[Publication]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_485] ON [Media].[Media] 
 (
  [ImageId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_488] ON [Media].[Media] 
 (
  [PublicationId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_492] ON [Media].[Media] 
 (
  [LandingPageId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_496] ON [Media].[Media] 
 (
  [CategoryId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_499] ON [Media].[Media] 
 (
  [MetaDataId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_675] ON [Media].[Media] 
 (
  [ProductTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_679] ON [Media].[Media] 
 (
  [CountryId] ASC
 )

GO







-- ************************************** [Media].[MediaCurrency]

CREATE TABLE [Media].[MediaCurrency]
(
 [MediaId]    int NOT NULL ,
 [CurrencyId] int NOT NULL ,


 CONSTRAINT [PK_MediaCurrency] PRIMARY KEY CLUSTERED ([MediaId] ASC, [CurrencyId] ASC),
 CONSTRAINT [Currency_MediaCurrency_CurrencyId] FOREIGN KEY ([CurrencyId])  REFERENCES [Lookup].[Currency]([Id]),
 CONSTRAINT [Media_MediaCurrency_MediaId] FOREIGN KEY ([MediaId])  REFERENCES [Media].[Media]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_661] ON [Media].[MediaCurrency] 
 (
  [CurrencyId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_664] ON [Media].[MediaCurrency] 
 (
  [MediaId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Affiliate].[MergedAffiliate]

CREATE TABLE [Affiliate].[MergedAffiliate]
(
 [AffiliateId]       int NOT NULL ,
 [ParentAffiliateId] int NOT NULL ,


 CONSTRAINT [PK_MergedAffiliate] PRIMARY KEY CLUSTERED ([AffiliateId] ASC),
 CONSTRAINT [Affiliate_MergedAffiliate_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [Affiliate_MergedAffiliate_ParentAffiliateId] FOREIGN KEY ([ParentAffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_380] ON [Affiliate].[MergedAffiliate] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_383] ON [Affiliate].[MergedAffiliate] 
 (
  [ParentAffiliateId] ASC
 )

GO







-- ************************************** [Media].[MediaLanguage]

CREATE TABLE [Media].[MediaLanguage]
(
 [MediaId]    int NOT NULL ,
 [LanguageId] int NOT NULL ,


 CONSTRAINT [PK_MediaLanguage] PRIMARY KEY CLUSTERED ([MediaId] ASC),
 CONSTRAINT [Language_MediaLanguage_LanguageId] FOREIGN KEY ([LanguageId])  REFERENCES [Lookup].[Language]([Id]),
 CONSTRAINT [Media_MediaLanguage_MediaId] FOREIGN KEY ([MediaId])  REFERENCES [Media].[Media]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_704] ON [Media].[MediaLanguage] 
 (
  [MediaId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_708] ON [Media].[MediaLanguage] 
 (
  [LanguageId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Media].[MetaData]

CREATE TABLE [Media].[MetaData]
(
 [Id]            int IDENTITY (1, 1) NOT NULL ,
 [AlternateText] nvarchar(255) NULL ,
 [ReferbackId]   int NULL ,
 [UpdatedBy]     int NULL ,
 [UpdatedDate]   int NULL ,


 CONSTRAINT [PK_MetaData] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Login_Metadata_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_704] ON [Media].[MetaData] 
 (
  [UpdatedBy] ASC
 )

GO







-- ************************************** [Affiliate].[MergeHistory]

CREATE TABLE [Affiliate].[MergeHistory]
(
 [AffiliateId]      int NOT NULL ,
 [ChildAffiliateId] int NOT NULL ,
 [Exposure]         money NOT NULL ,
 [MergedBy]         int NOT NULL ,
 [MergedDate]       datetime NOT NULL ,
 [Reason]           nvarchar(max) NOT NULL ,


 CONSTRAINT [PK_MergeHistory] PRIMARY KEY CLUSTERED ([AffiliateId] ASC, [ChildAffiliateId] ASC),
 CONSTRAINT [FK_Affiliate_MergeHistory_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_Affiliate_MergeHistory_ChildAffiliateId] FOREIGN KEY ([ChildAffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1295] ON [Affiliate].[MergeHistory] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_1298] ON [Affiliate].[MergeHistory] 
 (
  [ChildAffiliateId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[MetricType]

CREATE TABLE [Lookup].[MetricType]
(
 [Id]                    int IDENTITY (1, 1) NOT NULL ,
 [Description]           nvarchar(255) NOT NULL ,
 [IsPurchaseFeeIncluded] bit NOT NULL ,


 CONSTRAINT [PK_MetricType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [SiteApplication].[Navigation]

CREATE TABLE [SiteApplication].[Navigation]
(
 [Id]                        int IDENTITY (1, 1) NOT NULL ,
 [ApplicationId]             int NULL ,
 [Title]                     nvarchar(255) NULL ,
 [Url]                       nvarchar(255) NULL ,
 [ParentId]                  int NULL ,
 [RequiressAffiliateContext] bit NULL ,
 [HasRouterOutput]           bit NULL ,
 [IsPost]                    bit NULL ,
 [OpenInNewTab]              bit NULL ,
 [Icon]                      nvarchar(255) NULL ,


 CONSTRAINT [SiteApplication_Navigation_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Navigation_206] FOREIGN KEY ([ApplicationId])  REFERENCES [SiteApplication].[Application]([Id]),
 CONSTRAINT [Navigation_Navigation_ParentId] FOREIGN KEY ([ParentId])  REFERENCES [SiteApplication].[Navigation]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_806] ON [SiteApplication].[Navigation] 
 (
  [ParentId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Authentication].[IPWhiteList]

CREATE TABLE [Authentication].[IPWhiteList]
(
 [Id]      int IDENTITY (1, 1) NOT NULL ,
 [LoginId] int NOT NULL ,
 [IPStart] bigint NOT NULL ,
 [IPEnd]   bigint NOT NULL ,


 CONSTRAINT [PK_IPWhiteList] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_Login_IPWhiteList_LoginId] FOREIGN KEY ([LoginId])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_1274] ON [Authentication].[IPWhiteList] 
 (
  [LoginId] ASC
 )

GO







-- ************************************** [Media].[Image]

CREATE TABLE [Media].[Image]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Name]        nvarchar(255) NOT NULL ,
 [Description] nvarchar(max) NOT NULL ,
 [FileId]      int NOT NULL ,
 [ThumbnailId] int NOT NULL ,


 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_File_Image_FileId] FOREIGN KEY ([FileId])  REFERENCES [Media].[File]([Id]),
 CONSTRAINT [FK_Image_Image_ThumbnailId] FOREIGN KEY ([ThumbnailId])  REFERENCES [Media].[Image]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_692] ON [Media].[Image] 
 (
  [FileId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_695] ON [Media].[Image] 
 (
  [ThumbnailId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Media].[Category]

CREATE TABLE [Media].[Category]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,


 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Authentication].[ClientLogin]

CREATE TABLE [Authentication].[ClientLogin]
(
 [LoginId]              int NOT NULL ,
 [SecurityId]           int NOT NULL ,
 [LastLoggedInDate]     datetime NOT NULL ,
 [LastImpersonatedById] int NOT NULL ,
 [AffiliateId]          int NOT NULL ,
 [RegistrationStatusId] int NOT NULL ,
 [Title]                nvarchar(5) NOT NULL ,
 [DateOfBirth]          date NOT NULL ,
 [TelephoneNumber]      nvarchar(15) NOT NULL ,
 [WorkNumber]           nvarchar(15) NOT NULL ,
 [MobileNumber]         nvarchar(15) NOT NULL ,


 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([LoginId] ASC),
 CONSTRAINT [FK_Affiliate_ClientLogin_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_Login_ClientLogin_LastImpersonatedById] FOREIGN KEY ([LastImpersonatedById])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Login_ClientLogin_LoginId] FOREIGN KEY ([LoginId])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_RegistrationStatus_ClientLogin_RegistrationStatusId] FOREIGN KEY ([RegistrationStatusId])  REFERENCES [Lookup].[RegistrationStatus]([Id]),
 CONSTRAINT [Security_Login_SecurityId] FOREIGN KEY ([SecurityId])  REFERENCES [Authentication].[Security]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_655] ON [Authentication].[ClientLogin] 
 (
  [LoginId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_701] ON [Authentication].[ClientLogin] 
 (
  [LastImpersonatedById] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_757] ON [Authentication].[ClientLogin] 
 (
  [RegistrationStatusId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_760] ON [Authentication].[ClientLogin] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_771] ON [Authentication].[ClientLogin] 
 (
  [SecurityId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[Country]

CREATE TABLE [Lookup].[Country]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Name]        nvarchar(255) NULL ,
 [CountryCode] smallint NULL ,
 [ISOCode]     char(2) NULL ,


 CONSTRAINT [Lookup_Country_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Lookup].[ContactUsCategory]

CREATE TABLE [Lookup].[ContactUsCategory]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [Description] nvarchar(255) NULL ,


 CONSTRAINT [Lookup_ContactUsCategory_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO








"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Lookup].[Currency]

CREATE TABLE [Lookup].[Currency]
(
 [Id]           int IDENTITY (1, 1) NOT NULL ,
 [FriendlyName] nvarchar(255) NULL ,
 [Code]         nvarchar(50) NULL ,
 [Symbol]       nvarchar(3) NULL ,


 CONSTRAINT [Lookup_Currency_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO








-- ************************************** [Affiliate].[CurrencyThreshold]

CREATE TABLE [Affiliate].[CurrencyThreshold]
(
 [AffiliateId] int NOT NULL ,
 [CurrencyId]  int NOT NULL ,
 [Threshold]   decimal(18,2) NULL ,


 CONSTRAINT [PK_CurrencyThreshold] PRIMARY KEY CLUSTERED ([AffiliateId] ASC, [CurrencyId] ASC),
 CONSTRAINT [Affiliate_CurrencyThreshold_AffiliateId] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [Currency_CurrencyThreshold_CurrencyId] FOREIGN KEY ([CurrencyId])  REFERENCES [Lookup].[Currency]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_280] ON [Affiliate].[CurrencyThreshold] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_796] ON [Affiliate].[CurrencyThreshold] 
 (
  [CurrencyId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Deal].[Deal]

CREATE TABLE [Deal].[Deal]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [AffiliateId] int NOT NULL ,
 [MarketId]    int NOT NULL ,
 [Description] nvarchar(255) NOT NULL ,
 [IsInactive]  bit NOT NULL ,


 CONSTRAINT [PK_Deal] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Market_Deal_MarketId] FOREIGN KEY ([MarketId])  REFERENCES [Lookup].[Market]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_631] ON [Deal].[Deal] 
 (
  [MarketId] ASC
 )

GO







-- ************************************** [Deal].[DealActivity]

CREATE TABLE [Deal].[DealActivity]
(
 [DealId]                int NOT NULL ,
 [CreatedBy]             int NOT NULL ,
 [UpdatedBy]             int NOT NULL ,
 [LastUpdatedDate]       datetime NOT NULL ,
 [LastQualificationDate] datetime NOT NULL ,
 [LastActivePDate]       datetime NOT NULL ,


 CONSTRAINT [PK_DealActivity] PRIMARY KEY CLUSTERED ([DealId] ASC),
 CONSTRAINT [Deal_DealActivity_DealId] FOREIGN KEY ([DealId])  REFERENCES [Deal].[Deal]([Id]),
 CONSTRAINT [FK_Login_DealActivity_CreatedBy] FOREIGN KEY ([CreatedBy])  REFERENCES [Authentication].[Login]([Id]),
 CONSTRAINT [FK_Login_DealActivity_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_638] ON [Deal].[DealActivity] 
 (
  [DealId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_711] ON [Deal].[DealActivity] 
 (
  [CreatedBy] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_714] ON [Deal].[DealActivity] 
 (
  [UpdatedBy] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Deal].[DealConfiguration]

CREATE TABLE [Deal].[DealConfiguration]
(
 [Id]                     int IDENTITY (1, 1) NOT NULL ,
 [DealId]                 int NOT NULL ,
 [CurrencyId]             int NOT NULL ,
 [DealTypeId]             int NOT NULL ,
 [DepositWagerCurrencyId] int NOT NULL ,
 [StartDate]              date NOT NULL ,
 [EndDate]                date NOT NULL ,
 [MinimumWagerAmount]     decimal(18,2) NOT NULL ,
 [MinimumDepositAmount]   decimal(18,2) NOT NULL ,


 CONSTRAINT [PK_DealConfiguration] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [Currency_DealConfiguration_CurrencyId] FOREIGN KEY ([CurrencyId])  REFERENCES [Lookup].[Currency]([Id]),
 CONSTRAINT [Currency_DealConfiguration_DepositWagerCurrencyId] FOREIGN KEY ([DepositWagerCurrencyId])  REFERENCES [Lookup].[Currency]([Id]),
 CONSTRAINT [Deal_DealConfiguration_DealId] FOREIGN KEY ([DealId])  REFERENCES [Deal].[Deal]([Id]),
 CONSTRAINT [DealType_DealConfiguration_DealTypeId] FOREIGN KEY ([DealTypeId])  REFERENCES [Lookup].[DealType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_608] ON [Deal].[DealConfiguration] 
 (
  [CurrencyId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_619] ON [Deal].[DealConfiguration] 
 (
  [DealTypeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_624] ON [Deal].[DealConfiguration] 
 (
  [DealId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_829] ON [Deal].[DealConfiguration] 
 (
  [DepositWagerCurrencyId] ASC
 )

GO







-- ************************************** [Deal].[DealConfigurationRange]

CREATE TABLE [Deal].[DealConfigurationRange]
(
 [Id]                           int IDENTITY (1, 1) NOT NULL ,
 [DealConfigurationId]          int NOT NULL ,
 [DealConfigurationRangeTypeId] int NOT NULL ,
 [Start]                        int NOT NULL ,
 [End]                          int NOT NULL ,


 CONSTRAINT [PK_DealConfiguration] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [DealConfiguration_DealConfigurationRange_DealConfigurationId] FOREIGN KEY ([DealConfigurationId])  REFERENCES [Deal].[DealConfiguration]([Id]),
 CONSTRAINT [DealConfigurationRangeType_DealConfigurationRange_DealConfigurationRangeTypeId] FOREIGN KEY ([DealConfigurationRangeTypeId])  REFERENCES [Lookup].[DealConfigurationRangeType]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_605] ON [Deal].[DealConfigurationRange] 
 (
  [DealConfigurationId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_786] ON [Deal].[DealConfigurationRange] 
 (
  [DealConfigurationRangeTypeId] ASC
 )

GO







"

"-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Affiliate].[CampaignValueSeed]

CREATE TABLE [Affiliate].[CampaignValueSeed]
(
 [Value] nvarchar(10) NOT NULL ,


 CONSTRAINT [PK_CampaignValueSeed] PRIMARY KEY CLUSTERED ([Value] ASC)
);
GO








-- ************************************** [Affiliate].[Campaign]

CREATE TABLE [Affiliate].[Campaign]
(
 [Id]          int IDENTITY (1, 1) NOT NULL ,
 [AffiliateId] int NOT NULL ,
 [Name]        nvarchar(255) NOT NULL ,
 [Variable]    nvarchar(255) NOT NULL ,
 [Value]       nvarchar(10) NOT NULL ,
 [UpdatedBy]   int NOT NULL ,
 [UpdatedDate] datetime NOT NULL ,
 [IsDeleted]   bit NOT NULL ,


 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED ([Id] ASC, [Value] ASC),
 CONSTRAINT [FK_260] FOREIGN KEY ([AffiliateId])  REFERENCES [Affiliate].[Affiliate]([Id]),
 CONSTRAINT [FK_CampaignValueSeed_Campaign_Value] FOREIGN KEY ([Value])  REFERENCES [Affiliate].[CampaignValueSeed]([Value]),
 CONSTRAINT [FK_Login_Campaign_UpdatedBy] FOREIGN KEY ([UpdatedBy])  REFERENCES [Authentication].[Login]([Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_260] ON [Affiliate].[Campaign] 
 (
  [AffiliateId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_738] ON [Affiliate].[Campaign] 
 (
  [UpdatedBy] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_788] ON [Affiliate].[Campaign] 
 (
  [Value] ASC
 )

GO







"

