-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: namemaxx_bzc
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Sabareesan
-- Table structure for table `adjustment_reason`
--

DROP TABLE IF EXISTS `adjustment_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjustment_reason` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `inventoryid` int DEFAULT NULL,
  `inventoryCode` varchar(255) DEFAULT NULL,
  `oldQty` int DEFAULT NULL,
  `newQty` int DEFAULT NULL,
  `gap` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `companyId` int DEFAULT NULL,
  `datePerformed` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `companyId` (`companyId`),
  KEY `inventoryid` (`inventoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_account`
--

DROP TABLE IF EXISTS `bca_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `ParentID` int DEFAULT '0',
  `isCategory` tinyint(1) DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AcctTypeID` int DEFAULT '0',
  `AcctCategoryID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `ClientVendorID` int DEFAULT '0',
  `DepositPaymentID` int DEFAULT '0',
  `CustomerStartingBalance` double DEFAULT '0',
  `CustomerCurrentBalance` double DEFAULT '0',
  `VendorStartingBalance` double DEFAULT '0',
  `VendorCurrentBalance` double DEFAULT '0',
  `Active` int NOT NULL DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FirstCheck` int DEFAULT '0',
  `LastCheck` int DEFAULT '0',
  `MAINACCOUNT` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=62535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_accountable`
--

DROP TABLE IF EXISTS `bca_accountable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_accountable` (
  `PayableID` int NOT NULL AUTO_INCREMENT,
  `InvoiceID` int DEFAULT '0',
  `PayeeCvID` int DEFAULT '0',
  `PayeeCvServiceID` int DEFAULT '0',
  `PayerCvID` int DEFAULT '0',
  `PayerCvServiceID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT '0.0000',
  `Memo` varchar(50) DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `Ref` varchar(100) DEFAULT NULL,
  `PayFromID` int DEFAULT '0',
  `PaymentCompleted` tinyint(1) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `CreditCardID` int DEFAULT '0',
  `Deleted` tinyint(1) DEFAULT NULL,
  `PaymentTypeID` int DEFAULT '0',
  `IsPayable` tinyint(1) DEFAULT NULL,
  `CheckNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PayableID`),
  UNIQUE KEY `PayableID` (`PayableID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `CreditCardID` (`CreditCardID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `PayerCvID` (`PayerCvID`),
  KEY `PayFromID` (`PayFromID`),
  KEY `PaymentTypeID` (`PaymentTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_acctcategory`
--

DROP TABLE IF EXISTS `bca_acctcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_acctcategory` (
  `AcctCategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  KEY `AcctCategoryID` (`AcctCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_accttype`
--

DROP TABLE IF EXISTS `bca_accttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_accttype` (
  `AcctTypeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `ParentAcctTypeID` int DEFAULT '0',
  `RootAcctTypeID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  UNIQUE KEY `AcctTypeID` (`AcctTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_activestoreforproductssubmission`
--

DROP TABLE IF EXISTS `bca_activestoreforproductssubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_activestoreforproductssubmission` (
  `CompanyID` int DEFAULT NULL,
  `StoreName` varchar(255) DEFAULT NULL,
  `storeID` int DEFAULT NULL,
  `storeTypeID` int DEFAULT NULL,
  `Active` int DEFAULT NULL,
  KEY `storeID` (`storeID`),
  KEY `storeTypeID` (`storeTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_amazoncategorytemplate`
--

DROP TABLE IF EXISTS `bca_amazoncategorytemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_amazoncategorytemplate` (
  `CategoryTemplateID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL,
  `TemplateFileName` varchar(50) DEFAULT NULL,
  `Data` longtext,
  `ColumnHeaderData` longtext,
  PRIMARY KEY (`CategoryTemplateID`),
  KEY `CategoryTemplateID` (`CategoryTemplateID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_apmemorizedgroup`
--

DROP TABLE IF EXISTS `bca_apmemorizedgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_apmemorizedgroup` (
  `GroupID` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(50) NOT NULL,
  `DueDay` int DEFAULT '0',
  `AddedDate` datetime DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  PRIMARY KEY (`GroupID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_apmemorizedingroup`
--

DROP TABLE IF EXISTS `bca_apmemorizedingroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_apmemorizedingroup` (
  `MemorizeID` int NOT NULL DEFAULT '0',
  `BillingGroupID` int NOT NULL DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  KEY `BillingGroupID` (`BillingGroupID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `MemorizeID` (`MemorizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_argroupbilling`
--

DROP TABLE IF EXISTS `bca_argroupbilling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_argroupbilling` (
  `BillingNumber` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `IsBillingPrinted` tinyint(1) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_att1`
--

DROP TABLE IF EXISTS `bca_att1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_att1` (
  `Att1_ID` int NOT NULL AUTO_INCREMENT,
  `Att1_Name` varchar(50) DEFAULT NULL,
  `Att1_Nickname` varchar(50) DEFAULT NULL,
  KEY `Att1_ID` (`Att1_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_att2`
--

DROP TABLE IF EXISTS `bca_att2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_att2` (
  `Att2_ID` int NOT NULL AUTO_INCREMENT,
  `Att2_Name` varchar(50) DEFAULT NULL,
  `Att2_Nickname` varchar(50) DEFAULT NULL,
  KEY `Att2_ID` (`Att2_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_authorizemerchantaccount`
--

DROP TABLE IF EXISTS `bca_authorizemerchantaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_authorizemerchantaccount` (
  `CompanyID` int NOT NULL DEFAULT '0',
  `x_login` varchar(20) DEFAULT NULL,
  `x_tran_key` varchar(16) DEFAULT NULL,
  `x_test_request` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `x_tran_key` (`x_tran_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_backup`
--

DROP TABLE IF EXISTS `bca_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_backup` (
  `CompanyID` int DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `day` int DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `minutes` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_balancesheetitem`
--

DROP TABLE IF EXISTS `bca_balancesheetitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_balancesheetitem` (
  `balancesheetitemID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` int DEFAULT NULL,
  `CategoryTypeID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`balancesheetitemID`),
  KEY `balancesheetitemID` (`balancesheetitemID`),
  KEY `CategoryTypeID` (`CategoryTypeID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_bill`
--

DROP TABLE IF EXISTS `bca_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_bill` (
  `BillNum` int NOT NULL AUTO_INCREMENT,
  `VendorId` int DEFAULT '0',
  `PayerID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `AmountDue` double DEFAULT '0',
  `Memo` varchar(150) DEFAULT NULL,
  `Status` tinyint unsigned DEFAULT '0',
  `IsSchedule` tinyint(1) DEFAULT NULL,
  `CheckNo` int DEFAULT '0',
  `BillType` int DEFAULT '0',
  `TransactionName` varchar(50) DEFAULT NULL,
  `RemindOption` int DEFAULT '0',
  `RecurringPeriod` varchar(50) DEFAULT NULL,
  `RecurringNumber` int DEFAULT '0',
  `DaysInAdvanceToEnter` int DEFAULT '0',
  `IsMemorized` tinyint(1) DEFAULT NULL,
  `CreditUsed` double DEFAULT '0',
  `AmountPaid` double DEFAULT '0',
  `Balance` double DEFAULT '0',
  `NextDate` datetime DEFAULT NULL,
  `PaymentID` int DEFAULT '0',
  `CategoryID` int DEFAULT '0',
  `ServiceID` int DEFAULT '0',
  KEY `AmountPaid` (`AmountPaid`),
  KEY `BillNum` (`BillNum`),
  KEY `CategoryID` (`CategoryID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `PayerID` (`PayerID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `VendorId` (`VendorId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_billdetail`
--

DROP TABLE IF EXISTS `bca_billdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_billdetail` (
  `BillDetailID` int NOT NULL AUTO_INCREMENT,
  `BillNum` int DEFAULT '0',
  `ExpenseAcctID` int DEFAULT '0',
  `ExpenseAmount` double DEFAULT '0',
  `ExpenseMemo` varchar(50) DEFAULT NULL,
  `ExpenseClientVendorID` int DEFAULT '0',
  `Billable` tinyint(1) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `InventoryID` int DEFAULT '0',
  `InventoryCustID` int DEFAULT '0',
  `InventoryCost` double DEFAULT '0',
  `InventoryQty` int DEFAULT '0',
  `DetailType` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`BillDetailID`),
  KEY `BillDetailID` (`BillDetailID`),
  KEY `BillNum` (`BillNum`),
  KEY `CompanyID` (`CompanyID`),
  KEY `ExpenseAcctID` (`ExpenseAcctID`),
  KEY `ExpenseClientVendorID` (`ExpenseClientVendorID`),
  KEY `InventoryCustID` (`InventoryCustID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_billingaddress`
--

DROP TABLE IF EXISTS `bca_billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_billingaddress` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `AddressName` varchar(50) NOT NULL,
  `ClientVendorID` int NOT NULL DEFAULT '-1',
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address1` varchar(75) NOT NULL,
  `Address2` varchar(75) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Province` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `ZipCode` varchar(50) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Phone` varchar(20) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `isDefault` int NOT NULL DEFAULT '0',
  `Active` int DEFAULT '1',
  `DBAName` varchar(45) DEFAULT NULL,
  `AddressType` varchar(25) DEFAULT '1',
  PRIMARY KEY (`AddressID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `LastName` (`LastName`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1766 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_billingstatements`
--

DROP TABLE IF EXISTS `bca_billingstatements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_billingstatements` (
  `StatementNo` int NOT NULL AUTO_INCREMENT,
  `StatementDate` datetime DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `CartAmount` double DEFAULT '0',
  `OverdueAmount` double DEFAULT '0',
  `OverDueServiceCharge` float DEFAULT '0',
  `Amount` double DEFAULT '0',
  `IsCombined` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `Type` int DEFAULT '0',
  PRIMARY KEY (`StatementNo`),
  UNIQUE KEY `StatementNo` (`StatementNo`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_bsaddress`
--

DROP TABLE IF EXISTS `bca_bsaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_bsaddress` (
  `BSAddressID` int NOT NULL,
  `ClientVendorID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DBAName` varchar(45) DEFAULT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Address1` varchar(100) NOT NULL,
  `Address2` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Province` varchar(30) NOT NULL,
  `AddressType` varchar(25) NOT NULL,
  `DateAdded` date NOT NULL,
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_budget`
--

DROP TABLE IF EXISTS `bca_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_budget` (
  `BudgetID` int NOT NULL AUTO_INCREMENT,
  `EYear` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `CompanyBudget` int DEFAULT '0',
  `BudgetName` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  `isDefault` int DEFAULT '0',
  PRIMARY KEY (`BudgetID`),
  KEY `BudgetID` (`BudgetID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_budgetcategory`
--

DROP TABLE IF EXISTS `bca_budgetcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_budgetcategory` (
  `BudgetCategoryID` int NOT NULL AUTO_INCREMENT,
  `BudgetCategoryName` varchar(50) DEFAULT NULL,
  `BudgetCategoryNumber` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Threshold` double DEFAULT '0',
  PRIMARY KEY (`BudgetCategoryID`),
  KEY `BudgetCategoryID` (`BudgetCategoryID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_budgetdetail`
--

DROP TABLE IF EXISTS `bca_budgetdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_budgetdetail` (
  `BudgetdetailID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` int DEFAULT '0',
  `BudgetID` int DEFAULT '0',
  `cvId` int DEFAULT '0',
  `cvServiceId` int DEFAULT '0',
  `EYear` int DEFAULT '0',
  `oct_amt` double DEFAULT '0',
  `nov_amt` double DEFAULT '0',
  `dec_amt` double DEFAULT '0',
  `jan_amt` double DEFAULT '0',
  `feb_amt` double DEFAULT '0',
  `mar_amt` double DEFAULT '0',
  `apr_amt` double DEFAULT '0',
  `may_amt` double DEFAULT '0',
  `jun_amt` double DEFAULT '0',
  `jul_amt` double DEFAULT '0',
  `aug_amt` double DEFAULT '0',
  `sep_amt` double DEFAULT '0',
  `annual_amt` double DEFAULT '0',
  `actual_amt` double DEFAULT '0',
  KEY `BudgetdetailID` (`BudgetdetailID`),
  KEY `BudgetID` (`BudgetID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `cvId` (`cvId`)
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_businesscategories`
--

DROP TABLE IF EXISTS `bca_businesscategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_businesscategories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryTypeID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `CateNumber` varchar(100) DEFAULT NULL,
  `Parent` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `BudgetCategoryID` int DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '1',
  `BusinessTypeID` int DEFAULT '0',
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryID` (`CategoryID`),
  KEY `CategoryTypeID` (`CategoryTypeID`),
  KEY `BusinessTypeID` (`BusinessTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2140049317 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_businessmodules`
--

DROP TABLE IF EXISTS `bca_businessmodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_businessmodules` (
  `ModuleID` int DEFAULT '0',
  `ModuleName` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `ModuleID` (`ModuleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_businesstype`
--

DROP TABLE IF EXISTS `bca_businesstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_businesstype` (
  `BusinessTypeID` int NOT NULL AUTO_INCREMENT,
  `BusinessName` varchar(50) DEFAULT NULL,
  `DefaultInvoiceStyleID` int DEFAULT '0',
  `DefaultEstimationStyleID` int DEFAULT '0',
  `DefaultPOStyleID` int DEFAULT '0',
  `Active` int DEFAULT '0',
  PRIMARY KEY (`BusinessTypeID`),
  KEY `BusinessTypeID` (`BusinessTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_cart`
--

DROP TABLE IF EXISTS `bca_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `InventoryID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `InventoryCode` varchar(50) DEFAULT NULL,
  `InventoryName` varchar(255) DEFAULT NULL,
  `Qty` int DEFAULT '0',
  `UnitWeight` double DEFAULT '0',
  `Weight` double DEFAULT '0',
  `UnitPrice` double DEFAULT '0',
  `Taxable` tinyint unsigned DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ItemTypeID` int DEFAULT '0',
  `Itemtax` double DEFAULT '0',
  `orderid` varchar(50) DEFAULT NULL,
  `OrderItemID` varchar(50) DEFAULT NULL,
  `shippingprice` double DEFAULT '0',
  `shippingtax` double DEFAULT '0',
  `itempromotiondiscount` varchar(50) DEFAULT NULL,
  `itempromotionid` varchar(50) DEFAULT NULL,
  `shippromotiondiscount` varchar(50) DEFAULT NULL,
  `shippromotionid` varchar(50) DEFAULT NULL,
  `ItemSubTotal` varchar(50) DEFAULT NULL,
  `ItemOrder` int DEFAULT '0',
  `BalanceQty` int DEFAULT '0',
  `Unit` varchar(50) DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `SalesTaxRate` double DEFAULT '0',
  `PORef` varchar(20) DEFAULT NULL,
  `SORef` varchar(50) DEFAULT NULL,
  `IsUsedSalesItem` int DEFAULT '0',
  `SupplierID` varchar(50) DEFAULT NULL,
  `CustomSku` varchar(255) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `ReceivedQty` int DEFAULT '0',
  PRIMARY KEY (`CartID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InventoryCode` (`InventoryCode`),
  KEY `InventoryID` (`InventoryID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `itempromotionid` (`itempromotionid`),
  KEY `ItemTypeID` (`ItemTypeID`),
  KEY `orderid` (`orderid`),
  KEY `OrderItemID` (`OrderItemID`),
  KEY `shippromotionid` (`shippromotionid`),
  KEY `SupplierID` (`SupplierID`),
  KEY `SalesTaxRate` (`SalesTaxRate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_cartmemorized`
--

DROP TABLE IF EXISTS `bca_cartmemorized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_cartmemorized` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `InventoryID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `InventoryCode` varchar(50) DEFAULT NULL,
  `InventoryName` varchar(100) DEFAULT NULL,
  `Qty` int DEFAULT '0',
  `UnitWeight` double DEFAULT '0',
  `Weight` double DEFAULT '0',
  `UnitPrice` double DEFAULT '0',
  `Taxable` tinyint unsigned DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ItemTypeID` int DEFAULT '0',
  `Itemtax` double DEFAULT '0',
  `orderid` varchar(50) DEFAULT NULL,
  `OrderItemID` varchar(50) DEFAULT NULL,
  `shippingprice` double DEFAULT '0',
  `shippingtax` double DEFAULT '0',
  `itempromotiondiscount` varchar(50) DEFAULT NULL,
  `itempromotionid` varchar(50) DEFAULT NULL,
  `shippromotiondiscount` varchar(50) DEFAULT NULL,
  `shippromotionid` varchar(50) DEFAULT NULL,
  `ItemSubTotal` varchar(50) DEFAULT NULL,
  `ItemOrder` int DEFAULT '0',
  `SalesTaxRate` double DEFAULT '0',
  PRIMARY KEY (`CartID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InventoryCode` (`InventoryCode`),
  KEY `InventoryID` (`InventoryID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `itempromotionid` (`itempromotionid`),
  KEY `ItemTypeID` (`ItemTypeID`),
  KEY `orderid` (`orderid`),
  KEY `OrderItemID` (`OrderItemID`),
  KEY `shippromotionid` (`shippromotionid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_category`
--

DROP TABLE IF EXISTS `bca_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryTypeID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `CateNumber` varchar(100) DEFAULT NULL,
  `Parent` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `BudgetCategoryID` int DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryID` (`CategoryID`),
  KEY `CategoryTypeID` (`CategoryTypeID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2146773192 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_categorytype`
--

DROP TABLE IF EXISTS `bca_categorytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_categorytype` (
  `CategoryTypeID` int NOT NULL AUTO_INCREMENT,
  `CategoryTypeName` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`CategoryTypeID`),
  KEY `CategoryTypeID` (`CategoryTypeID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2147483648 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_cities`
--

DROP TABLE IF EXISTS `bca_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `state_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48315 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_clientcategory`
--

DROP TABLE IF EXISTS `bca_clientcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_clientcategory` (
  `CVCategoryID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  KEY `CVCategoryID` (`CVCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_clientvendor`
--

DROP TABLE IF EXISTS `bca_clientvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_clientvendor` (
  `ClientVendorID` int DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `DBAName` varchar(45) DEFAULT NULL,
  `Detail` longtext,
  `CustomerTitle` varchar(50) DEFAULT NULL,
  `CustomerTitleID` int DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `BillName` varchar(50) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `ZipCodeID` varchar(20) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `CellPhone` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePage` varchar(50) DEFAULT NULL,
  `ResellerTaxID` varchar(50) DEFAULT NULL,
  `Taxable` bigint DEFAULT NULL,
  `CVTypeID` int DEFAULT NULL,
  `CVCategoryID` int DEFAULT NULL,
  `CVCategoryName` varchar(50) DEFAULT NULL,
  `ShipCarrierID` int DEFAULT NULL,
  `PaymentTypeID` int DEFAULT NULL,
  `SalesRepID` int DEFAULT NULL,
  `TermID` int DEFAULT NULL,
  `CCTypeID` int DEFAULT NULL,
  `CustomerOpenDebit` double DEFAULT NULL,
  `CustomerCreditLine` double DEFAULT NULL,
  `VendorOpenDebit` double DEFAULT NULL,
  `VendorAllowedCredit` double DEFAULT NULL,
  `Active` int DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Deleted` int DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Priority` int DEFAULT NULL,
  `ItemPriceLevel` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `PayFromID` int DEFAULT NULL,
  `PriceLevelID` int DEFAULT NULL,
  `UseSpecialMessage` tinyint(1) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `CustomerGroupID` int DEFAULT NULL,
  `Form1099` int DEFAULT NULL,
  `ReferenceCustomerID` int DEFAULT NULL,
  `RemainingCredit` double DEFAULT NULL,
  `LineofCreditTermID` int DEFAULT NULL,
  `BankAccountID` int DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `DateInput` datetime DEFAULT NULL,
  `DateTerminated` datetime DEFAULT NULL,
  `isTerminated` tinyint(1) DEFAULT '0',
  `isMobilePhoneNumber` tinyint(1) DEFAULT '0',
  `isPhoneMobileNumber` tinyint(1) DEFAULT '0',
  KEY `BankAccountID` (`BankAccountID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `CCTypeID` (`CCTypeID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `CustomerTitleID` (`CustomerTitleID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CVCategoryID` (`CVCategoryID`),
  KEY `CVTypeID` (`CVTypeID`),
  KEY `LineofCreditTermID` (`LineofCreditTermID`),
  KEY `PayFromID` (`PayFromID`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PriceLevelID` (`PriceLevelID`),
  KEY `ReferenceCustomerID` (`ReferenceCustomerID`),
  KEY `SalesRepID` (`SalesRepID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `ResellerTaxID` (`ResellerTaxID`),
  KEY `TermID` (`TermID`),
  KEY `ZipCode` (`ZipCode`),
  KEY `ZipCodeID` (`ZipCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_clientvendorcontacthistory`
--

DROP TABLE IF EXISTS `bca_clientvendorcontacthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_clientvendorcontacthistory` (
  `ClientVendorID` int DEFAULT '0',
  `CallDate` datetime DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `MailDate` datetime DEFAULT NULL,
  `MailContent` varchar(50) DEFAULT NULL,
  `ContactBy` varchar(50) DEFAULT NULL,
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_clientvendorfinancecharges`
--

DROP TABLE IF EXISTS `bca_clientvendorfinancecharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_clientvendorfinancecharges` (
  `ClientVendorID` int DEFAULT '0',
  `UseIndividual` tinyint(1) DEFAULT '0',
  `AnnualInterestRate` double DEFAULT '0',
  `MinimumFinanceCharge` double DEFAULT '0',
  `GracePeriod` int DEFAULT '0',
  `AssessFinanceCharge` tinyint(1) DEFAULT '0',
  `MarkFinanceCharge` tinyint(1) DEFAULT '0',
  UNIQUE KEY `ClientVendorID` (`ClientVendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_clientvendorjob`
--

DROP TABLE IF EXISTS `bca_clientvendorjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_clientvendorjob` (
  `ClientVendorID` int DEFAULT '0',
  `JobCategoryID` int DEFAULT '0',
  `Active` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `dateAdded` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `terminateDate` datetime DEFAULT NULL,
  `isRecurringServiceJob` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `ClientVendorID` (`ClientVendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_clientvendorservice`
--

DROP TABLE IF EXISTS `bca_clientvendorservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_clientvendorservice` (
  `ClientVendorID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `InvoiceStyleID` int DEFAULT '0',
  `DefaultService` tinyint(1) DEFAULT NULL,
  `ServiceID` int DEFAULT '0',
  `SalePrice` double DEFAULT '0',
  `BillDate` varchar(50) DEFAULT NULL,
  `JobCategoryID` int DEFAULT '0',
  `isRecurringServiceJob` int DEFAULT '0',
  `StartDate` datetime DEFAULT NULL,
  `TerminateDate` datetime DEFAULT NULL,
  `Active` int DEFAULT '0',
  `LastBillDate` datetime DEFAULT NULL,
  `ServiceTypeID` int DEFAULT NULL,
  `ServiceBalance` double DEFAULT NULL,
  KEY `CompanyID` (`CompanyID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `ServiceTypeID` (`ServiceTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_company`
--

DROP TABLE IF EXISTS `bca_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_company` (
  `CompanyID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `NickName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Detail` longtext,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Zipcode` varchar(50) DEFAULT NULL,
  `Phone1` varchar(20) DEFAULT NULL,
  `Phone2` varchar(20) DEFAULT NULL,
  `Fax1` varchar(20) DEFAULT NULL,
  `Fax2` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePage` varchar(100) DEFAULT NULL,
  `FID` varchar(50) DEFAULT NULL,
  `SID` varchar(50) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  `Weight` varchar(50) DEFAULT NULL,
  `LabelSize` varchar(50) DEFAULT NULL,
  `BackupPeriod` varchar(50) DEFAULT NULL,
  `BackupPlace` varchar(50) DEFAULT NULL,
  `AdminUsername` varchar(50) DEFAULT NULL,
  `AdminPassword` varchar(50) DEFAULT NULL,
  `Multimode` int DEFAULT NULL,
  `CustomerCountry` varchar(50) DEFAULT NULL,
  `CustomerTaxable` int DEFAULT NULL,
  `CustomerUsecompanyname` int DEFAULT NULL,
  `StartingInvoiceNumber` int DEFAULT NULL,
  `InvoiceStyleID` int DEFAULT NULL,
  `InvoiceFootnoteID` int DEFAULT NULL,
  `UseProductWeight` int DEFAULT NULL,
  `UseShippingTable` int DEFAULT NULL,
  `InvoiceUseCountry` int DEFAULT NULL,
  `VendorCountry` int DEFAULT NULL,
  `VendorUseCompanyname` int DEFAULT NULL,
  `StartingPONumber` int DEFAULT NULL,
  `POStyleID` int DEFAULT NULL,
  `POFootnoteID` int DEFAULT NULL,
  `POUsecountry` int DEFAULT NULL,
  `StartingRINumber` int DEFAULT NULL,
  `ProductTaxable` int DEFAULT NULL,
  `EmployeeState` varchar(50) DEFAULT NULL,
  `EmployeeCountry` varchar(50) DEFAULT NULL,
  `ChargeSalestax` int DEFAULT NULL,
  `HowOftenSalestax` int DEFAULT NULL,
  `SalesTaxID` int DEFAULT NULL,
  `ShowReminder` int DEFAULT NULL,
  `InvoiceMemo` int DEFAULT NULL,
  `InvoiceMemoDays` int DEFAULT NULL,
  `OverdueInvoice` int DEFAULT NULL,
  `OverdueinvoiceDays` int DEFAULT NULL,
  `InventoryOrder` int DEFAULT NULL,
  `InventoryOrderDays` int DEFAULT NULL,
  `BillstoPay` int DEFAULT NULL,
  `BillstoPayDays` int DEFAULT NULL,
  `Active` int NOT NULL DEFAULT '1',
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `isNodata` tinyint(1) DEFAULT NULL,
  `BusinessTypeID` int DEFAULT NULL,
  `isCreated` int DEFAULT NULL,
  `Paypal_Username` varchar(255) DEFAULT NULL,
  `Paypal_Password` varchar(255) DEFAULT NULL,
  `Paypal_Signature` varchar(255) DEFAULT NULL,
  `Paypal_Environment` varchar(255) DEFAULT NULL,
  `IsUse_Paypal_For_eBay_Import` int DEFAULT NULL,
  `FederalTaxID` int DEFAULT NULL,
  `FiscalMonth` varchar(45) DEFAULT NULL,
  `MembershipLevel` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `TaxID` varchar(45) DEFAULT NULL,
  `SameAsPhoneNumber` tinyint(1) DEFAULT '0',
  `JobPosition` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  KEY `BusinessTypeID` (`BusinessTypeID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceFootnoteID` (`InvoiceFootnoteID`),
  KEY `POFootnoteID` (`POFootnoteID`),
  KEY `POStyleID` (`POStyleID`),
  KEY `SalesTaxID` (`SalesTaxID`),
  KEY `Zipcode` (`Zipcode`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_consignmentsale`
--

DROP TABLE IF EXISTS `bca_consignmentsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_consignmentsale` (
  `ConsignID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  `InvoiceID` int DEFAULT NULL,
  `OrderNum` int DEFAULT NULL,
  `PaidAmount` double DEFAULT NULL,
  `RemainingBalance` double DEFAULT NULL,
  `IsPaymentCompleted` tinyint(1) DEFAULT '0',
  `CompanyID` int DEFAULT NULL,
  `IsConsignedPaymentCompleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ConsignID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `OrderNum` (`OrderNum`),
  KEY `SupplierID` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_cordinates`
--

DROP TABLE IF EXISTS `bca_cordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_cordinates` (
  `cordinatesID` int NOT NULL AUTO_INCREMENT,
  `LeftCordinate` int DEFAULT '0',
  `RightCordinate` int DEFAULT '0',
  `UpCordiante` int DEFAULT '0',
  `DownCordainte` int DEFAULT '0',
  `MenuName` varchar(50) DEFAULT NULL,
  `ResolutionHeight` int DEFAULT '0',
  `ResolutionWidth` int DEFAULT '0',
  `UseSalesOrder` int DEFAULT '0',
  PRIMARY KEY (`cordinatesID`),
  KEY `cordinatesID` (`cordinatesID`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_countries`
--

DROP TABLE IF EXISTS `bca_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_creditcardtype`
--

DROP TABLE IF EXISTS `bca_creditcardtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_creditcardtype` (
  `CCTypeID` int DEFAULT '0',
  `CompanyID` int NOT NULL DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `CVV2` int DEFAULT '0',
  `Active` int DEFAULT '1',
  `TypeCategory` int DEFAULT NULL,
  KEY `CCTypeID` (`CCTypeID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_currency`
--

DROP TABLE IF EXISTS `bca_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_currency` (
  `CurrencyID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  UNIQUE KEY `CurrencyID` (`CurrencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_customdate`
--

DROP TABLE IF EXISTS `bca_customdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_customdate` (
  `ID` int NOT NULL,
  `Price` int DEFAULT NULL,
  `PriceType` varchar(255) DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_customer_type`
--

DROP TABLE IF EXISTS `bca_customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_customer_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `CompanyID` int NOT NULL,
  `Deleted` tinyint NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_customfile`
--

DROP TABLE IF EXISTS `bca_customfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_customfile` (
  `ID` int NOT NULL,
  `Price` int DEFAULT NULL,
  `PriceType` varchar(255) DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `AllowedFileEx` varchar(255) DEFAULT NULL,
  `MaxImageWidth` int DEFAULT NULL,
  `MaxImageheight` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_customoptions`
--

DROP TABLE IF EXISTS `bca_customoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_customoptions` (
  `OptionId` int NOT NULL,
  `ProductId` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `InputType` varchar(255) DEFAULT NULL,
  `IsRequired` varchar(255) DEFAULT NULL,
  `SortOrder` int DEFAULT NULL,
  PRIMARY KEY (`OptionId`),
  KEY `OptionId` (`OptionId`),
  KEY `ProductId` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_customselect`
--

DROP TABLE IF EXISTS `bca_customselect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_customselect` (
  `ID` int DEFAULT NULL,
  `SUBTITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SKU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRICETYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SORTORDER` int DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `PRICE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_customtext`
--

DROP TABLE IF EXISTS `bca_customtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_customtext` (
  `ID` int NOT NULL,
  `Price` int DEFAULT NULL,
  `PriceType` varchar(255) DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `MaxCharacter` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_cvcreditcard`
--

DROP TABLE IF EXISTS `bca_cvcreditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_cvcreditcard` (
  `CreditCardID` int NOT NULL AUTO_INCREMENT,
  `ClientVendorID` int DEFAULT '0',
  `Nickname` varchar(20) DEFAULT NULL,
  `DefaultCard` tinyint(1) DEFAULT NULL,
  `CCTypeID` int DEFAULT '0',
  `CardNumber` varchar(50) DEFAULT NULL,
  `CardExpMonth` varchar(50) DEFAULT NULL,
  `CardExpYear` varchar(50) DEFAULT NULL,
  `CardCW2` varchar(50) DEFAULT NULL,
  `CardHolderName` varchar(50) DEFAULT NULL,
  `CardBillingAddress` varchar(255) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `CardBillingZipCode` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Deleted` int DEFAULT '0',
  UNIQUE KEY `CreditCardID` (`CreditCardID`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_cvtype`
--

DROP TABLE IF EXISTS `bca_cvtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_cvtype` (
  `CVTypeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT '0',
  UNIQUE KEY `CVTypeID` (`CVTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_esalesitemcategory`
--

DROP TABLE IF EXISTS `bca_esalesitemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_esalesitemcategory` (
  `InventoryID` int DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `StoreTypeID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  KEY `CategoryID` (`CategoryID`),
  KEY `StoreID` (`StoreID`),
  KEY `StoreTypeID` (`StoreTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_exporteditemedetail`
--

DROP TABLE IF EXISTS `bca_exporteditemedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_exporteditemedetail` (
  `ExportedProductID` int NOT NULL AUTO_INCREMENT,
  `ProductCode` varchar(50) DEFAULT NULL,
  `ListingDuration` varchar(50) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `ShippingFee` int DEFAULT '0',
  `ExportedInventoryID` varchar(50) DEFAULT NULL,
  `ExportedDate` datetime DEFAULT NULL,
  `ExportedType` int DEFAULT '0',
  `InventoryID` int DEFAULT NULL,
  `CrossSellParentID` int DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`ExportedProductID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `CrossSellParentID` (`CrossSellParentID`),
  KEY `ExportedInventoryID` (`ExportedInventoryID`),
  KEY `ExportedProductID` (`ExportedProductID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `ProductCode` (`ProductCode`),
  KEY `StoreID` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_features`
--

DROP TABLE IF EXISTS `bca_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_features` (
  `FeatureName` varchar(50) DEFAULT NULL,
  `BusinessID` int DEFAULT '0',
  `BusinessName` varchar(50) DEFAULT NULL,
  `ModuleID` int DEFAULT '0',
  KEY `BusinessID` (`BusinessID`),
  KEY `ModuleID` (`ModuleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_footnote`
--

DROP TABLE IF EXISTS `bca_footnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_footnote` (
  `FootNoteID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT '0',
  `Description` longtext,
  `Active` int DEFAULT '1',
  UNIQUE KEY `FootNoteID` (`FootNoteID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_form_templates`
--

DROP TABLE IF EXISTS `bca_form_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_form_templates` (
  `template_type_no` int NOT NULL,
  `companyId` int NOT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `isSelected` bit(1) NOT NULL,
  `template_id_type` int DEFAULT NULL,
  `template_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`template_type_no`),
  KEY `FK25by5d07g10gf4mcldiy8ik9m` (`template_id_type`)

) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_form_templates_type`
--

DROP TABLE IF EXISTS `bca_form_templates_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_form_templates_type` (
  `template_id` int NOT NULL,
  `companyId` int NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`template_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

>>>>>>> 872a8ac1b0c26da16436afe83e85ed02a57fd51e
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_history`
--

DROP TABLE IF EXISTS `bca_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_history` (
  `ImportId` int NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  `TotalOrders` int DEFAULT NULL,
  `ImportedHistoryID` int DEFAULT '0',
  `Schedulehours` int DEFAULT '0',
  `Schedulemin` int DEFAULT '0',
  PRIMARY KEY (`ImportId`),
  KEY `CompanyID` (`CompanyID`),
  KEY `ImportedHistoryID` (`ImportedHistoryID`),
  KEY `StoreID` (`StoreID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_inventoryassembly`
--

DROP TABLE IF EXISTS `bca_inventoryassembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_inventoryassembly` (
  `KitID` int DEFAULT NULL,
  `InventoryID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `ReservedQty` int DEFAULT NULL,
  KEY `InventoryID` (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_inventorycollectedfromstore`
--

DROP TABLE IF EXISTS `bca_inventorycollectedfromstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_inventorycollectedfromstore` (
  `ASIN` varchar(30) DEFAULT NULL,
  `OrderID` varchar(50) DEFAULT NULL,
  `OrderItemID` varchar(50) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `SalePrice` decimal(19,4) DEFAULT '0.0000',
  `CompanyID` int DEFAULT '0',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `CompanyID` (`CompanyID`),
  KEY `OrderID` (`OrderID`),
  KEY `OrderItemID` (`OrderItemID`),
  KEY `SKU` (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_inventorycrosssell`
--

DROP TABLE IF EXISTS `bca_inventorycrosssell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_inventorycrosssell` (
  `CrossSellID` int DEFAULT NULL,
  `InventoryID` int DEFAULT NULL,
  KEY `InventoryID` (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_inventorysupplierdetail`
--

DROP TABLE IF EXISTS `bca_inventorysupplierdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_inventorysupplierdetail` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `InventoryID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `SupplierID` varchar(50) DEFAULT NULL,
  `SupplierPurchasePrice` double DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `SupplierOrderUnit` int DEFAULT '0',
  `SupplierBarCode` varchar(50) DEFAULT NULL,
  `SupplierSKU` varchar(50) DEFAULT NULL,
  `OrderQty` int DEFAULT '0',
  `SupplierNumber` int DEFAULT '0',
  `Deleted` int DEFAULT '0',
  `SupplierCommission` double DEFAULT NULL,
  KEY `CompanyID` (`CompanyID`),
  KEY `SupplierBarCode` (`SupplierBarCode`),
  KEY `ID` (`ID`),
  KEY `InventoryID` (`InventoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_inventoryunitmeasure`
--

DROP TABLE IF EXISTS `bca_inventoryunitmeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_inventoryunitmeasure` (
  `InventoryID` int DEFAULT '0',
  `UnitCategoryID` int DEFAULT '0',
  `WeightID` int DEFAULT '0',
  `subUnitCategoryID` int DEFAULT '0',
  `SizeH` int DEFAULT '0',
  `SizeW` int DEFAULT '0',
  `SizeL` int DEFAULT '0',
  `CompanyID` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoice`
--

DROP TABLE IF EXISTS `bca_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoice` (
  `InvoiceID` int NOT NULL AUTO_INCREMENT,
  `OrderNum` int DEFAULT '0',
  `PONum` int DEFAULT '0',
  `SONum` int DEFAULT '0',
  `RcvNum` int DEFAULT '0',
  `EstNum` int DEFAULT '0',
  `EmployeeID` int DEFAULT '-1',
  `RefNum` varchar(35) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `Memo` varchar(255) DEFAULT NULL,
  `BillingAddrID` int DEFAULT '0',
  `ShippingAddrID` int DEFAULT '0',
  `BSAddressID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `InvoiceTypeID` int DEFAULT '0',
  `InvoiceStyleID` int DEFAULT '0',
  `Weight` double DEFAULT '0',
  `SubTotal` double DEFAULT '0',
  `Tax` double DEFAULT '0',
  `SH` double DEFAULT '0',
  `Total` double DEFAULT '0',
  `AdjustedTotal` double DEFAULT '0',
  `PaidAmount` double DEFAULT '0',
  `Balance` double DEFAULT '0',
  `SalesRepID` int DEFAULT '0',
  `TermID` int DEFAULT '0',
  `PaymentTypeID` int DEFAULT '0',
  `ShipCarrierID` int DEFAULT '0',
  `MessageID` int DEFAULT '0',
  `SalesTaxID` int DEFAULT '0',
  `Taxable` int DEFAULT '0',
  `Shipped` int DEFAULT '0',
  `IsReceived` tinyint(1) DEFAULT '0',
  `IsPaymentCompleted` tinyint(1) DEFAULT '0',
  `FromPO` tinyint(1) DEFAULT NULL,
  `DateConfirmed` datetime DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `invoiceStatus` int DEFAULT '0',
  `orderid` varchar(50) DEFAULT NULL,
  `shipservicelevel` varchar(50) DEFAULT NULL,
  `ShippingNote1` varchar(200) DEFAULT NULL,
  `ShippingNote2` varchar(50) DEFAULT NULL,
  `StoreTypeID` int DEFAULT '0',
  `StoreID` int DEFAULT '0',
  `ShipCarrier` varchar(50) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsEmailed` tinyint(1) DEFAULT NULL,
  `ServiceID` int DEFAULT '-1',
  `AmazonGiftWrapType` varchar(255) DEFAULT NULL,
  `AmazonGiftMessageText` varchar(255) DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `TransactionType` int DEFAULT '0',
  `TrackingCode` varchar(50) DEFAULT NULL,
  `GatewayID` int DEFAULT '0',
  `ShippingMethod` varchar(50) DEFAULT NULL,
  `ShippingLabel` varchar(200) DEFAULT NULL,
  `LabelPrinted` varchar(50) DEFAULT '0',
  `dropShipCustomerID` int DEFAULT '0',
  `JobCategoryID` int DEFAULT '0',
  `BillID` int DEFAULT '0',
  `isBillReceived` tinyint(1) DEFAULT NULL,
  `UpfrontAmount` double DEFAULT '0',
  `Note` longtext,
  `BillDate` varchar(255) DEFAULT NULL,
  `GiftAmount` double DEFAULT '0',
  `GiftCertificateCode` varchar(20) DEFAULT NULL,
  `TotalCommission` double DEFAULT NULL,
  `BankAccountID` int DEFAULT '0',
  `NoOfBoxes` int DEFAULT NULL,
  `ShipNumber` varchar(255) DEFAULT NULL,
  `IsInvoice` int DEFAULT '0',
  `IsSalestype` int DEFAULT '0',
  `isPending` int DEFAULT '0',
  `DateReceived` datetime DEFAULT NULL,
  `VendorAddrID` int DEFAULT '0',
  `OrderType` int DEFAULT '0',
  PRIMARY KEY (`InvoiceID`),
  KEY `BankAccountID` (`BankAccountID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceTypeID` (`InvoiceTypeID`),
  KEY `BillingAddrID` (`BillingAddrID`),
  KEY `BSAddressID` (`BSAddressID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `dropShipCustomerID` (`dropShipCustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `EstNum` (`EstNum`),
  KEY `GatewayID` (`GatewayID`),
  KEY `GiftCertificateCode` (`GiftCertificateCode`),
  KEY `InvoiceStyleID` (`InvoiceStyleID`),
  KEY `MessageID` (`MessageID`),
  KEY `orderid` (`orderid`),
  KEY `OrderNum` (`OrderNum`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PONum` (`PONum`),
  KEY `RcvNum` (`RcvNum`),
  KEY `RefNum` (`RefNum`),
  KEY `SalesRepID` (`SalesRepID`),
  KEY `SalesTaxID` (`SalesTaxID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `ShippingAddrID` (`ShippingAddrID`),
  KEY `SONum` (`SONum`),
  KEY `StoreID` (`StoreID`),
  KEY `TermID` (`TermID`),
  KEY `TrackingCode` (`TrackingCode`),
  KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoice_activetemplates`
--

DROP TABLE IF EXISTS `bca_invoice_activetemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoice_activetemplates` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TemplateID` int DEFAULT '0',
  `Retail` int DEFAULT '0',
  `Wholesale` int DEFAULT '0',
  `Contractor` int DEFAULT '0',
  `eSales` int DEFAULT '0',
  `Service` int DEFAULT '0',
  `Nonprofit` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TemplateID` (`TemplateID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoice_layoutcolumnsscreensetting`
--

DROP TABLE IF EXISTS `bca_invoice_layoutcolumnsscreensetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoice_layoutcolumnsscreensetting` (
  `TemplateId` int DEFAULT '0',
  `Tax` tinyint(1) DEFAULT NULL,
  `Item` tinyint(1) DEFAULT NULL,
  `Description` tinyint(1) DEFAULT NULL,
  `Quantity` tinyint(1) DEFAULT NULL,
  `Rate` tinyint(1) DEFAULT NULL,
  `Amount` tinyint(1) DEFAULT NULL,
  `RatePrice` tinyint(1) DEFAULT NULL,
  `UnitPrice` tinyint(1) DEFAULT NULL,
  `SerialNo` tinyint(1) DEFAULT NULL,
  `Weight` tinyint(1) DEFAULT NULL,
  `Unit` tinyint(1) DEFAULT NULL,
  `Consignor` tinyint(1) DEFAULT '0',
  `Option` tinyint(1) DEFAULT '0',
  `COLOR/Q'TY(ORDER)` tinyint(1) DEFAULT '0',
  KEY `TemplateId` (`TemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoice_layoutcolumnssetting`
--

DROP TABLE IF EXISTS `bca_invoice_layoutcolumnssetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoice_layoutcolumnssetting` (
  `TemplateId` int DEFAULT '0',
  `ColumnLabel` varchar(50) DEFAULT NULL,
  `ColumnTitle` varchar(50) DEFAULT NULL,
  `printStatus` tinyint unsigned DEFAULT '0',
  `Templateorder` int DEFAULT '0',
  KEY `TemplateId` (`TemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoice_layoutfieldscreensetting`
--

DROP TABLE IF EXISTS `bca_invoice_layoutfieldscreensetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoice_layoutfieldscreensetting` (
  `TemplateId` int DEFAULT '0',
  `InvoiceTitle` tinyint(1) DEFAULT NULL,
  `InvoiceDate` tinyint(1) DEFAULT NULL,
  `InvoiceNumber` tinyint(1) DEFAULT NULL,
  `BillTo` tinyint(1) DEFAULT NULL,
  `ShipTo` tinyint(1) DEFAULT NULL,
  `PoNo` tinyint(1) DEFAULT NULL,
  `Terms` tinyint(1) DEFAULT NULL,
  `Rep` tinyint(1) DEFAULT NULL,
  `ShipDate` tinyint(1) DEFAULT NULL,
  `ShipVia` tinyint(1) DEFAULT NULL,
  `PayMethod` tinyint(1) DEFAULT NULL,
  `Message` tinyint(1) DEFAULT NULL,
  `SubTotal` tinyint(1) DEFAULT NULL,
  `SalesTax` tinyint(1) DEFAULT NULL,
  `Total` tinyint(1) DEFAULT NULL,
  `PaidBalance` tinyint(1) DEFAULT NULL,
  `Weight` tinyint(1) DEFAULT NULL,
  `AdjustedTotal` tinyint(1) DEFAULT NULL,
  `LongTextMessage` tinyint(1) DEFAULT NULL,
  `Balance` tinyint(1) DEFAULT NULL,
  `DueDate` tinyint(1) DEFAULT NULL,
  `TotalItems` tinyint(1) DEFAULT NULL,
  `Barcode1` tinyint(1) DEFAULT NULL,
  `Barcode2` tinyint(1) DEFAULT NULL,
  `Credit` int DEFAULT NULL,
  `Discount` int DEFAULT NULL,
  `GiftAmount` int DEFAULT NULL,
  KEY `TemplateId` (`TemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoice_layoutfieldssetting`
--

DROP TABLE IF EXISTS `bca_invoice_layoutfieldssetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoice_layoutfieldssetting` (
  `TemplateId` double DEFAULT '0',
  `FieldText` varchar(50) DEFAULT NULL,
  `FieldTitle` varchar(50) DEFAULT NULL,
  `IsFilled` tinyint(1) DEFAULT NULL,
  `XCoordinate` double DEFAULT '0',
  `YCoordinate` double DEFAULT '0',
  `Width` double DEFAULT '0',
  `Height` double DEFAULT '0',
  `printStatus` int DEFAULT '0',
  KEY `TemplateId` (`TemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoice_template`
--

DROP TABLE IF EXISTS `bca_invoice_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoice_template` (
  `TemplateId` int NOT NULL DEFAULT '0',
  `BaseTemplateId` int DEFAULT '0',
  `TemplateName` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `IsSpecifiedPrintSetting` tinyint(1) DEFAULT '0',
  `Orientation` varchar(50) DEFAULT '0',
  `NoOfCopies` varchar(50) DEFAULT '1',
  `PageWidth` varchar(50) DEFAULT '8.5',
  `PageHeight` varchar(50) DEFAULT '11',
  `PrintPageNumber` tinyint(1) DEFAULT NULL,
  `PrintStatus` tinyint(1) DEFAULT NULL,
  `IsPrintCompanyLogo` tinyint(1) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `TemplateTypeId` int DEFAULT '0',
  `TemplateStyleTypeID` int DEFAULT NULL,
  `Templatelogo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TemplateId`),
  KEY `BaseTemplateId` (`BaseTemplateId`),
  KEY `CompanyID` (`CompanyID`),
  KEY `TemplateId` (`TemplateId`),
  KEY `TemplateStyleTypeID` (`TemplateStyleTypeID`),
  KEY `TemplateTypeId` (`TemplateTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoicecredit`
--

DROP TABLE IF EXISTS `bca_invoicecredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoicecredit` (
  `InvoiceID` int DEFAULT '0',
  `Credit` decimal(19,4) DEFAULT '0.0000',
  `Total_Credit` decimal(19,4) DEFAULT '0.0000',
  `Memo` varchar(255) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cvId` int DEFAULT NULL,
  `Remaining_CreditAmt` double DEFAULT NULL,
  `Deleted` int DEFAULT '0',
  `InvoiceTypeID` int DEFAULT NULL,
  KEY `cvId` (`cvId`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `InvoiceTypeID` (`InvoiceTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoicediscount`
--

DROP TABLE IF EXISTS `bca_invoicediscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoicediscount` (
  `InvoiceID` int DEFAULT '0',
  `Discount` decimal(19,4) DEFAULT '0.0000',
  `Memo` varchar(255) DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `CategoryID` (`CategoryID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoicememorized`
--

DROP TABLE IF EXISTS `bca_invoicememorized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoicememorized` (
  `InvoiceID` int NOT NULL AUTO_INCREMENT,
  `OrderNum` int DEFAULT '0',
  `PONum` int DEFAULT '0',
  `RcvNum` int DEFAULT '0',
  `EstNum` int DEFAULT '0',
  `EmployeeID` int DEFAULT '-1',
  `RefNum` varchar(35) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `Memo` varchar(150) DEFAULT NULL,
  `BillingAddrID` int DEFAULT '0',
  `ShippingAddrID` int DEFAULT '0',
  `BSAddressID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `InvoiceTypeID` int DEFAULT '0',
  `InvoiceStyleID` int DEFAULT '0',
  `Weight` double DEFAULT '0',
  `SubTotal` double DEFAULT '0',
  `Tax` double DEFAULT '0',
  `SH` double DEFAULT '0',
  `Total` double DEFAULT '0',
  `AdjustedTotal` double DEFAULT '0',
  `PaidAmount` double DEFAULT '0',
  `Balance` double DEFAULT '0',
  `SalesRepID` int DEFAULT '0',
  `TermID` int DEFAULT '0',
  `PaymentTypeID` int DEFAULT '0',
  `ShipCarrierID` int DEFAULT '0',
  `MessageID` int DEFAULT '0',
  `SalesTaxID` int DEFAULT '0',
  `Taxable` int DEFAULT '0',
  `Shipped` int DEFAULT '0',
  `IsReceived` tinyint(1) DEFAULT '0',
  `IsPaymentCompleted` tinyint(1) DEFAULT '0',
  `FromPO` tinyint(1) DEFAULT NULL,
  `DateConfirmed` datetime DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `invoiceStatus` int DEFAULT '0',
  `orderid` varchar(50) DEFAULT NULL,
  `shipservicelevel` varchar(50) DEFAULT NULL,
  `ShippingNote1` varchar(200) DEFAULT NULL,
  `ShippingNote2` varchar(50) DEFAULT NULL,
  `StoreTypeID` int DEFAULT '0',
  `StoreID` int DEFAULT '0',
  `ShipCarrier` varchar(50) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsEmailed` tinyint(1) DEFAULT NULL,
  `ServiceID` int DEFAULT '-1',
  `AmazonGiftWrapType` varchar(255) DEFAULT NULL,
  `AmazonGiftMessageText` varchar(255) DEFAULT NULL,
  `ShippingMethod` varchar(255) DEFAULT NULL,
  `dropShipCustomerID` int DEFAULT '0',
  PRIMARY KEY (`InvoiceID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceTypeID` (`InvoiceTypeID`),
  KEY `BillingAddrID` (`BillingAddrID`),
  KEY `BSAddressID` (`BSAddressID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `dropShipCustomerID` (`dropShipCustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `EstNum` (`EstNum`),
  KEY `InvoiceStyleID` (`InvoiceStyleID`),
  KEY `MessageID` (`MessageID`),
  KEY `orderid` (`orderid`),
  KEY `OrderNum` (`OrderNum`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PONum` (`PONum`),
  KEY `RcvNum` (`RcvNum`),
  KEY `RefNum` (`RefNum`),
  KEY `SalesRepID` (`SalesRepID`),
  KEY `SalesTaxID` (`SalesTaxID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `ShippingAddrID` (`ShippingAddrID`),
  KEY `StoreID` (`StoreID`),
  KEY `TermID` (`TermID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoicesalessummaryamt`
--

DROP TABLE IF EXISTS `bca_invoicesalessummaryamt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoicesalessummaryamt` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `InvoiceID` int DEFAULT '0',
  `taxable` double DEFAULT '0',
  `nontaxable` double DEFAULT '0',
  `companyID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `invoiceStatus` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `companyID` (`companyID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoiceshipdetail`
--

DROP TABLE IF EXISTS `bca_invoiceshipdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoiceshipdetail` (
  `ShipDetailID` int NOT NULL AUTO_INCREMENT,
  `ShippingServiceID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `BillToAddressID` int DEFAULT '0',
  `COD` int DEFAULT '0',
  `AddShipping` tinyint(1) DEFAULT NULL,
  `HandlingCharge` double DEFAULT '0',
  `StealthPostage` tinyint(1) DEFAULT NULL,
  `BallonRate` tinyint(1) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` int DEFAULT '0',
  `Description` varchar(50) DEFAULT NULL,
  `vValue` varchar(50) DEFAULT NULL,
  `ReturnAddress` varchar(50) DEFAULT NULL,
  `IsRealTimeShipping` int DEFAULT '0',
  PRIMARY KEY (`ShipDetailID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `ShipDetailID` (`ShipDetailID`),
  KEY `ShippingServiceID` (`ShippingServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoiceshipped`
--

DROP TABLE IF EXISTS `bca_invoiceshipped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoiceshipped` (
  `InvoiceID` int NOT NULL AUTO_INCREMENT,
  `OrderNum` int DEFAULT '0',
  `PONum` int DEFAULT '0',
  `RcvNum` int DEFAULT '0',
  `EstNum` int DEFAULT '0',
  `EmployeeID` int DEFAULT '-1',
  `RefNum` varchar(35) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `Memo` varchar(150) DEFAULT NULL,
  `BillingAddrID` int DEFAULT '0',
  `ShippingAddrID` int DEFAULT '0',
  `BSAddressID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `InvoiceTypeID` int DEFAULT '0',
  `InvoiceStyleID` int DEFAULT '0',
  `Weight` double DEFAULT '0',
  `SubTotal` double DEFAULT '0',
  `Tax` double DEFAULT '0',
  `SH` double DEFAULT '0',
  `Total` double DEFAULT '0',
  `AdjustedTotal` double DEFAULT '0',
  `PaidAmount` double DEFAULT '0',
  `Balance` double DEFAULT '0',
  `SalesRepID` int DEFAULT '0',
  `TermID` int DEFAULT '0',
  `PaymentTypeID` int DEFAULT '0',
  `ShipCarrierID` int DEFAULT '0',
  `MessageID` int DEFAULT '0',
  `SalesTaxID` int DEFAULT '0',
  `Taxable` int DEFAULT '0',
  `Shipped` int DEFAULT '0',
  `IsReceived` tinyint(1) DEFAULT '0',
  `IsPaymentCompleted` tinyint(1) DEFAULT '0',
  `FromPO` tinyint(1) DEFAULT NULL,
  `DateConfirmed` datetime DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `invoiceStatus` int DEFAULT '0',
  `orderid` varchar(50) DEFAULT NULL,
  `shipservicelevel` varchar(50) DEFAULT NULL,
  `ShippingNote1` varchar(200) DEFAULT NULL,
  `ShippingNote2` varchar(50) DEFAULT NULL,
  `StoreTypeID` int DEFAULT '0',
  `StoreID` int DEFAULT '0',
  `ShipCarrier` varchar(50) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsEmailed` tinyint(1) DEFAULT NULL,
  `ServiceID` int DEFAULT '-1',
  `AmazonGiftWrapType` varchar(255) DEFAULT NULL,
  `AmazonGiftMessageText` varchar(255) DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `TransactionType` int DEFAULT '0',
  `TrackingCode` varchar(50) DEFAULT NULL,
  `GatewayTypeID` int DEFAULT '0',
  `ShippingMethod` varchar(50) DEFAULT NULL,
  `ShippingLabel` varchar(200) DEFAULT NULL,
  `LabelPrinted` varchar(50) DEFAULT NULL,
  `dropShipCustomerID` int DEFAULT '0',
  `JobCategoryID` int DEFAULT '0',
  `BillID` int DEFAULT '0',
  `isBillReceived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  UNIQUE KEY `InvoiceID` (`InvoiceID`),
  KEY `BillingAddrID` (`BillingAddrID`),
  KEY `BSAddressID` (`BSAddressID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `dropShipCustomerID` (`dropShipCustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `EstNum` (`EstNum`),
  KEY `GatewayTypeID` (`GatewayTypeID`),
  KEY `InvoiceStyleID` (`InvoiceStyleID`),
  KEY `InvoiceTypeID` (`InvoiceTypeID`),
  KEY `MessageID` (`MessageID`),
  KEY `orderid` (`orderid`),
  KEY `OrderNum` (`OrderNum`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PONum` (`PONum`),
  KEY `RcvNum` (`RcvNum`),
  KEY `RefNum` (`RefNum`),
  KEY `SalesRepID` (`SalesRepID`),
  KEY `SalesTaxID` (`SalesTaxID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `ShippingAddrID` (`ShippingAddrID`),
  KEY `StoreID` (`StoreID`),
  KEY `TermID` (`TermID`),
  KEY `TrackingCode` (`TrackingCode`),
  KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoicestyle`
--

DROP TABLE IF EXISTS `bca_invoicestyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoicestyle` (
  `InvoiceStyleID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  UNIQUE KEY `InvoiceStyleID` (`InvoiceStyleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invoicetype`
--

DROP TABLE IF EXISTS `bca_invoicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invoicetype` (
  `InvoiceTypeID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `QtyReduction` float DEFAULT '0',
  `Payable` tinyint(1) DEFAULT NULL,
  `Receivable` tinyint(1) DEFAULT NULL,
  `Active` int DEFAULT '1',
  UNIQUE KEY `InvoiceTypeID` (`InvoiceTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_invstatus`
--

DROP TABLE IF EXISTS `bca_invstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_invstatus` (
  `InvStatusID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  UNIQUE KEY `InvStatusID` (`InvStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_itemcategory`
--

DROP TABLE IF EXISTS `bca_itemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_itemcategory` (
  `ItemCategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT '0',
  `Detail` varchar(50) DEFAULT '0',
  `ParentItemCategoryID` int DEFAULT '0',
  KEY `ItemCategoryID` (`ItemCategoryID`),
  KEY `ParentItemCategoryID` (`ParentItemCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_iteminventory`
-- Hasan
DROP TABLE IF EXISTS `bca_iteminventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_iteminventory` (
  `InventoryID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT NULL,
  `ParentID` int DEFAULT NULL,
  `InventoryCode` varchar(50) DEFAULT NULL,
  `SerialNum` varchar(50) DEFAULT NULL,
  `InventoryName` longtext,
  `InventoryDescription` longtext,
  `Qty` int DEFAULT NULL,
  `AvailableQty` int DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `PurchasePrice` double DEFAULT NULL,
  `SalePrice` double DEFAULT NULL,
  `DealerPrice` decimal(19,4) DEFAULT NULL,
  `Taxable` int DEFAULT NULL,
  `isCategory` tinyint(1) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `PictureURL` varchar(255) DEFAULT NULL,
  `Active` int DEFAULT NULL,
  `DateConfirmed` datetime DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `ItemTypeID` int DEFAULT NULL,
  `RefNum` varchar(50) DEFAULT NULL,
  `InventoryBarCode` varchar(50) DEFAULT NULL,
  `Att1_ID` int DEFAULT NULL,
  `Att2_ID` int DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `SizeH` double DEFAULT NULL,
  `SizeW` double DEFAULT NULL,
  `SizeL` double DEFAULT NULL,
  `IsNewItemCode` tinyint(1) DEFAULT NULL,
  `Message` longtext,
  `SpecialHanding` varchar(50) DEFAULT NULL,
  `ReorderPoint` int DEFAULT NULL,
  `isDropShip` tinyint(1) DEFAULT NULL,
  `isDiscontinued` tinyint(1) DEFAULT NULL,
  `OrderUnit` varchar(250) DEFAULT NULL,
  `ReorderMessage` varchar(50) DEFAULT NULL,
  `StoreTypeID` int DEFAULT NULL,
  `SMCInventoryID` varchar(50) DEFAULT NULL,
  `EBayInventoryID` varchar(50) DEFAULT NULL,
  `ServiceUnit` varchar(50) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `SalesTaxRate` double DEFAULT NULL,
  `AmazonQty` int DEFAULT NULL,
  `taxCode` varchar(50) DEFAULT NULL,
  `InvoiceInNum` int DEFAULT NULL,
  `POInNum` int DEFAULT NULL,
  `AssemblyCost` double DEFAULT NULL,
  `isIgnoreQOH` int DEFAULT NULL,
  `isSynchWitheBay` int DEFAULT NULL,
  `isSynchWithSMC` int DEFAULT NULL,
  `isSynchWithAmazone` int DEFAULT NULL,
  `isConsignedItem` tinyint(1) DEFAULT NULL,
  `COLOR` varchar(255) DEFAULT NULL,
  `itemSubCategory` int DEFAULT '0',
  `isItemTaxable` tinyint(1) DEFAULT '0',
  `isDiscounted` tinyint(1) DEFAULT '0',
  `isPrimarySupplier` tinyint(1) DEFAULT '0',
  `productSKU` varchar(255) DEFAULT NULL,
  `supplierSKU` varchar(255) DEFAULT NULL,
  `minOrderUnit` int DEFAULT '0',
  `weightUnit` int DEFAULT '0',
  `textAreaContent` varchar(5000) DEFAULT NULL,
  `supplierIDs` varchar(255) DEFAULT NULL,
  `actualWeight` double DEFAULT '0',
  `accountId` int DEFAULT '0',
  `measurementId` int DEFAULT '0',
  `subMeasurementId` int DEFAULT '0',
  `DateReceived` datetime DEFAULT NULL,
  `Memo` varchar(250) DEFAULT NULL,
  `ExpectedQty` int DEFAULT '0',
  UNIQUE KEY `InventoryID` (`InventoryID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `EBayInventoryID` (`EBayInventoryID`),
  KEY `InventoryBarCode` (`InventoryBarCode`),
  KEY `InvoiceInNum` (`InvoiceInNum`),
  KEY `ItemTypeID` (`ItemTypeID`),
  KEY `ParentID` (`ParentID`),
  KEY `POInNum` (`POInNum`),
  KEY `SalesTaxRate` (`SalesTaxRate`),
  KEY `SerialNum` (`SerialNum`),
  KEY `SMCInventoryID` (`SMCInventoryID`),
  KEY `StoreTypeID` (`StoreTypeID`),
  KEY `taxCode` (`taxCode`)
) ENGINE=InnoDB AUTO_INCREMENT=6885 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_jobcategory`
--

DROP TABLE IF EXISTS `bca_jobcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_jobcategory` (
  `JobCategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `isDefault` int DEFAULT '0',
  `isRecurringServiceJob` int DEFAULT '0',
  PRIMARY KEY (`JobCategoryID`),
  UNIQUE KEY `JobCategoryID` (`JobCategoryID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_label`
--

DROP TABLE IF EXISTS `bca_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_label` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LabelType` varchar(50) DEFAULT NULL,
  `Mar_Top` double DEFAULT '0',
  `Mar_Left` double DEFAULT '0',
  `Size_Width` double DEFAULT '0',
  `Size_Height` double DEFAULT '0',
  `Spacing_Hor` double DEFAULT '0',
  `Spacing_Vert` double DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LabelType` (`LabelType`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_lineofcreditterm`
--

DROP TABLE IF EXISTS `bca_lineofcreditterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_lineofcreditterm` (
  `CreditTermId` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(255) DEFAULT NULL,
  `Active` int DEFAULT '1',
  `Days` int DEFAULT '0',
  `isDefault` int DEFAULT '0',
  PRIMARY KEY (`CreditTermId`),
  KEY `CompanyID` (`CompanyID`),
  KEY `CreditTermId` (`CreditTermId`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_location`
--

DROP TABLE IF EXISTS `bca_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_location` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `LocationID` (`LocationID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mailtemplate`
--

DROP TABLE IF EXISTS `bca_mailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mailtemplate` (
  `TemplateID` int NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(255) DEFAULT NULL,
  `TemplateContent` longtext,
  `Subject` longtext,
  `Active` int DEFAULT '0',
  PRIMARY KEY (`TemplateID`),
  KEY `TemplateName` (`TemplateName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masterbalancesheetitem`
--

DROP TABLE IF EXISTS `bca_masterbalancesheetitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masterbalancesheetitem` (
  `balancesheetitemID` int NOT NULL AUTO_INCREMENT,
  `CategoryTypeID` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  PRIMARY KEY (`balancesheetitemID`),
  KEY `CategoryTypeID` (`CategoryTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masterclientcategory`
--

DROP TABLE IF EXISTS `bca_masterclientcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masterclientcategory` (
  `CVCategoryID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  KEY `CVCategoryID` (`CVCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mastercreditcardtype`
--

DROP TABLE IF EXISTS `bca_mastercreditcardtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mastercreditcardtype` (
  `CCTypeID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  KEY `CCTypeID` (`CCTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mastercustomergroup`
--

DROP TABLE IF EXISTS `bca_mastercustomergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mastercustomergroup` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CustomerGroupName` varchar(50) DEFAULT NULL,
  `CustomerGroupID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masteritemcategory`
--

DROP TABLE IF EXISTS `bca_masteritemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masteritemcategory` (
  `ItemCategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT '0',
  `Detail` varchar(50) DEFAULT '0',
  `ParentItemCategoryID` int DEFAULT '0',
  KEY `ItemCategoryID` (`ItemCategoryID`),
  KEY `ParentItemCategoryID` (`ParentItemCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masterpaymentgateways`
--

DROP TABLE IF EXISTS `bca_masterpaymentgateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masterpaymentgateways` (
  `GatewayID` int NOT NULL AUTO_INCREMENT,
  `GatewayType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GatewayID`),
  KEY `GatewayID` (`GatewayID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masterpaymenttype`
--

DROP TABLE IF EXISTS `bca_masterpaymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masterpaymenttype` (
  `PaymentTypeID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  KEY `PaymentTypeID` (`PaymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masterreceivedtype`
--

DROP TABLE IF EXISTS `bca_masterreceivedtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masterreceivedtype` (
  `PaymentTypeID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  KEY `PaymentTypeID` (`PaymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masterrmareason`
--

DROP TABLE IF EXISTS `bca_masterrmareason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masterrmareason` (
  `rmaReasonID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  KEY `rmaReasonID` (`rmaReasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mastershipcarrier`
--

DROP TABLE IF EXISTS `bca_mastershipcarrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mastershipcarrier` (
  `ShipCarrierID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  KEY `ShipCarrierID` (`ShipCarrierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mastershippingcontainer`
--

DROP TABLE IF EXISTS `bca_mastershippingcontainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mastershippingcontainer` (
  `ContainerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '1',
  KEY `ContainerID` (`ContainerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mastershippingmailtype`
--

DROP TABLE IF EXISTS `bca_mastershippingmailtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mastershippingmailtype` (
  `MailTypeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '1',
  PRIMARY KEY (`MailTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mastershippingpackagesize`
--

DROP TABLE IF EXISTS `bca_mastershippingpackagesize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mastershippingpackagesize` (
  `PackageSizeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '1',
  KEY `PackageSizeID` (`PackageSizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_masterstartingmodule`
--

DROP TABLE IF EXISTS `bca_masterstartingmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_masterstartingmodule` (
  `StartModuleID` int NOT NULL AUTO_INCREMENT,
  `BusinessTypeID` int DEFAULT NULL,
  `ModuleName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StartModuleID`),
  KEY `BusinessTypeID` (`BusinessTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_mastervendorcategory`
--

DROP TABLE IF EXISTS `bca_mastervendorcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_mastervendorcategory` (
  `CVCategoryID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  KEY `CVCategoryID` (`CVCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_message`
--

DROP TABLE IF EXISTS `bca_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_message` (
  `MessageID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(255) DEFAULT '0',
  `Active` int DEFAULT '1',
  UNIQUE KEY `MessageID` (`MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_multiprintpriority`
--

DROP TABLE IF EXISTS `bca_multiprintpriority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_multiprintpriority` (
  `SortBy` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  `IseSales` int DEFAULT '0',
  `Priority` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_ordertemplate`
--

DROP TABLE IF EXISTS `bca_ordertemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_ordertemplate` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `TemplatePath` varchar(255) DEFAULT NULL,
  `TemplateName` varchar(255) DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  `ActiveData` int DEFAULT '1',
  `DefaultValue` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`OrderID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_payment`
--

DROP TABLE IF EXISTS `bca_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `Amount` double DEFAULT '0',
  `PaymentTypeID` int DEFAULT '1',
  `PayerID` int DEFAULT NULL,
  `PayeeID` int DEFAULT NULL,
  `AccountID` int DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `CategoryID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `PayFromBalance` double DEFAULT '0',
  `PayToBalance` double DEFAULT '0',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsToBePrinted` tinyint(1) DEFAULT '0',
  `isNeedtoDeposit` tinyint(1) DEFAULT NULL,
  `CheckNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT '0',
  `PayableID` int DEFAULT '0',
  `RmaNo` int DEFAULT '0',
  `RmaItemID` int DEFAULT '0',
  `TransactionID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillNum` int DEFAULT '0',
  `Priority` int DEFAULT '0',
  `TransactionType` int DEFAULT '0',
  `AccountCategoryID` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_payment2invoice`
--

DROP TABLE IF EXISTS `bca_payment2invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_payment2invoice` (
  `PaymentID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `PaymentID` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_paymentdetail`
--

DROP TABLE IF EXISTS `bca_paymentdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_paymentdetail` (
  `DetailID` int NOT NULL AUTO_INCREMENT,
  `PaymentID` int DEFAULT '0',
  `RefNumber` varchar(50) DEFAULT NULL,
  `Memo` varchar(255) DEFAULT NULL,
  `CreditCardID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PayPal_txn_id` varchar(50) DEFAULT '0',
  `GatewayID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DetailID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `CreditCardID` (`CreditCardID`),
  KEY `DetailID` (`DetailID`),
  KEY `GatewayID` (`GatewayID`),
  KEY `PaymentID` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_paymenttype`
--

DROP TABLE IF EXISTS `bca_paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_paymenttype` (
  `PaymentTypeID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `Type` varchar(50) DEFAULT NULL,
  `CCTypeID` int DEFAULT '-1',
  `Active` int DEFAULT '1',
  `BankAcctID` int DEFAULT '0',
  `TypeCategory` int DEFAULT NULL,
  UNIQUE KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `BankAcctID` (`BankAcctID`),
  KEY `CCTypeID` (`CCTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_peritempricelevel`
--

DROP TABLE IF EXISTS `bca_peritempricelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_peritempricelevel` (
  `ItemPriceID` int NOT NULL AUTO_INCREMENT,
  `InventoryID` int DEFAULT '0',
  `InventoryCode` varchar(50) DEFAULT NULL,
  `CustomPricePercent` double DEFAULT '0',
  `ParentID` int DEFAULT '0',
  PRIMARY KEY (`ItemPriceID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `ItemPriceID` (`ItemPriceID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_postyle`
--

DROP TABLE IF EXISTS `bca_postyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_postyle` (
  `POStyleID` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  KEY `POStyleID` (`POStyleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_preference`
--

DROP TABLE IF EXISTS `bca_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_preference` (
  `PreferenceID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `CurrencyText` varchar(50) DEFAULT '0',
  `CurrencyID` int DEFAULT '0',
  `Weight` varchar(50) DEFAULT '0',
  `WeightID` int DEFAULT '0',
  `LabelSize` varchar(50) DEFAULT '0',
  `LabelSizeID` int DEFAULT '0',
  `BackupPeriod` varchar(50) DEFAULT '0',
  `BackupPeriodID` int DEFAULT '0',
  `BackupPlace` varchar(50) DEFAULT NULL,
  `AdminUsername` varchar(50) DEFAULT NULL,
  `AdminPassword` varchar(50) DEFAULT NULL,
  `Multimode` int DEFAULT '0',
  `CustomerCountry` varchar(50) DEFAULT NULL,
  `CustomerCountryID` int DEFAULT '0',
  `CustomerState` varchar(50) DEFAULT NULL,
  `CustomerStateID` int DEFAULT '0',
  `CustomerProvience` varchar(50) DEFAULT NULL,
  `CustomerTaxable` int DEFAULT '0',
  `CustomerUsecompanyname` int DEFAULT '0',
  `StartingInvoiceNumber` int DEFAULT '0',
  `InvoiceStyleID` int DEFAULT '0',
  `InvoiceFootnoteID` int DEFAULT '0',
  `UseProductWeight` int DEFAULT '0',
  `UseShippingTable` int DEFAULT '0',
  `SaleShowCountry` tinyint(1) DEFAULT NULL,
  `SaleShowTelephone` tinyint(1) DEFAULT NULL,
  `VendorCountry` varchar(50) DEFAULT NULL,
  `VendorCountryID` int DEFAULT '0',
  `VendorState` varchar(50) DEFAULT NULL,
  `VendorStateID` int DEFAULT '0',
  `VendorProvience` varchar(50) DEFAULT NULL,
  `VendorUseCompanyname` int DEFAULT '0',
  `StartingPONumber` varchar(50) DEFAULT NULL,
  `POStyleID` int DEFAULT '0',
  `POFootnoteID` int DEFAULT '0',
  `POShowCountry` tinyint(1) DEFAULT NULL,
  `POShowTelephone` tinyint(1) DEFAULT NULL,
  `StartingRINumber` varchar(50) DEFAULT NULL,
  `ProductTaxable` int DEFAULT '0',
  `EmployeeIDtoUse` int DEFAULT '0',
  `EmployeeState` varchar(50) DEFAULT NULL,
  `EmployeeStateID` int DEFAULT '0',
  `EmployeeCountry` varchar(50) DEFAULT NULL,
  `EmployeeCountryID` int DEFAULT '0',
  `SalesTaxRate` double DEFAULT '0',
  `HowOftenSalestax` int DEFAULT '0',
  `SalesTaxCode` varchar(20) DEFAULT NULL,
  `ShowReminder` int DEFAULT '0',
  `InvoiceMemo` int DEFAULT '0',
  `InvoiceMemoDays` int DEFAULT '0',
  `OverdueInvoice` int DEFAULT '0',
  `OverdueinvoiceDays` int DEFAULT '0',
  `InventoryOrder` int DEFAULT '0',
  `InventoryOrderDays` int DEFAULT '0',
  `BillstoPay` int DEFAULT '0',
  `BillstoPayDays` int DEFAULT '0',
  `EstimationMemo` int DEFAULT '0',
  `EstimationMemoDays` int DEFAULT '0',
  `POMemo` int DEFAULT '0',
  `POMemoDays` int DEFAULT '0',
  `ServiceBillsMemo` int DEFAULT '0',
  `ServiceBillsMemoDays` int DEFAULT '0',
  `Active` int DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CompanyLogoPath` varchar(255) DEFAULT NULL,
  `Charge_interest` double DEFAULT '0',
  `Charge_minimum` double DEFAULT '0',
  `Charge_grace` double DEFAULT '0',
  `Charge_reassess` tinyint(1) DEFAULT NULL,
  `Charge_name_display` int DEFAULT '3',
  `Charge_MarkFinance` tinyint(1) DEFAULT '0',
  `PrintByOrder` tinyint(1) DEFAULT NULL,
  `PrintInvoiceFrom` int DEFAULT '0',
  `PrintInvoiceTo` int DEFAULT '0',
  `PrintDateFrom` datetime DEFAULT NULL,
  `PrintDateTo` datetime DEFAULT NULL,
  `PrintTimeFrom` datetime DEFAULT NULL,
  `PrintTimeTo` datetime DEFAULT NULL,
  `PageSort_ShippingMethod` tinyint(1) DEFAULT NULL,
  `PageSort_ItemTitle` tinyint(1) DEFAULT NULL,
  `PageSort_Destination` tinyint(1) DEFAULT NULL,
  `PageSort_SpecialHanding` tinyint(1) DEFAULT NULL,
  `PageSort_Location` tinyint(1) DEFAULT NULL,
  `SkipPrinted` tinyint(1) DEFAULT NULL,
  `MarkPrinted` tinyint(1) DEFAULT NULL,
  `InvoicesToPrint` int DEFAULT '0',
  `PackingSlipsToPrint` int DEFAULT '0',
  `PackingReturnPolicy` longtext,
  `PrintPaperType` int DEFAULT '0',
  `PrintCoupon` tinyint(1) DEFAULT NULL,
  `PrintGiftMessage` tinyint(1) DEFAULT NULL,
  `CouponLocation` varchar(255) DEFAULT NULL,
  `BarcodeID` int DEFAULT '0',
  `Mailserver` varchar(80) DEFAULT NULL,
  `Mail_username` varchar(50) DEFAULT NULL,
  `Mail_password` varchar(20) DEFAULT NULL,
  `Mail_Auth` tinyint(1) DEFAULT NULL,
  `Mail_senderEmail` varchar(50) DEFAULT NULL,
  `AR_Term` int DEFAULT '0',
  `AR_Latefee` decimal(19,4) DEFAULT '0.0000',
  `PrintFormNo_Billing` int DEFAULT '0',
  `PrintFormNo_Invoice` int DEFAULT '0',
  `Performance` varchar(255) DEFAULT NULL,
  `TimeSheetSet` int DEFAULT '2',
  `ShippingFeeMethod` int DEFAULT '0',
  `SalesViaID` int DEFAULT '0',
  `SalesTermID` int DEFAULT '0',
  `SalesRepID` int DEFAULT '0',
  `SalesPayMethodID` int DEFAULT '0',
  `SalesPOPrefix` varchar(50) DEFAULT NULL,
  `IsEsalesEnabled` tinyint(1) DEFAULT NULL,
  `EsalesAmazonMerchant` tinyint(1) DEFAULT NULL,
  `EsalesAmazonMerchantOnline` tinyint(1) DEFAULT NULL,
  `EsalesAmazonMarket` tinyint(1) DEFAULT NULL,
  `EsaleseBay` tinyint(1) DEFAULT NULL,
  `EsaleseBayBlackthorne` tinyint(1) DEFAULT NULL,
  `EsalesHalfdotcom` tinyint(1) DEFAULT NULL,
  `EsalesMagento` tinyint(1) DEFAULT NULL,
  `EsalesSmc` tinyint(1) DEFAULT NULL,
  `DefaultAmazonSellerBankID` int DEFAULT '0',
  `DefaultAmazonSellerOnlineBankID` int DEFAULT '0',
  `DefaultAmazonMarketBankID` int DEFAULT '0',
  `DefaultHalfdotComBankID` int DEFAULT '0',
  `DefaultEBayBankID` int DEFAULT '0',
  `DefaultEBayOnlineBankID` int DEFAULT '0',
  `DefaultSMCBankID` int DEFAULT '0',
  `POViaID` int DEFAULT '0',
  `POTermID` int DEFAULT '0',
  `PORepID` int DEFAULT '0',
  `POPayMethodID` int DEFAULT '0',
  `DefaultPayableAccountID` int DEFAULT '0',
  `AutoPaymentDuration` int DEFAULT '0',
  `DefaultCategoryID` int DEFAULT '0',
  `DefaultVendorCategoryID` int DEFAULT '0',
  `DefaultRMARepairmentCharge` double DEFAULT '0',
  `DefaultRMACheckingBankID` int DEFAULT '0',
  `DefaultBankTransferAccID` int DEFAULT '0',
  `DefaultARCategoryID` int DEFAULT '0',
  `DefaultReimbusrementSetting` int DEFAULT '0',
  `IsRatePriceChangeble` tinyint(1) DEFAULT NULL,
  `IsSalePrefix` tinyint(1) DEFAULT NULL,
  `IsPurchasePrefix` tinyint(1) DEFAULT NULL,
  `shippadjustmentvalue` varchar(50) DEFAULT NULL,
  `shippadjustmentunit` varchar(50) DEFAULT NULL,
  `DefaultCustomerSortID` int DEFAULT '0',
  `DefaultVendorrSortID` int DEFAULT '0',
  `ExtraCharge` tinyint(1) DEFAULT NULL,
  `ChargeAmount` int DEFAULT '0',
  `OrderAmount` int DEFAULT '0',
  `DropShipCharge` int DEFAULT '0',
  `ShowDropShipItems` tinyint(1) DEFAULT NULL,
  `FilterOption` varchar(50) DEFAULT NULL,
  `DefaultCustomerGroupID` int DEFAULT '0',
  `IsRefundAllowed` tinyint(1) DEFAULT NULL,
  `CopyAddress` tinyint(1) DEFAULT NULL,
  `GlobalShipSetup` tinyint(1) DEFAULT NULL,
  `WorldShipSetup` tinyint(1) DEFAULT NULL,
  `FedExSetup` tinyint(1) DEFAULT NULL,
  `MISetup` tinyint(1) DEFAULT NULL,
  `DefaultMSAccountingBankID` int DEFAULT '0',
  `InvoiceSaveLocation` varchar(255) DEFAULT NULL,
  `PrinteSalesInvoiceFrom` int DEFAULT '0',
  `PrinteSalesInvoiceTo` int DEFAULT '0',
  `eSalesPrintDateFrom` datetime DEFAULT NULL,
  `eSalesPrintDateTo` datetime DEFAULT NULL,
  `eSalesPrintTimeFrom` datetime DEFAULT NULL,
  `eSalesPrintTimeTo` datetime DEFAULT NULL,
  `eSalesInvoicesToPrint` int DEFAULT '0',
  `eSalesPackingSlipsToPrint` int DEFAULT '0',
  `eSalesPrintPaperType` int DEFAULT '0',
  `eSalesPrintByOrder` int DEFAULT '0',
  `eSalesSkipPrinted` int DEFAULT '0',
  `eSalesPrintMarketName` int DEFAULT '0',
  `eSalesPageSort_Store` int DEFAULT '0',
  `eSalesPageSort_ShippingMethod` int DEFAULT '0',
  `eSalesPageSort_ItemTitle` int DEFAULT '0',
  `eSalesPageSort_Destination` int DEFAULT '0',
  `eSalesPageSort_SpecialHanding` int DEFAULT '0',
  `eSalesPageSort_Location` int DEFAULT '0',
  `eSalesPrintCoupon` int DEFAULT '0',
  `eSalesPrintGiftMessage` int DEFAULT '0',
  `eSalesCouponLocation` varchar(255) DEFAULT NULL,
  `PrintBills` int DEFAULT '0',
  `MailToCustomer` int DEFAULT '0',
  `EmployeeInChargeID` int DEFAULT '0',
  `UseCurrentDate` int DEFAULT '1',
  `ImportDays` int DEFAULT '7',
  `AllowMutipleTimeImport` int DEFAULT '0',
  `PrintTestPage` int DEFAULT '1',
  `eSalesPrintTestPage` int DEFAULT '0',
  `StartingBillNumber` int DEFAULT '0',
  `showBillingStatStyle` int DEFAULT '0',
  `showReorderPointList` int DEFAULT '0',
  `ShowReorderPointWarring` int DEFAULT '0',
  `MailOrderConfirm` int DEFAULT '0',
  `BudgetStartMonth` int DEFAULT '0',
  `BudgetEndMonth` int DEFAULT '0',
  `RecentActivityCount` int DEFAULT '0',
  `isGalaxyShip` tinyint(1) DEFAULT NULL,
  `isMailInnovation` tinyint(1) DEFAULT NULL,
  `DefaultPackingSlipStyleID` int DEFAULT '0',
  `isUPSWorldShip` tinyint(1) DEFAULT NULL,
  `showCombinedBilling` int DEFAULT '1',
  `showSalesOrder` int DEFAULT '0',
  `PrintSalesFrom` int DEFAULT '0',
  `PrintSalesTo` int DEFAULT '0',
  `LineofCreditTermID` int DEFAULT '0',
  `Memobill` int DEFAULT NULL,
  `MemobillDays` int DEFAULT NULL,
  `InvoiceStyleTypeID` int DEFAULT NULL,
  `SalesOrderStyleTypeID` int DEFAULT NULL,
  `EstimationStyleTypeID` int DEFAULT '0',
  `POStyleTypeID` int DEFAULT NULL,
  `BillingStyleTypeID` int DEFAULT NULL,
  `PackingSlipStyleTypeID` int DEFAULT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `defaultModule` int DEFAULT NULL,
  `eBayListingDays` varchar(255) DEFAULT NULL,
  `eBayPaymentMethod` varchar(255) DEFAULT NULL,
  `eBayShippingFees` double DEFAULT NULL,
  `isIgnoreQOH` int DEFAULT NULL,
  `StartingEstimationNumber` int DEFAULT '0',
  `EstimationStyleID` int DEFAULT '1',
  `SOStyleID` int DEFAULT '1',
  `ReservedQuantity` int DEFAULT NULL,
  `SalesOrderQty` int DEFAULT NULL,
  `BuildRefNo` int DEFAULT '0',
  `AmazonSellerTextFilepath` varchar(255) DEFAULT NULL,
  `AmazonMarchantTextFilepath` varchar(255) DEFAULT NULL,
  `ShippingDBIPAddress` longtext,
  `ShippingDBName` longtext,
  `PackingSlipCompanyName` varchar(255) DEFAULT NULL,
  `IsPackingSlipNameEnable` int DEFAULT NULL,
  `PackingSlipAddress` varchar(255) DEFAULT '0',
  `PackingSlipCity` varchar(255) DEFAULT '0',
  `PackingSlipState` varchar(50) DEFAULT '0',
  `PackingSlipProvince` varchar(50) DEFAULT '0',
  `PackingSlipCountry` varchar(50) DEFAULT '0',
  `PackingSlipZipcode` varchar(50) DEFAULT '0',
  `iseSalesItemUploadSchedule` int DEFAULT '1',
  `isAddAsin` int DEFAULT NULL,
  `poboard` int DEFAULT '1',
  `itemsReceivedBoard` int DEFAULT '1',
  `itemsShippedBoard` int DEFAULT '1',
  `SalesOrderBoard` int DEFAULT '1',
  `StartingSalesOrderNumber` int DEFAULT '0',
  `ProductCategoryID` int DEFAULT '0',
  `LocationID` int DEFAULT '0',
  `ReOrderPoint` int DEFAULT '0',
  `VendorBusinessTypeID` int DEFAULT '0',
  `VendorInvoiceStyleId` int DEFAULT '0',
  `defaultARCategoryIDforac` int DEFAULT NULL,
  `defaultARCategoryIDforpo` int DEFAULT NULL,
  `defaultARCategoryIDforbp` int DEFAULT NULL,
  `defaultdepositoforac` int DEFAULT NULL,
  `defaultdepositoforpo` int DEFAULT NULL,
  `defaultdepositoforbp` int DEFAULT NULL,
  `defaultReceivedforac` int DEFAULT NULL,
  `defaultReceivedforpo` int DEFAULT NULL,
  `defaultReceivedforbp` int DEFAULT NULL,
  `CVCategoryID` int DEFAULT NULL,
  `Packing_slip_terms` varchar(3000) DEFAULT NULL,
  `invoice_terms` varchar(3000) DEFAULT NULL,
  `ShowUSAInBillShipAddress` tinyint(1) DEFAULT '0',
  `DisplayPeriod` int DEFAULT '0',
  `InventoryDefaultCategory` int DEFAULT '0',
  `CustomerType` int DEFAULT '0',
  `PriceLevelCustomer` int DEFAULT '0',
  `PriceLevelDealer` int DEFAULT '0',
  `PriceLevelGeneral` int DEFAULT '0',
  `PriceLevelPriority` int DEFAULT '0',
  `InvoiceTemplateType` int DEFAULT '1',
  `EstimationTemplateType` int DEFAULT '1',
  `SalesOrderTemplateType` int DEFAULT '1',
  `PurchaseOrderTemplateType` int DEFAULT '1',
  `PackingSlipTemplateType` int DEFAULT '1',
  `ChargeSalestax` int DEFAULT '0',
  `SalesTaxID` int DEFAULT '0',
  `SalesTaxRate2` double DEFAULT '0',
  `isBackOrderNeeded` tinyint(1) DEFAULT NULL,
  `isRecurringServiceBill` tinyint(1) DEFAULT NULL,
  `serviceBillName` varchar(255) DEFAULT NULL,
  KEY `BarcodeID` (`BarcodeID`),
  KEY `BillingStyleTypeID` (`BillingStyleTypeID`),
  KEY `PreferenceID` (`PreferenceID`),
  KEY `CustomerStateID` (`CustomerStateID`),
  KEY `DefaultPayableAccountID` (`DefaultPayableAccountID`),
  KEY `DefaultARCategoryID` (`DefaultARCategoryID`),
  KEY `DefaultBankTransferAccID` (`DefaultBankTransferAccID`),
  KEY `DefaultCategoryID` (`DefaultCategoryID`),
  KEY `DefaultCustomerGroupID` (`DefaultCustomerGroupID`),
  KEY `DefaultCustomerSortID` (`DefaultCustomerSortID`),
  KEY `DefaultEBayBankID` (`DefaultEBayBankID`),
  KEY `DefaultEBayOnlineBankID` (`DefaultEBayOnlineBankID`),
  KEY `DefaultPackingSlipStyleID` (`DefaultPackingSlipStyleID`),
  KEY `DefaultVendorCategoryID` (`DefaultVendorCategoryID`),
  KEY `DefaultVendorrSortID` (`DefaultVendorrSortID`),
  KEY `InvoiceStyleTypeID` (`InvoiceStyleTypeID`),
  KEY `IsRefundAllowed` (`IsRefundAllowed`),
  KEY `LineofCreditTermID` (`LineofCreditTermID`),
  KEY `PackingSlipStyleTypeID` (`PackingSlipStyleTypeID`),
  KEY `PackingSlipZipcode` (`PackingSlipZipcode`),
  KEY `POPayMethodID` (`POPayMethodID`),
  KEY `PORepID` (`PORepID`),
  KEY `POStyleID` (`POStyleID`),
  KEY `POStyleTypeID` (`POStyleTypeID`),
  KEY `POTermID` (`POTermID`),
  KEY `POViaID` (`POViaID`),
  KEY `SalesOrderStyleTypeID` (`SalesOrderStyleTypeID`),
  KEY `SalesPayMethodID` (`SalesPayMethodID`),
  KEY `VendorStateID` (`VendorStateID`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_pricelevel`
--

DROP TABLE IF EXISTS `bca_pricelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_pricelevel` (
  `PriceLevelID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `PriceLevelType` varchar(50) DEFAULT NULL,
  `FixedPercentage` double DEFAULT '0',
  `CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`PriceLevelID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `PriceLevelID` (`PriceLevelID`)
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_printstyle`
--

DROP TABLE IF EXISTS `bca_printstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_printstyle` (
  `StyleTypeID` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_productchannelsetting`
--

DROP TABLE IF EXISTS `bca_productchannelsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_productchannelsetting` (
  `ChannelsettingID` int NOT NULL AUTO_INCREMENT,
  `InventoryID` int DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `StoreName` varchar(255) DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  `SalesPrice` double DEFAULT NULL,
  `ProductSKU` varchar(255) DEFAULT NULL,
  `Active` int DEFAULT NULL,
  PRIMARY KEY (`ChannelsettingID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `StoreID` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_quickbooklist`
--

DROP TABLE IF EXISTS `bca_quickbooklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_quickbooklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerListID` varchar(50) DEFAULT NULL,
  `cvID` int DEFAULT '0',
  `inventoryListID` varchar(50) DEFAULT NULL,
  `invID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CompanyID` (`CompanyID`),
  KEY `customerListID` (`customerListID`),
  KEY `cvID` (`cvID`),
  KEY `id` (`id`),
  KEY `inventoryListID` (`inventoryListID`),
  KEY `invID` (`invID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_realtimeshippingservice`
--

DROP TABLE IF EXISTS `bca_realtimeshippingservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_realtimeshippingservice` (
  `ShippingServiceID` int NOT NULL AUTO_INCREMENT,
  `ShippingType` int DEFAULT '0',
  `ShippingService` varchar(50) DEFAULT NULL,
  `Price` double DEFAULT '0',
  `Active` int DEFAULT '0',
  PRIMARY KEY (`ShippingServiceID`),
  KEY `ShippingServiceID` (`ShippingServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_receicedtype`
--

DROP TABLE IF EXISTS `bca_receicedtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_receicedtype` (
  `PaymentTypeID` int NOT NULL DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0',
  `Type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CCTypeID` int DEFAULT '-1',
  `Active` int DEFAULT '1',
  `BankAcctID` int DEFAULT '0',
  `TypeCategory` int DEFAULT NULL,
  `IsDefault` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_recentbills`
--

DROP TABLE IF EXISTS `bca_recentbills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_recentbills` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RecentBillID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `ServiceID` int DEFAULT '0',
  `LastBilldate` datetime DEFAULT NULL,
  `Type` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `ID` (`ID`),
  KEY `ServiceID` (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_recurrentpayment`
--

DROP TABLE IF EXISTS `bca_recurrentpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_recurrentpayment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `Amount` double DEFAULT '0',
  `PaymentTypeID` int DEFAULT '0',
  `PayerID` int DEFAULT '0',
  `PayeeID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `IsToBePrinted` tinyint(1) DEFAULT NULL,
  `CheckNumber` varchar(50) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `IsPaymentCompleted` tinyint(1) DEFAULT NULL,
  `PlanID` int DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `Memo` varchar(50) DEFAULT NULL,
  `RefPaymentID` int DEFAULT '0',
  `ServiceID` int DEFAULT '0',
  PRIMARY KEY (`PaymentID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `PayeeID` (`PayeeID`),
  KEY `PayerID` (`PayerID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PlanID` (`PlanID`),
  KEY `RefPaymentID` (`RefPaymentID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_recurrentpaymentplan`
--

DROP TABLE IF EXISTS `bca_recurrentpaymentplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_recurrentpaymentplan` (
  `PlanID` int DEFAULT '0',
  `PayeeID` int DEFAULT '0',
  `PaymentAccountID` int DEFAULT '0',
  `PaymentTypeID` int DEFAULT '0',
  `Amount` double DEFAULT '0',
  `SamePaymentAmount` tinyint(1) DEFAULT NULL,
  `LastPaymentAmount` double DEFAULT '0',
  `FirstPaymentDate` varchar(50) DEFAULT NULL,
  `Frequency` varchar(50) DEFAULT NULL,
  `Days` int DEFAULT '0',
  `RecurrentOption` int DEFAULT '0',
  `NumberOfPayments` int DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `LastPaymentDate` varchar(50) DEFAULT NULL,
  `PlanSetupDate` varchar(50) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Memo` varchar(50) DEFAULT NULL,
  `ServiceID` int DEFAULT '0',
  KEY `NumberOfPayments` (`NumberOfPayments`),
  KEY `PayeeID` (`PayeeID`),
  KEY `PaymentAccountID` (`PaymentAccountID`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PlanID` (`PlanID`),
  KEY `ServiceID` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_refundlist`
--

DROP TABLE IF EXISTS `bca_refundlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_refundlist` (
  `RefundID` int NOT NULL AUTO_INCREMENT,
  `OrderNum` int DEFAULT '0',
  `Amount` double DEFAULT '0',
  `OrderPaymentTypeID` int DEFAULT '0',
  `PaymentTypeID` varchar(50) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Status` int DEFAULT '0',
  `SalesRepID` int DEFAULT '0',
  `RefundReasonID` int DEFAULT '0',
  `PaymentID` int DEFAULT '0',
  `InvoiceStatus` int DEFAULT '0',
  `InvoiceTypeID` int DEFAULT '0',
  PRIMARY KEY (`RefundID`),
  UNIQUE KEY `RefundID` (`RefundID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceTypeID` (`InvoiceTypeID`),
  KEY `OrderNum` (`OrderNum`),
  KEY `OrderPaymentTypeID` (`OrderPaymentTypeID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `SalesRepID` (`SalesRepID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_refundreason`
--

DROP TABLE IF EXISTS `bca_refundreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_refundreason` (
  `ReasonID` int NOT NULL AUTO_INCREMENT,
  `RefundReason` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `IsDefaultReason` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ReasonID`),
  UNIQUE KEY `ReasonID` (`ReasonID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_reportproperty`
--

DROP TABLE IF EXISTS `bca_reportproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_reportproperty` (
  `ReportType` varchar(50) DEFAULT NULL,
  `ReportDateType` varchar(50) DEFAULT NULL,
  `ReportFrom` datetime DEFAULT NULL,
  `ReportTo` datetime DEFAULT NULL,
  `ShowCompanyName` tinyint(1) DEFAULT NULL,
  `CompanyName` varchar(70) DEFAULT NULL,
  `ShowReportTitle` tinyint(1) DEFAULT NULL,
  `ReportTitle` varchar(50) DEFAULT NULL,
  `ShowDatePrepared` tinyint(1) DEFAULT NULL,
  `ShowTimePrepared` tinyint(1) DEFAULT NULL,
  `PrintHeadAll` tinyint(1) DEFAULT NULL,
  `ColumnFont` varchar(50) DEFAULT NULL,
  `RowFont` varchar(50) DEFAULT NULL,
  `ReportTotalFont` varchar(50) DEFAULT NULL,
  `ReportDataFont` varchar(50) DEFAULT NULL,
  `CompanyNameFont` varchar(50) DEFAULT NULL,
  `ReportTitleFont` varchar(50) DEFAULT NULL,
  `DateFont` varchar(50) DEFAULT NULL,
  `PageNumberFont` varchar(50) DEFAULT NULL,
  `TimeFont` varchar(50) DEFAULT NULL,
  `NegativeRed` tinyint(1) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `ReportType` (`ReportType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_rmaitem`
--

DROP TABLE IF EXISTS `bca_rmaitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_rmaitem` (
  `RmaUniqueID` int NOT NULL AUTO_INCREMENT,
  `RmaNo` int DEFAULT '0',
  `CartID` int DEFAULT '0',
  `InventoryID` int NOT NULL DEFAULT '0',
  `InvName` varchar(50) DEFAULT NULL,
  `UnitPrice` double DEFAULT '0',
  `RmaItemQty` int DEFAULT '0',
  `Total` double DEFAULT '0',
  `parentReasonID` int DEFAULT '0',
  `Reason` varchar(50) DEFAULT NULL,
  `Action` varchar(50) DEFAULT NULL,
  `SubstituteInvoiceOrderNumber` int DEFAULT '0',
  `IsPaymentCompleted` tinyint(1) DEFAULT NULL,
  `PaidAmount` double DEFAULT '0',
  `Balance` double DEFAULT '0',
  `RmaItemID` int DEFAULT '0',
  `isAdjusted` tinyint(1) DEFAULT NULL,
  `TotalAdjustedQty` int DEFAULT '0',
  `isDeleted` int DEFAULT '0',
  PRIMARY KEY (`RmaUniqueID`),
  KEY `RmaNo` (`RmaNo`),
  KEY `CartID` (`CartID`),
  KEY `parentReasonID` (`parentReasonID`),
  KEY `RmaItemID` (`RmaItemID`),
  KEY `RmaUniqueID` (`RmaUniqueID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_rmamaster`
--

DROP TABLE IF EXISTS `bca_rmamaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_rmamaster` (
  `RmaID` int NOT NULL AUTO_INCREMENT,
  `RmaNo` int DEFAULT '0',
  `OrderNo` int DEFAULT '0',
  `RmaQty` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `ClientVendorID` int DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Memo` varchar(150) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `InvoiceTypeID` int DEFAULT '0',
  `RefRMANo` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`RmaID`),
  UNIQUE KEY `RmaID` (`RmaID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_rmareason`
--

DROP TABLE IF EXISTS `bca_rmareason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_rmareason` (
  `ReasonID` int NOT NULL AUTO_INCREMENT,
  `rmaReason` varchar(50) DEFAULT NULL,
  `parentReasonID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `parentReasonID` (`parentReasonID`),
  KEY `ReasonID` (`ReasonID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_rule`
--

DROP TABLE IF EXISTS `bca_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_rule` (
  `RuleName` varchar(50) NOT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Priority` int DEFAULT '0',
  `ChangeField` varchar(50) DEFAULT NULL,
  `ChangeTo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RuleName`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_ruleconditions`
--

DROP TABLE IF EXISTS `bca_ruleconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_ruleconditions` (
  `RuleName` varchar(50) DEFAULT NULL,
  `ConditionField` varchar(25) DEFAULT NULL,
  `OperatorName` varchar(25) DEFAULT NULL,
  `OperatorValue` varchar(25) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_salesorder`
--

DROP TABLE IF EXISTS `bca_salesorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_salesorder` (
  `SONum` int DEFAULT '0',
  `InvoiceId` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `SONum` (`SONum`),
  KEY `InvoiceId` (`InvoiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_salesrep`
--

DROP TABLE IF EXISTS `bca_salesrep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_salesrep` (
  `SalesRepID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  UNIQUE KEY `SalesRepID` (`SalesRepID`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_salessummary`
--

DROP TABLE IF EXISTS `bca_salessummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_salessummary` (
  `SalesID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` varchar(50) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Memo` longtext,
  `IsActive` int DEFAULT '0',
  PRIMARY KEY (`SalesID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `SalesID` (`SalesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_salessummarydetail`
--

DROP TABLE IF EXISTS `bca_salessummarydetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_salessummarydetail` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SalesID` int DEFAULT '0',
  `Amount` decimal(19,4) DEFAULT '0.0000',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`),
  KEY `SalesID` (`SalesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_salestax`
--

DROP TABLE IF EXISTS `bca_salestax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_salestax` (
  `SalesTaxID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int NOT NULL DEFAULT '0',
  `State` varchar(50) DEFAULT NULL,
  `Rate` float DEFAULT '0',
  `Active` int DEFAULT '1',
  UNIQUE KEY `SalesTaxID` (`SalesTaxID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_scheduletimes`
--

DROP TABLE IF EXISTS `bca_scheduletimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_scheduletimes` (
  `ScheduleTime` int DEFAULT '0',
  `ScheduleDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CategeoryType` int DEFAULT '0',
  `CompanyID` int DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `ScheduleMinute` int DEFAULT '0',
  `isCompleted` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `ScheduleTime` (`ScheduleTime`),
  KEY `StoreID` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_servicetype`
--

DROP TABLE IF EXISTS `bca_servicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_servicetype` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(50) DEFAULT NULL,
  `InvoiceStyleID` int DEFAULT '0',
  `InventoryID` int DEFAULT '0',
  `ServiceBillingDate` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `isUseBillCycle` int DEFAULT NULL,
  `ActiveFlag` int DEFAULT '1',
  PRIMARY KEY (`ServiceID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `InvoiceStyleID` (`InvoiceStyleID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_settings`
--

DROP TABLE IF EXISTS `bca_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_settings` (
  `DefaultPrinter` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `InvoicePrinter` varchar(50) DEFAULT NULL,
  `LabelPrinter` varchar(50) DEFAULT NULL,
  `eSalesPrinter` varchar(50) DEFAULT NULL,
  `CheckPrinter` varchar(50) DEFAULT NULL,
  `SalesSlipPrinter` varchar(50) DEFAULT NULL,
  `ReportPrinter` varchar(50) DEFAULT NULL,
  `PurchasePrinter` varchar(50) DEFAULT NULL,
  `isInvoiceMultiCopyPrintable` tinyint(1) DEFAULT NULL,
  `isLabelMultiCopyPrintable` tinyint(1) DEFAULT NULL,
  `isESalesMultiCopyPrintable` tinyint(1) DEFAULT NULL,
  `isCheckMultiCopyPrintable` tinyint(1) DEFAULT NULL,
  `isSalesSlipMultiCopyPrintable` tinyint(1) DEFAULT NULL,
  `isReportMultiCopyPrintable` tinyint(1) DEFAULT NULL,
  `isPurchaseMultiCopyPrintable` tinyint(1) DEFAULT NULL,
  `InvoicePrintableCopies` int DEFAULT '0',
  `LabelPrintableCopies` int DEFAULT '0',
  `ESalesPrintableCopies` int DEFAULT '0',
  `CheckPrintableCopies` int DEFAULT '0',
  `SalesSlipPrintableCopies` int DEFAULT '0',
  `ReportPrintableCopies` int DEFAULT '0',
  `PurchasePrintableCopies` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_shipcarrier`
--

DROP TABLE IF EXISTS `bca_shipcarrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_shipcarrier` (
  `ShipCarrierID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(255) DEFAULT '0',
  `Active` int DEFAULT '1',
  `ParentID` int DEFAULT '0',
  UNIQUE KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB AUTO_INCREMENT=899 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_shippingaddress`
--

DROP TABLE IF EXISTS `bca_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_shippingaddress` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `AddressName` varchar(50) NOT NULL,
  `ClientVendorID` int NOT NULL DEFAULT '-1',
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address1` varchar(75) NOT NULL,
  `Address2` varchar(75) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) NOT NULL,
  `ZipCode` varchar(50) DEFAULT '0',
  `Status` varchar(10) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Phone` varchar(20) NOT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `isDefault` int NOT NULL DEFAULT '0',
  `Active` int NOT NULL DEFAULT '1',
  `DBAName` varchar(45) DEFAULT NULL,
  `AddressType` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AddressID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `LastName` (`LastName`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1585 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_shippingrate`
--

DROP TABLE IF EXISTS `bca_shippingrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_shippingrate` (
  `ShippingRateID` int NOT NULL AUTO_INCREMENT,
  `ShipCarrierID` int NOT NULL DEFAULT '0',
  `Weight` double NOT NULL DEFAULT '0',
  `Price` decimal(19,4) DEFAULT '0.0000',
  PRIMARY KEY (`ShippingRateID`),
  UNIQUE KEY `ShippingRateID` (`ShippingRateID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `Weight` (`Weight`)
) ENGINE=InnoDB AUTO_INCREMENT=2185 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_shippingservice`
--

DROP TABLE IF EXISTS `bca_shippingservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_shippingservice` (
  `ShippingServiceID` int NOT NULL AUTO_INCREMENT,
  `ContainerID` int DEFAULT '0',
  `MailTypeID` int DEFAULT '0',
  `PackageSizeID` int DEFAULT '0',
  `HandlingFee` double DEFAULT '0',
  `ShipCarrierID` int DEFAULT '0',
  PRIMARY KEY (`ShippingServiceID`),
  KEY `ContainerID` (`ContainerID`),
  KEY `MailTypeID` (`MailTypeID`),
  KEY `PackageSizeID` (`PackageSizeID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `ShippingServiceID` (`ShippingServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_states`
--

DROP TABLE IF EXISTS `bca_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `country_id` int NOT NULL DEFAULT '1',
  `StateCode` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_store`
--

DROP TABLE IF EXISTS `bca_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_store` (
  `StoreID` int NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(50) DEFAULT NULL,
  `Abbreviation` varchar(255) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `StoreTypeID` int DEFAULT '0',
  `StoreTypeName` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(150) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Zipcode` varchar(20) DEFAULT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `FaxNumber` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PackingReturnPolicy` longtext,
  `LogoPath` varchar(255) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `eBayDeveloperID` varchar(50) DEFAULT NULL,
  `eBayApplicationID` varchar(50) DEFAULT NULL,
  `eBayCertificate` varchar(50) DEFAULT NULL,
  `eBayToken` longtext,
  `eBayEPSServerUrl` varchar(50) DEFAULT NULL,
  `eBayAPIServerUrl` varchar(50) DEFAULT NULL,
  `eBaySignInUrl` varchar(50) DEFAULT NULL,
  `LastOrderImportDate` datetime DEFAULT NULL,
  `amazonAccesKey` varchar(50) DEFAULT NULL,
  `amazonSecretKey` varchar(50) DEFAULT NULL,
  `amazonMarketPlaceID` varchar(50) DEFAULT NULL,
  `amazonMerchantID` varchar(50) DEFAULT NULL,
  `quickBookFilePath` varchar(200) DEFAULT NULL,
  `orderImportTemplate` varchar(255) DEFAULT NULL,
  `Active` int DEFAULT '1',
  `Deleted` int DEFAULT '1',
  `smcLoginID` varchar(50) DEFAULT NULL,
  `smcPassword` varchar(50) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `IsDefault` int DEFAULT '0',
  `currentStore` int DEFAULT '0',
  `isMultipleAccountSelected` int DEFAULT '0',
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `eBaypaymentStatusID1` int DEFAULT '0',
  `eBaypaymentStatusID2` int DEFAULT '0',
  `eBaychangeInvoiced` varchar(50) DEFAULT NULL,
  `eBayuseDateRange` int DEFAULT '0',
  `eBaydateBasedOn` varchar(50) DEFAULT NULL,
  `eBaychangePaymentStatusID` int DEFAULT '0',
  `eBayruleInvoiced` varchar(50) DEFAULT NULL,
  `ImportHistory` longtext,
  `isSelected` tinyint(1) DEFAULT '0',
  `defaultCategoryID` int DEFAULT NULL,
  `NickName` varchar(255) DEFAULT NULL,
  `dbURL` varchar(255) DEFAULT NULL,
  `magentoLoginID` varchar(255) DEFAULT NULL,
  `magentoPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StoreID`),
  KEY `StoreTypeID` (`StoreTypeID`),
  KEY `amazonAccesKey` (`amazonAccesKey`),
  KEY `amazonMarketPlaceID` (`amazonMarketPlaceID`),
  KEY `amazonMerchantID` (`amazonMerchantID`),
  KEY `amazonSecretKey` (`amazonSecretKey`),
  KEY `eBaychangePaymentStatusID` (`eBaychangePaymentStatusID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `defaultCategoryID` (`defaultCategoryID`),
  KEY `eBayApplicationID` (`eBayApplicationID`),
  KEY `eBayDeveloperID` (`eBayDeveloperID`),
  KEY `smcLoginID` (`smcLoginID`),
  KEY `StoreID` (`StoreID`),
  KEY `Zipcode` (`Zipcode`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_storetype`
--

DROP TABLE IF EXISTS `bca_storetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_storetype` (
  `StoreTypeID` int DEFAULT '0',
  `StoreTypeName` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(255) DEFAULT '0',
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT '0',
  `Address2` varchar(255) DEFAULT '0',
  `City` varchar(255) DEFAULT '0',
  `State` varchar(50) DEFAULT '0',
  `Province` varchar(50) DEFAULT '0',
  `Country` varchar(50) DEFAULT '0',
  `Zipcode` varchar(50) DEFAULT '0',
  `Email` varchar(50) DEFAULT '0',
  `PackingReturnPolicy` longtext,
  `DefaultStoreID` int DEFAULT '0',
  `UseDefaultAddress` tinyint(1) DEFAULT NULL,
  `LogoPath` varchar(255) DEFAULT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isProductSubmission` int DEFAULT NULL,
  KEY `DefaultStoreID` (`DefaultStoreID`),
  KEY `StoreTypeID` (`StoreTypeID`),
  KEY `Zipcode` (`Zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_template_config`
--

DROP TABLE IF EXISTS `bca_template_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_template_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baseTemplateId` int DEFAULT NULL,
  `templateId` int DEFAULT NULL,
  `companyID` int DEFAULT NULL,
  `templateName` varchar(255) DEFAULT NULL,
  `templateTypeId` int DEFAULT NULL,
  `templateStyleTypeId` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `templateCatagory` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `baseTemplateId` (`baseTemplateId`),
  KEY `companyID` (`companyID`),
  KEY `id` (`id`),
  KEY `templateId` (`templateId`),
  KEY `templateStyleTypeId` (`templateStyleTypeId`),
  KEY `templateTypeId` (`templateTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_term`
--

DROP TABLE IF EXISTS `bca_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_term` (
  `TermID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  `Days` int DEFAULT '0',
  UNIQUE KEY `TermID` (`TermID`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_title`
--

DROP TABLE IF EXISTS `bca_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_title` (
  `TitleID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`TitleID`),
  KEY `TitleID` (`TitleID`)
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_unitofmeasure`
--

DROP TABLE IF EXISTS `bca_unitofmeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_unitofmeasure` (
  `UnitCategoryID` int NOT NULL AUTO_INCREMENT,
  `ParentId` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `UseName` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  KEY `UnitCategoryID` (`UnitCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1273 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_user`
--

DROP TABLE IF EXISTS `bca_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LoginID` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Confirm_Password` varchar(255) DEFAULT NULL,
  `Email_Address` varchar(255) DEFAULT NULL,
  `Company_Name` varchar(255) DEFAULT NULL,
  `Legal_Name` varchar(255) DEFAULT NULL,
  `TaxID` varchar(255) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `Firstname` varchar(255) DEFAULT NULL,
  `Lastname` varchar(255) DEFAULT NULL,
  `PasswordHint` varchar(255) DEFAULT NULL,
  `PasswordAns` varchar(255) DEFAULT NULL,
  `WebAddress` varchar(255) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT '1',
  `CompanyID` int DEFAULT '0',
  `membershipLevel` varchar(45) DEFAULT NULL,
  `jobPosition` varchar(45) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `DateExpiry` datetime DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `LoginID` (`LoginID`),
  KEY `TaxID` (`TaxID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_useractivity`
--

DROP TABLE IF EXISTS `bca_useractivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_useractivity` (
  `UserActivityID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT '0',
  `dateAdded` datetime DEFAULT NULL,
  `InTime` varchar(50) DEFAULT NULL,
  `OutTime` varchar(50) DEFAULT NULL,
  `Module` varchar(100) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `DataID` int DEFAULT '0',
  `DataDescription` longtext,
  `DataAmount` double DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `StoreID` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `DataID` (`DataID`),
  KEY `StoreID` (`StoreID`),
  KEY `UserActivityID` (`UserActivityID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=17462 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_userdefineshipcarrier`
--

DROP TABLE IF EXISTS `bca_userdefineshipcarrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_userdefineshipcarrier` (
  `ShipCarrierID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `Active` int DEFAULT '0',
  `ParentID` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `ParentID` (`ParentID`),
  KEY `ShipCarrierID` (`ShipCarrierID`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_usergroup`
--

DROP TABLE IF EXISTS `bca_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_usergroup` (
  `UserGroupName` varchar(50) DEFAULT NULL,
  `GroupID` int NOT NULL AUTO_INCREMENT,
  `Level` int DEFAULT '0',
  `Description` varchar(50) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `AccessPermissions` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`GroupID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_usermapping`
--

DROP TABLE IF EXISTS `bca_usermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_usermapping` (
  `MappingID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `UserGroupID` int DEFAULT '0',
  `UserID` int DEFAULT '0',
  `Role` varchar(50) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MappingID`),
  UNIQUE KEY `MappingID` (`MappingID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `UserGroupID` (`UserGroupID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_usermodules`
--

DROP TABLE IF EXISTS `bca_usermodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_usermodules` (
  `ModuleID` int NOT NULL AUTO_INCREMENT,
  `ModuleName` varchar(50) DEFAULT NULL,
  `ParentID` int DEFAULT '0',
  PRIMARY KEY (`ModuleID`),
  UNIQUE KEY `ModuleID` (`ModuleID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bca_vendorcategory`
--

DROP TABLE IF EXISTS `bca_vendorcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bca_vendorcategory` (
  `CVCategoryID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `Active` int DEFAULT '1',
  KEY `CVCategoryID` (`CVCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_deductionlist`
--

DROP TABLE IF EXISTS `bcp_deductionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_deductionlist` (
  `DeductionListID` int NOT NULL AUTO_INCREMENT,
  `DeductionList` varchar(50) DEFAULT NULL,
  `DeductionAmount` int DEFAULT '0',
  `DeductionRate` int DEFAULT '0',
  `UseRate` tinyint(1) DEFAULT NULL,
  `IsTaxExempt` tinyint(1) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DeductionListID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `DeductionListID` (`DeductionListID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_employee`
--

DROP TABLE IF EXISTS `bcp_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_employee` (
  `EmployeeIndexID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `NickName` varchar(50) DEFAULT NULL,
  `SSN` varchar(50) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `CellPhone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  `EmployeeTitleID` int DEFAULT NULL,
  `JobTitleID` int DEFAULT NULL,
  `EmployeeTypeID` int DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `PayrollPeriodID` int DEFAULT NULL,
  `FilingStatusID` int DEFAULT NULL,
  `Allowance` int DEFAULT NULL,
  `TaxState` varchar(50) DEFAULT NULL,
  `DateofBirth` datetime DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `DateStarted` datetime DEFAULT NULL,
  `DateTerminated` datetime DEFAULT NULL,
  `Detail` longtext,
  `Status` varchar(5) DEFAULT NULL,
  `Active` int DEFAULT NULL,
  `Hourly` tinyint(1) DEFAULT NULL,
  `Daily` tinyint(1) DEFAULT NULL,
  `Salary` tinyint(1) DEFAULT NULL,
  `UseJobCode` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `EmployeeIndexID` (`EmployeeIndexID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `EmployeeTitleID` (`EmployeeTitleID`),
  KEY `EmployeeTypeID` (`EmployeeTypeID`),
  KEY `FilingStatusID` (`FilingStatusID`),
  KEY `JobTitleID` (`JobTitleID`),
  KEY `PayrollPeriodID` (`PayrollPeriodID`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_employeetype`
--

DROP TABLE IF EXISTS `bcp_employeetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_employeetype` (
  `EmployeeTypeID` int NOT NULL AUTO_INCREMENT,
  `EmployeeType` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`EmployeeTypeID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_fedperallowance`
--

DROP TABLE IF EXISTS `bcp_fedperallowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_fedperallowance` (
  `ID` int NOT NULL DEFAULT '0',
  `NumTerm` int DEFAULT '0',
  `OneAllow` float DEFAULT '0',
  `EYear` int DEFAULT '0',
  `PayrollPeriod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `NumTerm` (`NumTerm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_fedpermethod`
--

DROP TABLE IF EXISTS `bcp_fedpermethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_fedpermethod` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IsMarried` double DEFAULT NULL,
  `NumTerm` double DEFAULT NULL,
  `AmtCov1` double DEFAULT NULL,
  `AmtCov2` double DEFAULT NULL,
  `RateTax` double DEFAULT NULL,
  `PlusTax` double DEFAULT NULL,
  `EYear` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumTerm` (`NumTerm`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_fedrate`
--

DROP TABLE IF EXISTS `bcp_fedrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_fedrate` (
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `RateSS` float DEFAULT NULL,
  `RateMed` float DEFAULT NULL,
  `LimitSS` float DEFAULT NULL,
  `RateFuta` float DEFAULT '0',
  `LimitFuta` float DEFAULT '0',
  `MaxCrRate` float DEFAULT '0',
  `EYear` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Kundan
-- Table structure for table `bcp_filingstate`
--

DROP TABLE IF EXISTS `bcp_filingstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_filingstate` (
  `FilingStateID` int NOT NULL AUTO_INCREMENT,
  `FilingState` varchar(50) DEFAULT NULL,
  `FilingStateTaxID` varchar(50) DEFAULT NULL,
  `UseSIT` tinyint(1) DEFAULT NULL,
  `SITTaxYear` int DEFAULT '0',
  `SITRate` double DEFAULT '0',
  `UseOtherStateTaxName1` tinyint(1) DEFAULT NULL,
  `OtherStateTaxName1` varchar(50) DEFAULT NULL,
  `OtherStateTaxRate1` decimal(19,4) DEFAULT '0.0000',
  `OtherStateTaxLimit1` decimal(19,4) DEFAULT '0.0000',
  `UseOtherStateTaxName2` tinyint(1) DEFAULT NULL,
  `OtherStateTaxName2` varchar(50) DEFAULT NULL,
  `OtherStateTaxLimit2` decimal(19,4) DEFAULT '0.0000',
  `OtherStateTaxRate2` decimal(19,4) DEFAULT '0.0000',
  `UseOtherStateTaxName3` tinyint(1) DEFAULT NULL,
  `OtherStateTaxName3` varchar(50) DEFAULT NULL,
  `OtherStateTaxLimit3` decimal(19,4) DEFAULT '0.0000',
  `OtherStateTaxRate3` decimal(19,4) DEFAULT '0.0000',
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  `SetAsDefault` tinyint(1) DEFAULT NULL,
  KEY `CompanyID` (`CompanyID`),
  KEY `FilingStateID` (`FilingStateID`),
  KEY `FilingStateTaxID` (`FilingStateTaxID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_filingstatus`
--

DROP TABLE IF EXISTS `bcp_filingstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_filingstatus` (
  `FilingStatusID` int NOT NULL DEFAULT '0',
  `FilingStatus` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`FilingStatusID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `FilingStatusID` (`FilingStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_income`
--

DROP TABLE IF EXISTS `bcp_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_income` (
  `IncomeID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int DEFAULT '0',
  `IncomeAmount` decimal(19,4) DEFAULT '0.0000',
  `EmployeeTypeID` int DEFAULT '0',
  `PayrollPeriodID` int DEFAULT '0',
  `IncomeListID` int DEFAULT '0',
  `DeductionID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '0',
  PRIMARY KEY (`IncomeID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `DeductionID` (`DeductionID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `EmployeeTypeID` (`EmployeeTypeID`),
  KEY `IncomeID` (`IncomeID`),
  KEY `IncomeListID` (`IncomeListID`),
  KEY `PayrollPeriodID` (`PayrollPeriodID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_incomelist`
--

DROP TABLE IF EXISTS `bcp_incomelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_incomelist` (
  `IncomeListID` int NOT NULL AUTO_INCREMENT,
  `IncomeList` varchar(128) NOT NULL,
  `Company` int NOT NULL DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`IncomeListID`),
  KEY `IncomeList` (`IncomeList`),
  KEY `IncomeListID` (`IncomeListID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_jobcode`
--

DROP TABLE IF EXISTS `bcp_jobcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_jobcode` (
  `JobID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Cost` decimal(19,4) DEFAULT '0.0000',
  `Description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`JobID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `JobID` (`JobID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_jobtitle`
--

DROP TABLE IF EXISTS `bcp_jobtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_jobtitle` (
  `JobTitleID` int NOT NULL AUTO_INCREMENT,
  `JobTitle` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`JobTitleID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `JobTitleID` (`JobTitleID`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_payroll`
--

DROP TABLE IF EXISTS `bcp_payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_payroll` (
  `PayrollDate` datetime NOT NULL,
  `EmployeeID` int NOT NULL DEFAULT '0',
  `WorkFrom` datetime DEFAULT NULL,
  `WorkTo` datetime DEFAULT NULL,
  `NetAmount` decimal(19,4) DEFAULT '0.0000',
  `GrossAmount` decimal(19,4) DEFAULT '0.0000',
  `FT_SST` decimal(19,4) DEFAULT '0.0000',
  `FT_Medicare` decimal(19,4) DEFAULT '0.0000',
  `FT_FIT` decimal(19,4) DEFAULT '0.0000',
  `StateFiled` varchar(2) DEFAULT NULL,
  `ST_SIT` decimal(19,4) DEFAULT '0.0000',
  `ST_Other1` decimal(19,4) DEFAULT '0.0000',
  `ST_Other2` decimal(19,4) DEFAULT '0.0000',
  `CompanyTaxAmount` decimal(19,4) DEFAULT '0.0000',
  `CompanyTaxDetail` longtext,
  `CheckPrinted` tinyint(1) DEFAULT NULL,
  `CheckPrintedDate` datetime DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  PRIMARY KEY (`PayrollDate`,`EmployeeID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_payrollperiod`
--

DROP TABLE IF EXISTS `bcp_payrollperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_payrollperiod` (
  `PayrollPeriodID` int NOT NULL DEFAULT '0',
  `PayrollPeriod` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`PayrollPeriodID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_stestdedtable`
--

DROP TABLE IF EXISTS `bcp_stestdedtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_stestdedtable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NumTerm` int DEFAULT NULL,
  `NumAllow` double DEFAULT NULL,
  `Amt` double DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `EYear` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumAllow` (`NumAllow`),
  KEY `NumTerm` (`NumTerm`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_stexempdedtable`
--

DROP TABLE IF EXISTS `bcp_stexempdedtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_stexempdedtable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NumTerm` int DEFAULT NULL,
  `NumAllow` double DEFAULT NULL,
  `Amt` double DEFAULT NULL,
  `StateName` varchar(255) DEFAULT NULL,
  `EYear` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumAllow` (`NumAllow`),
  KEY `NumTerm` (`NumTerm`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_stlowincomeexemptable`
--

DROP TABLE IF EXISTS `bcp_stlowincomeexemptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_stlowincomeexemptable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NumTerm` double DEFAULT NULL,
  `IsMarried` double DEFAULT NULL,
  `Amt` double DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `EYear` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumTerm` (`NumTerm`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_ststandarddedtable`
--

DROP TABLE IF EXISTS `bcp_ststandarddedtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_ststandarddedtable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NumTerm` double DEFAULT NULL,
  `IsMarried` double DEFAULT NULL,
  `Amt` double DEFAULT NULL,
  `StateName` varchar(50) DEFAULT NULL,
  `EYear` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumTerm` (`NumTerm`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_sttaxagency`
--

DROP TABLE IF EXISTS `bcp_sttaxagency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_sttaxagency` (
  `StateName` varchar(50) DEFAULT NULL,
  `Address` longtext,
  `WebSite` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_sttaxrate`
--

DROP TABLE IF EXISTS `bcp_sttaxrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_sttaxrate` (
  `ID` int NOT NULL DEFAULT '0',
  `RateSdi` float DEFAULT NULL,
  `LimitSdi` float DEFAULT '0',
  `OtherName` varchar(50) DEFAULT NULL,
  `OtherRate` float DEFAULT '0',
  `RateSui` float DEFAULT '0',
  `OverRate` float DEFAULT '0',
  `StateName` varchar(50) DEFAULT NULL,
  `EYear` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_stwithholding`
--

DROP TABLE IF EXISTS `bcp_stwithholding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_stwithholding` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IsMarried` double DEFAULT NULL,
  `NumTerm` double DEFAULT NULL,
  `AmtCov1` double DEFAULT NULL,
  `AmtCov2` double DEFAULT NULL,
  `RateTax` double DEFAULT NULL,
  `PlusTax` double DEFAULT NULL,
  `StateName` varchar(255) DEFAULT NULL,
  `EYear` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumTerm` (`NumTerm`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_tax_company`
--

DROP TABLE IF EXISTS `bcp_tax_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_tax_company` (
  `CompanyID` int NOT NULL DEFAULT '0',
  `DeductionID` int DEFAULT '0',
  `Daily` tinyint(1) DEFAULT NULL,
  `Weekly` tinyint(1) DEFAULT NULL,
  `BiWeekly` tinyint(1) DEFAULT NULL,
  `SemiMonthly` tinyint(1) DEFAULT NULL,
  `Monthly` tinyint(1) DEFAULT NULL,
  `Quarterly` tinyint(1) DEFAULT NULL,
  `SemiAnnually` tinyint(1) DEFAULT NULL,
  `Annually` tinyint(1) DEFAULT NULL,
  `UsePayrollDayWeek` tinyint(1) DEFAULT NULL,
  `PayrollDayWeek` int DEFAULT '0',
  `UsePayrollDayMonth` tinyint(1) DEFAULT NULL,
  `PayrollDayMonth` int DEFAULT '0',
  `UseOvertimeDailyHour` tinyint(1) DEFAULT NULL,
  `OvertimeDailyHour` int DEFAULT '0',
  `UseOvertimeWeeklyHour` tinyint(1) DEFAULT NULL,
  `OvertimeWeeklyHour` int DEFAULT '0',
  `OvertimeRate` int DEFAULT '0',
  `UseSaturdayRate` tinyint(1) DEFAULT NULL,
  `SaturdayRate` int DEFAULT '0',
  `UseSundayRate` tinyint(1) DEFAULT NULL,
  `SundayRate` int DEFAULT '0',
  `UseHolidayRate` tinyint(1) DEFAULT NULL,
  `HolidayRate` int DEFAULT '0',
  `StartingDate` datetime DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Active` int DEFAULT '0',
  PRIMARY KEY (`CompanyID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `DeductionID` (`DeductionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_tax_fica_sdi`
--

DROP TABLE IF EXISTS `bcp_tax_fica_sdi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_tax_fica_sdi` (
  `CompanyID` int NOT NULL DEFAULT '0',
  `FID` varchar(50) DEFAULT NULL,
  `FiscalMonth` varchar(50) DEFAULT NULL,
  `UseFICA` tinyint(1) DEFAULT NULL,
  `FICARate` double DEFAULT '0',
  `UseSocialTax` tinyint(1) DEFAULT NULL,
  `SocialTaxRate` decimal(19,4) DEFAULT '0.0000',
  `SocialTaxLimit` decimal(19,4) DEFAULT '0.0000',
  `UseMedicareTax` tinyint(1) DEFAULT NULL,
  `MedicareTaxRate` decimal(19,4) DEFAULT '0.0000',
  `UseFIT` tinyint(1) DEFAULT NULL,
  `FITYear` int DEFAULT '0',
  `FITRate` double DEFAULT '0',
  `DateAdded` datetime DEFAULT NULL,
  `Active` int DEFAULT '0',
  `FUTARate` double DEFAULT '0',
  `selectedFIT` tinyint(1) DEFAULT '0',
  `auto` tinyint(1) DEFAULT '0',
  `autoFIT` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`CompanyID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `FID` (`FID`),
  KEY `FITYear` (`FITYear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bcp_timesheet_time`
--

DROP TABLE IF EXISTS `bcp_timesheet_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bcp_timesheet_time` (
  `EmployeeID` int NOT NULL DEFAULT '0',
  `Day` datetime NOT NULL,
  `TimeOut` datetime DEFAULT NULL,
  `TimeIn` datetime DEFAULT NULL,
  `JobID` int DEFAULT '0',
  `JobLocation` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `Payrolled` tinyint(1) DEFAULT NULL,
  KEY `CompanyID` (`CompanyID`),
  KEY `Day` (`Day`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `JobID` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bizcal_appoint`
--

DROP TABLE IF EXISTS `bizcal_appoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bizcal_appoint` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `m_alarm` int DEFAULT '0',
  `m_color_rgb` int DEFAULT '0',
  `m_length` int DEFAULT '0',
  `m_text` varchar(100) DEFAULT NULL,
  `m_date` datetime DEFAULT NULL,
  `m_w` int DEFAULT '0',
  `m_h` int DEFAULT '0',
  `m_x` int DEFAULT '0',
  `m_y` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bizcal_reminder`
--

DROP TABLE IF EXISTS `bizcal_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bizcal_reminder` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BillingType` varchar(100) DEFAULT NULL,
  `PaymentDueDay` int DEFAULT '0',
  `IsNotify` tinyint(1) DEFAULT NULL,
  `NotifyDays` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_sales`
--

DROP TABLE IF EXISTS `bt_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bt_sales` (
  `SaleID` int NOT NULL,
  `ConsignmentSale` tinyint(1) DEFAULT NULL,
  `BuyerID` int DEFAULT NULL,
  `SalePrice` double DEFAULT NULL,
  `QtySold` int DEFAULT NULL,
  `SalesTax` double DEFAULT NULL,
  `SourceOfSale` varchar(20) DEFAULT NULL,
  `TypeOfPayment` varchar(25) DEFAULT NULL,
  `ShippingCost` double DEFAULT NULL,
  `InsuranceCost` double DEFAULT NULL,
  `CommissionIn` double DEFAULT NULL,
  `ListingFee` double DEFAULT NULL,
  `DateOfSale` datetime DEFAULT NULL,
  `FeedbackLeft` tinyint(1) DEFAULT NULL,
  `Invoiced` tinyint(1) DEFAULT NULL,
  `DatePaymentReceived` datetime DEFAULT NULL,
  `DatePaymentCleared` datetime DEFAULT NULL,
  `DateItemShipped` datetime DEFAULT NULL,
  `DateSaleClosed` datetime DEFAULT NULL,
  `ShippingCharged` double DEFAULT NULL,
  `TrackingNum` varchar(255) DEFAULT NULL,
  `DatePaymentRequestSent` datetime DEFAULT NULL,
  `DateSecondPaymentRequestSent` datetime DEFAULT NULL,
  `DateFinalPaymentRequestSent` datetime DEFAULT NULL,
  `DateFVFRequested` datetime DEFAULT NULL,
  `StatusID` int DEFAULT NULL,
  `DateFinalNotificationSent` datetime DEFAULT NULL,
  `DateItemClosed` datetime DEFAULT NULL,
  `TransactionID` varchar(15) DEFAULT NULL,
  `FeedbackReceived` int DEFAULT NULL,
  `OrderID` varchar(25) DEFAULT NULL,
  `ItemCost` double DEFAULT NULL,
  `HandlingFee` double DEFAULT NULL,
  `AdjustmentCost` double DEFAULT NULL,
  `AdjustmentCostReason` varchar(30) DEFAULT NULL,
  `AdjustmentFee` double DEFAULT NULL,
  `AdjustmentReason` varchar(30) DEFAULT NULL,
  `BillingAddressID` int DEFAULT NULL,
  `BuyerSelectedShipping` tinyint(1) DEFAULT NULL,
  `CCID` int DEFAULT NULL,
  `ConsignModelID` int DEFAULT NULL,
  `ConsignorID` int DEFAULT NULL,
  `ConsignorPaid` tinyint(1) DEFAULT NULL,
  `Custom1` varchar(255) DEFAULT NULL,
  `Custom2` varchar(255) DEFAULT NULL,
  `DateLastModified` datetime DEFAULT NULL,
  `DateStatusChanged` datetime DEFAULT NULL,
  `DisputeID` varchar(25) DEFAULT NULL,
  `eBayID` varchar(30) DEFAULT NULL,
  `EmailTemplateID` int DEFAULT NULL,
  `FVF` double DEFAULT NULL,
  `InsuranceWanted` tinyint(1) DEFAULT NULL,
  `IsArchive` tinyint(1) DEFAULT NULL,
  `ListingID` int DEFAULT NULL,
  `ListingType` int DEFAULT NULL,
  `Notes` longtext,
  `OrgTemplateID` int DEFAULT NULL,
  `PayPalFees` double DEFAULT NULL,
  `ShippingAddressID` int DEFAULT NULL,
  `ShippingCo` varchar(255) DEFAULT NULL,
  `SiteID` int DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `DBToken` varchar(32) DEFAULT NULL,
  `NotUpdate` tinyint(1) DEFAULT NULL,
  `InventoryID` int DEFAULT NULL,
  `InsuranceValue` double DEFAULT NULL,
  `CheckOutCompleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `BillingAddressID` (`BillingAddressID`),
  KEY `BuyerID` (`BuyerID`),
  KEY `CCID` (`CCID`),
  KEY `ConsignModelID` (`ConsignModelID`),
  KEY `ConsignorID` (`ConsignorID`),
  KEY `DateLastModified` (`DateLastModified`),
  KEY `DBToken` (`DBToken`),
  KEY `DisputeID` (`DisputeID`),
  KEY `eBayID` (`eBayID`),
  KEY `EmailTemplateID` (`EmailTemplateID`),
  KEY `InventoryID` (`InventoryID`),
  KEY `IsArchive` (`IsArchive`),
  KEY `ListingID` (`ListingID`),
  KEY `OrderID` (`OrderID`),
  KEY `OrgTemplateID` (`OrgTemplateID`),
  KEY `ShippingAddressID` (`ShippingAddressID`),
  KEY `SiteID` (`SiteID`),
  KEY `StatusID` (`StatusID`),
  KEY `TrackingNum` (`TrackingNum`),
  KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city_state_zip`
--

DROP TABLE IF EXISTS `city_state_zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_state_zip` (
  `ZIP_CODE` int DEFAULT NULL,
  `CITY_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE_CODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `CountryID` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CountryID`),
  KEY `CountryCode` (`CountryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `CountryID` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crm_lead`
--

DROP TABLE IF EXISTS `crm_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_lead` (
  `LeadID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Source` varchar(10) DEFAULT NULL,
  `AssignedId` int DEFAULT NULL,
  `Tags` varchar(1000) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address1` varchar(75) DEFAULT NULL,
  `Address2` varchar(75) DEFAULT NULL,
  `Phone` varchar(75) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `WebSite` varchar(255) DEFAULT NULL,
  `LeadValue` int DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `isPublic` tinyint(1) DEFAULT '1',
  `isContactToday` tinyint(1) DEFAULT '1',
  `contactDate` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`LeadID`),
  UNIQUE KEY `LeadID` (`LeadID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fedexshipinvoice`
--

DROP TABLE IF EXISTS `fedexshipinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fedexshipinvoice` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderNumber` int DEFAULT '0',
  `Attantion` varchar(50) DEFAULT NULL,
  `MailClass` varchar(50) DEFAULT NULL,
  `TrackingNumber` varchar(50) DEFAULT NULL,
  `Lenght` varchar(50) DEFAULT NULL,
  `Width` varchar(50) DEFAULT NULL,
  `Height` varchar(50) DEFAULT NULL,
  `Weight` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `galaxyshipinvoice`
--

DROP TABLE IF EXISTS `galaxyshipinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galaxyshipinvoice` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderNumber` int DEFAULT '0',
  `MailClass` varchar(50) DEFAULT NULL,
  `TrackingType` varchar(50) DEFAULT NULL,
  `GroupCode` varchar(50) DEFAULT NULL,
  `Value` int DEFAULT '0',
  `Description` varchar(50) DEFAULT NULL,
  `Lenght` varchar(50) DEFAULT NULL,
  `Width` varchar(50) DEFAULT NULL,
  `Height` varchar(50) DEFAULT NULL,
  `Weight` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GroupCode` (`GroupCode`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `galaxyshippostback`
--

DROP TABLE IF EXISTS `galaxyshippostback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galaxyshippostback` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderNumber` int DEFAULT '0',
  `MailClass` varchar(50) DEFAULT NULL,
  `PostageAmount` int DEFAULT '0',
  `TrackingNumber` int DEFAULT '0',
  `PostMarkDate` varchar(50) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `GroupCode` varchar(50) DEFAULT NULL,
  `InsuredValue` varchar(50) DEFAULT NULL,
  `InsuranceFee` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `FillXMLSource` varchar(50) DEFAULT NULL,
  `Lenght` varchar(50) DEFAULT NULL,
  `Width` varchar(50) DEFAULT NULL,
  `Height` varchar(50) DEFAULT NULL,
  `Weight` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GroupCode` (`GroupCode`),
  KEY `TransactionID` (`TransactionID`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_category_details`
--

DROP TABLE IF EXISTS `item_category_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_category_details` (
  `CategoryID` bigint NOT NULL AUTO_INCREMENT,
  `ParentID` varchar(45) NOT NULL,
  `CompanyID` int NOT NULL DEFAULT '0',
  `CategoryName` varchar(45) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT '1',
  `Deleted` tinyint(1) DEFAULT '0',
  `DateAdded` datetime NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryName_UNIQUE` (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_details`
--

DROP TABLE IF EXISTS `item_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_details` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `CategoryID` bigint NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT '1',
  `Deleted` tinyint(1) DEFAULT '0',
  `DateAdded` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smc_orders`
--

DROP TABLE IF EXISTS `smc_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smc_orders` (
  `OrderID` varchar(50) NOT NULL,
  `PayPal_txn_id` varchar(50) DEFAULT NULL,
  `CompanyID` int DEFAULT '0',
  `CustomerID` int DEFAULT '0',
  `ShippingEmail` varchar(50) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Discount` double DEFAULT '0',
  `Total` double DEFAULT '0',
  `Tax` double DEFAULT '0',
  `ShippingFee` double DEFAULT '0',
  `ShippingName` varchar(50) DEFAULT NULL,
  `ShippingMethod` varchar(50) DEFAULT NULL,
  `Receiver` varchar(50) DEFAULT NULL,
  `ShippingAddr` varchar(100) DEFAULT NULL,
  `ShippingCity` varchar(50) DEFAULT NULL,
  `ShippingState` varchar(50) DEFAULT NULL,
  `ShippingZip` varchar(50) DEFAULT NULL,
  `ShippingCountry` varchar(50) DEFAULT NULL,
  `ShippingPhone` varchar(50) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `CardName` varchar(50) DEFAULT NULL,
  `CardNo` varchar(50) DEFAULT NULL,
  `CardExpire` varchar(50) DEFAULT NULL,
  `CardHolder` varchar(50) DEFAULT NULL,
  `CVV2` varchar(50) DEFAULT NULL,
  `BillingAddr` varchar(100) DEFAULT NULL,
  `BillingCity` varchar(50) DEFAULT NULL,
  `BillingState` varchar(50) DEFAULT NULL,
  `BillingZip` varchar(50) DEFAULT NULL,
  `BillingCountry` varchar(50) DEFAULT NULL,
  `BillingPhone` varchar(50) DEFAULT NULL,
  `BillingEmail` varchar(50) DEFAULT NULL,
  `SMCNote` longtext,
  `isChecked` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `DealerID` int DEFAULT '0',
  PRIMARY KEY (`OrderID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `DealerID` (`DealerID`),
  KEY `OrderID` (`OrderID`),
  KEY `PayPal_txn_id` (`PayPal_txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_admin`
--

DROP TABLE IF EXISTS `smd_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_admin` (
  `AdminID` varchar(40) NOT NULL DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `Password` varchar(20) DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Authority` varchar(7) DEFAULT '0',
  `Input_Date` datetime DEFAULT NULL,
  `webSite` varchar(10) DEFAULT '0',
  `SiteType` int DEFAULT '1',
  `MshopMerchantID` int DEFAULT NULL,
  `siteinventory` int DEFAULT '0',
  PRIMARY KEY (`AdminID`),
  KEY `AdminID` (`AdminID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `MshopMerchantID` (`MshopMerchantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_bsaddress`
--

DROP TABLE IF EXISTS `smd_bsaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_bsaddress` (
  `BsaID` int NOT NULL AUTO_INCREMENT,
  `InvoiceID` varchar(12) DEFAULT NULL,
  `Receiver` varchar(30) DEFAULT NULL,
  `ShippingAddrType` varchar(15) DEFAULT NULL,
  `ShippingCompanyName` varchar(80) DEFAULT NULL,
  `ShippingAddr` varchar(100) DEFAULT NULL,
  `ShippingAddr2` varchar(100) DEFAULT NULL,
  `ShippingCity` varchar(50) DEFAULT NULL,
  `ShippingState` varchar(50) DEFAULT NULL,
  `ShippingZip` varchar(20) DEFAULT NULL,
  `ShippingCountry` varchar(40) DEFAULT NULL,
  `ShippingPhone` varchar(20) DEFAULT NULL,
  `ShippingEmail` varchar(30) DEFAULT NULL,
  `BillingAddressType` varchar(15) DEFAULT NULL,
  `BillingCompanyName` varchar(80) DEFAULT NULL,
  `BillingAddr` varchar(100) DEFAULT NULL,
  `BillingAddr2` varchar(100) DEFAULT NULL,
  `BillingCity` varchar(50) DEFAULT NULL,
  `BillingState` varchar(50) DEFAULT NULL,
  `BillingZip` varchar(20) DEFAULT NULL,
  `BillingCountry` varchar(40) DEFAULT NULL,
  `BillingPhone` varchar(20) DEFAULT NULL,
  `BillingEmail` varchar(30) DEFAULT NULL,
  `IsSame` varchar(1) DEFAULT '0',
  PRIMARY KEY (`BsaID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_category`
--

DROP TABLE IF EXISTS `smd_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_category` (
  `eBayCategoryID` int DEFAULT NULL,
  `smdcategoryName` varchar(255) DEFAULT NULL,
  `smdCategoryID` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `isDefault` int DEFAULT NULL,
  KEY `smdCategoryID` (`smdCategoryID`),
  KEY `StoreID` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_cvinfo`
--

DROP TABLE IF EXISTS `smd_cvinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_cvinfo` (
  `ClientVendorID` int DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `PasswordHint` varchar(16) DEFAULT NULL,
  `PasswordAnswer` varchar(16) DEFAULT NULL,
  `Newsletter` varchar(1) DEFAULT NULL,
  `Subscribe` varchar(10) DEFAULT NULL,
  `IsChecked` varchar(1) DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  `HomePage` varchar(50) DEFAULT NULL,
  `ResellerTaxID` varchar(30) DEFAULT NULL,
  `Taxable` varchar(5) DEFAULT NULL,
  `FID` varchar(20) DEFAULT NULL,
  `CustomerGroupID` int DEFAULT '1',
  `BillingAddressID` int DEFAULT '0',
  `ShippingAddressID` int DEFAULT '0',
  `AllowMultipleAddress` varchar(1) DEFAULT '0',
  `WWW` varchar(50) DEFAULT NULL,
  `SourceInfo` int DEFAULT '0',
  `BusinessType` varchar(50) DEFAULT NULL,
  `userPhoto` varchar(50) DEFAULT '0',
  `isPhotoPrivate` int DEFAULT '0',
  KEY `BillingAddressID` (`BillingAddressID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CustomerGroupID` (`CustomerGroupID`),
  KEY `FID` (`FID`),
  KEY `ResellerTaxID` (`ResellerTaxID`),
  KEY `ShippingAddressID` (`ShippingAddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_ebaycategory`
--

DROP TABLE IF EXISTS `smd_ebaycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_ebaycategory` (
  `eBayCategoryID` int DEFAULT NULL,
  `smdcategoryName` varchar(255) DEFAULT NULL,
  `smdCategoryID` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `isleaf` int DEFAULT NULL,
  KEY `eBayCategoryID` (`eBayCategoryID`),
  KEY `smdCategoryID` (`smdCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_gatewaydetails`
--

DROP TABLE IF EXISTS `smd_gatewaydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_gatewaydetails` (
  `GatewayID` int NOT NULL AUTO_INCREMENT,
  `CompanyID` int DEFAULT '0',
  `GatewayType` varchar(50) DEFAULT NULL,
  `Field1` varchar(50) DEFAULT NULL,
  `Field2` varchar(150) DEFAULT NULL,
  `Field3` varchar(50) DEFAULT NULL,
  `Field4` varchar(75) DEFAULT NULL,
  `Field5` varchar(50) DEFAULT NULL,
  `Field6` varchar(50) DEFAULT NULL,
  `Field7` varchar(50) DEFAULT NULL,
  `Field8` varchar(50) DEFAULT NULL,
  `Field9` varchar(50) DEFAULT NULL,
  `Field10` varchar(50) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `TestEnv` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`GatewayID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `GatewayID` (`GatewayID`)
) ENGINE=InnoDB AUTO_INCREMENT=2114 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_giftcertificate`
--

DROP TABLE IF EXISTS `smd_giftcertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_giftcertificate` (
  `gcID` varchar(10) NOT NULL,
  `CompanyID` int DEFAULT NULL,
  `gcName` varchar(50) DEFAULT NULL,
  `gcDetails` longtext,
  `gcPrice` double DEFAULT NULL,
  `gcRedeemValue` double DEFAULT NULL,
  `gcUseDays` int DEFAULT NULL,
  `gcIsDeleted` int DEFAULT NULL,
  `gcImage` varchar(150) DEFAULT NULL,
  `gcNote` longtext,
  PRIMARY KEY (`gcID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_giftcertificateused`
--

DROP TABLE IF EXISTS `smd_giftcertificateused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_giftcertificateused` (
  `gcuID` varchar(20) DEFAULT NULL,
  `gcID` varchar(10) DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  `InvoiceID` int DEFAULT NULL,
  `gcuIsMailed` int DEFAULT NULL,
  `gcuAddDate` datetime DEFAULT NULL,
  `gcuUseDate` datetime DEFAULT NULL,
  `gcuBalence` decimal(18,0) DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `gcID` (`gcID`),
  KEY `InvoiceID` (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_itemgroupprice`
--

DROP TABLE IF EXISTS `smd_itemgroupprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_itemgroupprice` (
  `CompanyID` int DEFAULT NULL,
  `InventoryID` varchar(20) DEFAULT NULL,
  `CustomerGroupID` int DEFAULT NULL,
  `DefaultPrice` varchar(1) DEFAULT '0',
  `Price` decimal(18,0) DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `CustomerGroupID` (`CustomerGroupID`),
  KEY `InventoryID` (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_itemimage`
--

DROP TABLE IF EXISTS `smd_itemimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_itemimage` (
  `ItemImageId` int NOT NULL AUTO_INCREMENT,
  `InventoryId` varchar(50) DEFAULT NULL,
  `CompanyId` int DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `TitleImage` varchar(1) DEFAULT NULL,
  `IsDeleted` varchar(1) DEFAULT '0',
  PRIMARY KEY (`ItemImageId`),
  KEY `CompanyId` (`CompanyId`),
  KEY `InventoryId` (`InventoryId`),
  KEY `ItemImageId` (`ItemImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=1449 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_iteminventoryinfo`
--

DROP TABLE IF EXISTS `smd_iteminventoryinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_iteminventoryinfo` (
  `InventoryId` int DEFAULT NULL,
  `MenuID` varchar(50) DEFAULT NULL,
  `Manufacturer` varchar(200) DEFAULT NULL,
  `SupplierName` varchar(50) DEFAULT NULL,
  `DiscountPrice` decimal(18,0) DEFAULT '0',
  `ShortDescription` longtext,
  `Priority` int DEFAULT NULL,
  `DisplayBeginDepth` int DEFAULT NULL,
  `Show` varchar(50) DEFAULT NULL,
  `Flag1` varchar(1) DEFAULT NULL,
  `Flag2` varchar(1) DEFAULT NULL,
  `Flag3` varchar(1) DEFAULT NULL,
  `Flag4` varchar(1) DEFAULT NULL,
  `isHtmDescription` varchar(1) DEFAULT NULL,
  `IsGiftCertificate` varchar(1) DEFAULT '0',
  `IsExpire` varchar(1) DEFAULT NULL,
  `ExpireDate` datetime DEFAULT NULL,
  `ExpireDays` int DEFAULT NULL,
  `Item_rank` int DEFAULT NULL,
  `Item_Review` longtext,
  `ItemClassID` int DEFAULT NULL,
  `DiscountGroupID` int DEFAULT NULL,
  `IsDeleted` varchar(2) DEFAULT '0',
  `Keywords` longtext,
  `LongDescription` longtext,
  `MetatagTitle` longtext,
  `MetatagDesc` longtext,
  `MetatagKeyword` longtext,
  `ReorderLevel` int DEFAULT '0',
  `MaxQty` int DEFAULT '0',
  `GiftWrappingID` int DEFAULT '0',
  `ItemUploadable` varchar(1) DEFAULT '0',
  `StorePrice` decimal(18,0) DEFAULT '0',
  `ItemImageID` int DEFAULT NULL,
  `Special_List` varchar(1) DEFAULT NULL,
  `weightUnit` varchar(4) DEFAULT '2',
  `heightUnit` varchar(4) DEFAULT '1',
  `eBayItemCode` varchar(30) DEFAULT NULL,
  `categoryOneeBay` varchar(15) DEFAULT NULL,
  `itemListingDays` varchar(15) DEFAULT '0',
  `itemShippigCost` double DEFAULT '10',
  `amazon_FeedSubmissionId` varchar(20) DEFAULT NULL,
  KEY `amazon_FeedSubmissionId` (`amazon_FeedSubmissionId`),
  KEY `DiscountGroupID` (`DiscountGroupID`),
  KEY `eBayItemCode` (`eBayItemCode`),
  KEY `GiftWrappingID` (`GiftWrappingID`),
  KEY `InventoryId` (`InventoryId`),
  KEY `ItemClassID` (`ItemClassID`),
  KEY `ItemImageID` (`ItemImageID`),
  KEY `MenuID` (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_refcountry`
--

DROP TABLE IF EXISTS `smd_refcountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_refcountry` (
  `CountryCode` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `CountryID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CountryID`),
  KEY `CountryCode` (`CountryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_refstate`
--

DROP TABLE IF EXISTS `smd_refstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_refstate` (
  `StateCode` varchar(255) DEFAULT '0',
  `State` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_shipdetails`
--

DROP TABLE IF EXISTS `smd_shipdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_shipdetails` (
  `CompanyID` int DEFAULT '0',
  `shippType` varchar(50) DEFAULT NULL,
  `Field1` varchar(200) DEFAULT NULL,
  `Field2` varchar(200) DEFAULT NULL,
  `Field3` varchar(200) DEFAULT NULL,
  `Field4` varchar(200) DEFAULT NULL,
  `Field5` varchar(200) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_shippdetails`
--

DROP TABLE IF EXISTS `smd_shippdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_shippdetails` (
  `CompanyID` int DEFAULT '0',
  `shippType` varchar(50) DEFAULT NULL,
  `Field1` varchar(200) DEFAULT NULL,
  `Field2` varchar(200) DEFAULT NULL,
  `Field3` varchar(200) DEFAULT NULL,
  `Field4` varchar(200) DEFAULT NULL,
  `Field5` varchar(200) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_storeebaycategory`
--

DROP TABLE IF EXISTS `smd_storeebaycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_storeebaycategory` (
  `eBayCategoryID` int DEFAULT NULL,
  `smdcategoryName` varchar(255) DEFAULT NULL,
  `smdCategoryID` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `isleaf` int DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `isDefault` int DEFAULT NULL,
  KEY `smdCategoryID` (`smdCategoryID`),
  KEY `StoreID` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smd_subproduct`
--

DROP TABLE IF EXISTS `smd_subproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smd_subproduct` (
  `MasterProductID` int DEFAULT NULL,
  `SubProductID` int NOT NULL,
  `SubProductCount` int DEFAULT NULL,
  PRIMARY KEY (`SubProductID`),
  KEY `MasterProductID` (`MasterProductID`),
  KEY `SubProductID` (`SubProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `StateID` int NOT NULL AUTO_INCREMENT,
  `StateName` varchar(50) NOT NULL,
  `CountryID` int NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB AUTO_INCREMENT=4014 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_billingaddress`
--

DROP TABLE IF EXISTS `storage_billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_billingaddress` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `AddressName` varchar(50) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `FirstName` varchar(50) DEFAULT '0',
  `LastName` varchar(50) DEFAULT '0',
  `Address1` varchar(75) DEFAULT '0',
  `Address2` varchar(75) DEFAULT '0',
  `City` varchar(50) DEFAULT '0',
  `State` varchar(50) DEFAULT '0',
  `Province` varchar(50) DEFAULT '0',
  `Country` varchar(50) DEFAULT '0',
  `ZipCode` varchar(50) DEFAULT '0',
  `Status` varchar(10) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Phone` varchar(20) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `isDefault` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`AddressID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `LastName` (`LastName`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1744 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_cart`
--

DROP TABLE IF EXISTS `storage_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `InventoryID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `InventoryCode` varchar(50) DEFAULT NULL,
  `InventoryName` varchar(255) DEFAULT NULL,
  `Qty` int DEFAULT '0',
  `UnitWeight` double DEFAULT '0',
  `Weight` double DEFAULT '0',
  `UnitPrice` double DEFAULT '0',
  `Taxable` tinyint unsigned DEFAULT '1',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ItemTypeID` int DEFAULT '0',
  `Itemtax` double DEFAULT '0',
  `orderid` varchar(50) DEFAULT NULL,
  `OrderItemID` varchar(50) DEFAULT NULL,
  `shippingprice` double DEFAULT '0',
  `shippingtax` double DEFAULT '0',
  `itempromotiondiscount` varchar(50) DEFAULT NULL,
  `itempromotionid` varchar(50) DEFAULT NULL,
  `shippromotiondiscount` varchar(50) DEFAULT NULL,
  `shippromotionid` varchar(50) DEFAULT NULL,
  `ItemSubTotal` varchar(50) DEFAULT NULL,
  `ItemOrder` int DEFAULT '0',
  `BalanceQty` int DEFAULT '0',
  `Unit` varchar(50) DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `SalesTaxRate` double DEFAULT '0',
  `PORef` varchar(20) DEFAULT NULL,
  `SORef` varchar(50) DEFAULT NULL,
  `IsUsedSalesItem` int DEFAULT '0',
  `SupplierID` varchar(50) DEFAULT NULL,
  `CustomSku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CartID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InventoryCode` (`InventoryCode`),
  KEY `InventoryID` (`InventoryID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `itempromotionid` (`itempromotionid`),
  KEY `ItemTypeID` (`ItemTypeID`),
  KEY `orderid` (`orderid`),
  KEY `OrderItemID` (`OrderItemID`),
  KEY `shippromotionid` (`shippromotionid`),
  KEY `SupplierID` (`SupplierID`),
  KEY `SalesTaxRate` (`SalesTaxRate`)
) ENGINE=InnoDB AUTO_INCREMENT=50146 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_clientvendor`
--

DROP TABLE IF EXISTS `storage_clientvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_clientvendor` (
  `ClientVendorID` int DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `DBAName` varchar(45) DEFAULT NULL,
  `Detail` longtext,
  `CustomerTitle` varchar(50) DEFAULT NULL,
  `CustomerTitleID` int DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `BillName` varchar(50) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Province` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `ZipCodeID` varchar(20) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `CellPhone` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePage` varchar(50) DEFAULT NULL,
  `ResellerTaxID` varchar(50) DEFAULT NULL,
  `Taxable` bigint DEFAULT NULL,
  `CVTypeID` int DEFAULT NULL,
  `CVCategoryID` int DEFAULT NULL,
  `CVCategoryName` varchar(50) DEFAULT NULL,
  `ShipCarrierID` int DEFAULT NULL,
  `PaymentTypeID` int DEFAULT NULL,
  `SalesRepID` int DEFAULT NULL,
  `TermID` int DEFAULT NULL,
  `CCTypeID` int DEFAULT NULL,
  `CustomerOpenDebit` double DEFAULT NULL,
  `CustomerCreditLine` double DEFAULT NULL,
  `VendorOpenDebit` double DEFAULT NULL,
  `VendorAllowedCredit` double DEFAULT NULL,
  `Active` int DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Deleted` int DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Priority` int DEFAULT NULL,
  `ItemPriceLevel` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `PayFromID` int DEFAULT NULL,
  `PriceLevelID` int DEFAULT NULL,
  `UseSpecialMessage` tinyint(1) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `CustomerGroupID` int DEFAULT NULL,
  `Form1099` int DEFAULT NULL,
  `ReferenceCustomerID` int DEFAULT NULL,
  `RemainingCredit` double DEFAULT NULL,
  `LineofCreditTermID` int DEFAULT NULL,
  `BankAccountID` int DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `DateInput` datetime DEFAULT NULL,
  `DateTerminated` datetime DEFAULT NULL,
  `isTerminated` tinyint(1) DEFAULT '0',
  `isPhoneMobileNumber` tinyint(1) DEFAULT '0',
  `isMobilePhoneNumber` tinyint(1) DEFAULT '0',
  KEY `BankAccountID` (`BankAccountID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `CCTypeID` (`CCTypeID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `CustomerTitleID` (`CustomerTitleID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `CVCategoryID` (`CVCategoryID`),
  KEY `CVTypeID` (`CVTypeID`),
  KEY `LineofCreditTermID` (`LineofCreditTermID`),
  KEY `PayFromID` (`PayFromID`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PriceLevelID` (`PriceLevelID`),
  KEY `ReferenceCustomerID` (`ReferenceCustomerID`),
  KEY `SalesRepID` (`SalesRepID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `ResellerTaxID` (`ResellerTaxID`),
  KEY `TermID` (`TermID`),
  KEY `ZipCode` (`ZipCode`),
  KEY `ZipCodeID` (`ZipCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_invoice`
--

DROP TABLE IF EXISTS `storage_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_invoice` (
  `InvoiceID` int NOT NULL AUTO_INCREMENT,
  `OrderNum` int DEFAULT '0',
  `PONum` int DEFAULT '0',
  `SONum` int DEFAULT '0',
  `RcvNum` int DEFAULT '0',
  `EstNum` int DEFAULT '0',
  `EmployeeID` int DEFAULT '-1',
  `RefNum` varchar(35) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `Memo` varchar(255) DEFAULT NULL,
  `BillingAddrID` int DEFAULT '0',
  `ShippingAddrID` int DEFAULT '0',
  `BSAddressID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `InvoiceTypeID` int DEFAULT '0',
  `InvoiceStyleID` int DEFAULT '0',
  `Weight` double DEFAULT '0',
  `SubTotal` double DEFAULT '0',
  `Tax` double DEFAULT '0',
  `SH` double DEFAULT '0',
  `Total` double DEFAULT '0',
  `AdjustedTotal` double DEFAULT '0',
  `PaidAmount` double DEFAULT '0',
  `Balance` double DEFAULT '0',
  `SalesRepID` int DEFAULT '0',
  `TermID` int DEFAULT '0',
  `PaymentTypeID` int DEFAULT '0',
  `ShipCarrierID` int DEFAULT '0',
  `MessageID` int DEFAULT '0',
  `SalesTaxID` int DEFAULT '0',
  `Taxable` int DEFAULT '0',
  `Shipped` int DEFAULT '0',
  `IsReceived` tinyint(1) DEFAULT '0',
  `IsPaymentCompleted` tinyint(1) DEFAULT '0',
  `FromPO` tinyint(1) DEFAULT NULL,
  `DateConfirmed` datetime DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CategoryID` int DEFAULT '0',
  `invoiceStatus` int DEFAULT '0',
  `orderid` varchar(50) DEFAULT NULL,
  `shipservicelevel` varchar(50) DEFAULT NULL,
  `ShippingNote1` varchar(200) DEFAULT NULL,
  `ShippingNote2` varchar(50) DEFAULT NULL,
  `StoreTypeID` int DEFAULT '0',
  `StoreID` int DEFAULT '0',
  `ShipCarrier` varchar(50) DEFAULT NULL,
  `IsPrinted` tinyint(1) DEFAULT NULL,
  `IsEmailed` tinyint(1) DEFAULT NULL,
  `ServiceID` int DEFAULT '-1',
  `AmazonGiftWrapType` varchar(255) DEFAULT NULL,
  `AmazonGiftMessageText` varchar(255) DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `TransactionType` int DEFAULT '0',
  `TrackingCode` varchar(50) DEFAULT NULL,
  `GatewayID` int DEFAULT '0',
  `ShippingMethod` varchar(50) DEFAULT NULL,
  `ShippingLabel` varchar(200) DEFAULT NULL,
  `LabelPrinted` varchar(50) DEFAULT '0',
  `dropShipCustomerID` int DEFAULT '0',
  `JobCategoryID` int DEFAULT '0',
  `BillID` int DEFAULT '0',
  `isBillReceived` tinyint(1) DEFAULT NULL,
  `UpfrontAmount` double DEFAULT '0',
  `Note` longtext,
  `BillDate` varchar(255) DEFAULT NULL,
  `GiftAmount` double DEFAULT '0',
  `GiftCertificateCode` varchar(20) DEFAULT NULL,
  `TotalCommission` double DEFAULT NULL,
  `BankAccountID` int DEFAULT '0',
  `NoOfBoxes` int DEFAULT NULL,
  `ShipNumber` varchar(255) DEFAULT NULL,
  `DateReceived` datetime DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `BankAccountID` (`BankAccountID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `InvoiceTypeID` (`InvoiceTypeID`),
  KEY `BillingAddrID` (`BillingAddrID`),
  KEY `BSAddressID` (`BSAddressID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `dropShipCustomerID` (`dropShipCustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `EstNum` (`EstNum`),
  KEY `GatewayID` (`GatewayID`),
  KEY `GiftCertificateCode` (`GiftCertificateCode`),
  KEY `InvoiceStyleID` (`InvoiceStyleID`),
  KEY `MessageID` (`MessageID`),
  KEY `orderid` (`orderid`),
  KEY `OrderNum` (`OrderNum`),
  KEY `PaymentTypeID` (`PaymentTypeID`),
  KEY `PONum` (`PONum`),
  KEY `RcvNum` (`RcvNum`),
  KEY `RefNum` (`RefNum`),
  KEY `SalesRepID` (`SalesRepID`),
  KEY `SalesTaxID` (`SalesTaxID`),
  KEY `ServiceID` (`ServiceID`),
  KEY `ShipCarrierID` (`ShipCarrierID`),
  KEY `ShippingAddrID` (`ShippingAddrID`),
  KEY `SONum` (`SONum`),
  KEY `StoreID` (`StoreID`),
  KEY `TermID` (`TermID`),
  KEY `TrackingCode` (`TrackingCode`),
  KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_payment`
--

DROP TABLE IF EXISTS `storage_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `Amount` double DEFAULT '0',
  `PaymentTypeID` int DEFAULT '1',
  `PayerID` int DEFAULT NULL,
  `PayeeID` int DEFAULT NULL,
  `AccountID` int DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `InvoiceID` int DEFAULT '0',
  `CategoryID` int DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  `PayFromBalance` double DEFAULT '0',
  `PayToBalance` double DEFAULT '0',
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsToBePrinted` tinyint(1) DEFAULT '0',
  `isNeedtoDeposit` tinyint(1) DEFAULT NULL,
  `CheckNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT '0',
  `PayableID` int DEFAULT '0',
  `RmaNo` int DEFAULT '0',
  `RmaItemID` int DEFAULT '0',
  `TransactionID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillNum` int DEFAULT '0',
  `Priority` int DEFAULT '0',
  `TransactionType` int DEFAULT '0',
  `AccountCategoryID` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_shippingaddress`
--

DROP TABLE IF EXISTS `storage_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_shippingaddress` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `AddressName` varchar(50) DEFAULT NULL,
  `ClientVendorID` int DEFAULT '0',
  `Name` varchar(50) DEFAULT '0',
  `FirstName` varchar(50) DEFAULT '0',
  `LastName` varchar(50) DEFAULT '0',
  `Address1` varchar(75) DEFAULT '0',
  `Address2` varchar(75) DEFAULT '0',
  `City` varchar(50) DEFAULT '0',
  `State` varchar(50) DEFAULT '0',
  `Province` varchar(50) DEFAULT '0',
  `Country` varchar(50) DEFAULT '0',
  `ZipCode` varchar(50) DEFAULT '0',
  `Status` varchar(10) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Phone` varchar(20) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `isDefault` int DEFAULT '0',
  `Active` int DEFAULT '1',
  PRIMARY KEY (`AddressID`),
  KEY `ClientVendorID` (`ClientVendorID`),
  KEY `LastName` (`LastName`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1564 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_useractivity`
--

DROP TABLE IF EXISTS `storage_useractivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_useractivity` (
  `UserActivityID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT '0',
  `dateAdded` datetime DEFAULT NULL,
  `InTime` varchar(50) DEFAULT NULL,
  `OutTime` varchar(50) DEFAULT NULL,
  `Module` varchar(100) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `DataID` int DEFAULT '0',
  `DataDescription` varchar(100) DEFAULT NULL,
  `DataAmount` double DEFAULT '0',
  `CompanyID` int DEFAULT '0',
  KEY `CompanyID` (`CompanyID`),
  KEY `DataID` (`DataID`),
  KEY `UserActivityID` (`UserActivityID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=17460 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upsmailinnovation`
--

DROP TABLE IF EXISTS `upsmailinnovation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upsmailinnovation` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderNumber` int DEFAULT '0',
  `Attantion` varchar(50) DEFAULT NULL,
  `MailClass` varchar(50) DEFAULT NULL,
  `TrackingNumber` varchar(50) DEFAULT NULL,
  `Lenght` varchar(50) DEFAULT NULL,
  `Width` varchar(50) DEFAULT NULL,
  `Height` varchar(50) DEFAULT NULL,
  `Weight` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ZipCode` (`ZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldshipinvoice`
--

DROP TABLE IF EXISTS `worldshipinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worldshipinvoice` (
  `siIsVOID` varchar(10) DEFAULT NULL,
  `siServiceType` varchar(50) DEFAULT NULL,
  `siBillingOption` varchar(50) DEFAULT NULL,
  `siShipmentReference1` varchar(35) DEFAULT NULL,
  `siShipmentReference2` varchar(35) DEFAULT NULL,
  `siCallTagOption` varchar(1) DEFAULT NULL,
  `siCallTagReferenceNumber` varchar(12) DEFAULT NULL,
  `siSaturdayDeliveryOption` varchar(1) DEFAULT NULL,
  `siSaturdayPickupOption` varchar(1) DEFAULT NULL,
  `siShipmentNotification1Option` varchar(1) DEFAULT NULL,
  `siShipmentNotification2Option` varchar(1) DEFAULT NULL,
  `siDescriptionOfGoods` varchar(50) DEFAULT NULL,
  `stAttention` varchar(35) DEFAULT NULL,
  `stFirstName` varchar(50) DEFAULT NULL,
  `stLastName` varchar(50) DEFAULT NULL,
  `stCompanyName` varchar(35) DEFAULT NULL,
  `stDepartment` varchar(35) DEFAULT NULL,
  `stRoomFloor` varchar(35) DEFAULT NULL,
  `stStreetAddress` varchar(35) DEFAULT NULL,
  `stCity` varchar(30) DEFAULT NULL,
  `stState` varchar(5) DEFAULT NULL,
  `stZipCode` varchar(9) DEFAULT NULL,
  `stReceiverAccountNumber` varchar(10) DEFAULT NULL,
  `stTelephone` varchar(15) DEFAULT NULL,
  `stFAX` varchar(15) DEFAULT NULL,
  `stCountry` varchar(50) DEFAULT NULL,
  `stResidential` varchar(1) DEFAULT NULL,
  `sfAttention` varchar(35) DEFAULT NULL,
  `sfCompanyName` varchar(35) DEFAULT NULL,
  `sfDepartment` varchar(35) DEFAULT NULL,
  `sfRoomFloor` varchar(35) DEFAULT NULL,
  `sfStreetAddress` varchar(35) DEFAULT NULL,
  `sfCity` varchar(30) DEFAULT NULL,
  `sfState` varchar(5) DEFAULT NULL,
  `sfZipCode` varchar(9) DEFAULT NULL,
  `sfTelephone` varchar(15) DEFAULT NULL,
  `sfFAX` varchar(15) DEFAULT NULL,
  `sfCountry` varchar(50) DEFAULT NULL,
  `pkgIsOversize` varchar(1) DEFAULT NULL,
  `pkgPackageReference1` varchar(35) DEFAULT NULL,
  `pkgPackageReference2` varchar(35) DEFAULT NULL,
  `pkgPackageReference3` varchar(35) DEFAULT NULL,
  `pkgPackageReference4` varchar(35) DEFAULT NULL,
  `pkgPackageReference5` varchar(35) DEFAULT NULL,
  `pkgAdditionalHandlingOption` varchar(1) DEFAULT NULL,
  `pkgShipmentNotification1Option` varchar(1) DEFAULT NULL,
  `pkgShipmentNotification2Option` varchar(1) DEFAULT NULL,
  `pkgHazardousMaterialsOption` varchar(1) DEFAULT NULL,
  `pkgCODOption` varchar(1) DEFAULT NULL,
  `pkgCODControlNumber` varchar(11) DEFAULT NULL,
  `pkgCODAmount` varchar(50) DEFAULT NULL,
  `pkgDeliveryConfirmationOption` varchar(1) DEFAULT NULL,
  `pkgVerbalConfirmationOption` varchar(1) DEFAULT NULL,
  `pkgInsuredValueOption` varchar(1) DEFAULT NULL,
  `pkgInsuredValueAmount` varchar(50) DEFAULT NULL,
  `pkgPackageType` varchar(50) DEFAULT NULL,
  `pkgWeight` varchar(50) DEFAULT NULL,
  KEY `sfZipCode` (`sfZipCode`),
  KEY `stZipCode` (`stZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldshippostdata`
--

DROP TABLE IF EXISTS `worldshippostdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worldshippostdata` (
  `siIsVOID` varchar(10) DEFAULT NULL,
  `siServiceType` varchar(50) DEFAULT NULL,
  `siShipmentID` varchar(50) DEFAULT NULL,
  `siIsHundredWeight` varchar(1) DEFAULT NULL,
  `siIsExtendedArea` varchar(1) DEFAULT NULL,
  `siBillableWeight` varchar(50) DEFAULT NULL,
  `siBillingOption` varchar(50) DEFAULT NULL,
  `siShipmentReference1` varchar(35) DEFAULT NULL,
  `siShipmentReference2` varchar(35) DEFAULT NULL,
  `siInsuredValueOption` varchar(1) DEFAULT NULL,
  `siInsuredValueCharge` varchar(50) DEFAULT NULL,
  `siInsuredValueAmount` varchar(50) DEFAULT NULL,
  `siCallTagOption` varchar(1) DEFAULT NULL,
  `siCallTagReferenceNumber` varchar(12) DEFAULT NULL,
  `siCallTagCharge` varchar(50) DEFAULT NULL,
  `siSaturdayDeliveryOption` varchar(1) DEFAULT NULL,
  `siSaturdayDeliveryCharge` varchar(50) DEFAULT NULL,
  `siSaturdayPickupOption` varchar(1) DEFAULT NULL,
  `siSaturdayPickupCharge` varchar(50) DEFAULT NULL,
  `siShipmentNotification1Option` varchar(1) DEFAULT NULL,
  `siShipmentNotification1Charge` varchar(50) DEFAULT NULL,
  `siShipmentNotification2Option` varchar(1) DEFAULT NULL,
  `siShipmentNotification2Charge` varchar(50) DEFAULT NULL,
  `siDescriptionOfGoods` varchar(50) DEFAULT NULL,
  `siTotalShipmentCharge` varchar(50) DEFAULT NULL,
  `siTotalShipperCharge` varchar(50) DEFAULT NULL,
  `siTotalReceiverCharge` varchar(50) DEFAULT NULL,
  `siNumberOfPackages` varchar(50) DEFAULT NULL,
  `stAttention` varchar(35) DEFAULT NULL,
  `stCompanyName` varchar(35) DEFAULT NULL,
  `stDepartment` varchar(35) DEFAULT NULL,
  `stRoomFloor` varchar(35) DEFAULT NULL,
  `stStreetAddress` varchar(35) DEFAULT NULL,
  `stCity` varchar(30) DEFAULT NULL,
  `stState` varchar(5) DEFAULT NULL,
  `stZipCode` varchar(9) DEFAULT NULL,
  `stReceiverAccountNumber` varchar(10) DEFAULT NULL,
  `stTelephone` varchar(15) DEFAULT NULL,
  `stFAX` varchar(15) DEFAULT NULL,
  `stCountry` varchar(50) DEFAULT NULL,
  `stResidential` varchar(1) DEFAULT NULL,
  `sfAttention` varchar(35) DEFAULT NULL,
  `sfCompanyName` varchar(35) DEFAULT NULL,
  `sfDepartment` varchar(35) DEFAULT NULL,
  `sfRoomFloor` varchar(35) DEFAULT NULL,
  `sfStreetAddress` varchar(35) DEFAULT NULL,
  `sfCity` varchar(30) DEFAULT NULL,
  `sfState` varchar(5) DEFAULT NULL,
  `sfZipCode` varchar(9) DEFAULT NULL,
  `sfTelephone` varchar(15) DEFAULT NULL,
  `sfFAX` varchar(15) DEFAULT NULL,
  `sfCountry` varchar(50) DEFAULT NULL,
  `pkgTrackingNumber` varchar(30) DEFAULT NULL,
  `pkgIsOversize` varchar(1) DEFAULT NULL,
  `pkgPackageReference1` varchar(35) DEFAULT NULL,
  `pkgPackageReference2` varchar(35) DEFAULT NULL,
  `pkgPackageReference3` varchar(35) DEFAULT NULL,
  `pkgPackageReference4` varchar(35) DEFAULT NULL,
  `pkgPackageReference5` varchar(35) DEFAULT NULL,
  `pkgAdditionalHandlingOption` varchar(1) DEFAULT NULL,
  `pkgAdditionalHandlingCharge` varchar(50) DEFAULT NULL,
  `pkgShipmentNotification1Option` varchar(1) DEFAULT NULL,
  `pkgShipmentNotification1Charge` varchar(50) DEFAULT NULL,
  `pkgShipmentNotification2Option` varchar(1) DEFAULT NULL,
  `pkgShipmentNotification2Charge` varchar(50) DEFAULT NULL,
  `pkgHazardousMaterialsOption` varchar(1) DEFAULT NULL,
  `pkgHazardousMaterialsCharge` varchar(50) DEFAULT NULL,
  `pkgCODOption` varchar(1) DEFAULT NULL,
  `pkgCODControlNumber` varchar(11) DEFAULT NULL,
  `pkgCODCharge` varchar(50) DEFAULT NULL,
  `pkgCODAmount` varchar(50) DEFAULT NULL,
  `pkgDeliveryConfirmationOption` varchar(1) DEFAULT NULL,
  `pkgDeliveryConfirmationCharge` varchar(50) DEFAULT NULL,
  `pkgVerbalConfirmationOption` varchar(1) DEFAULT NULL,
  `pkgVerbalConfirmationCharge` varchar(50) DEFAULT NULL,
  `pkgInsuredValueOption` varchar(1) DEFAULT NULL,
  `pkgInsuredValueCharge` varchar(50) DEFAULT NULL,
  `pkgInsuredValueAmount` varchar(50) DEFAULT NULL,
  `pkgPackageType` varchar(50) DEFAULT NULL,
  `pkgWeight` varchar(50) DEFAULT NULL,
  KEY `sfZipCode` (`sfZipCode`),
  KEY `siIsVOID` (`siIsVOID`),
  KEY `siShipmentID` (`siShipmentID`),
  KEY `stZipCode` (`stZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-21 12:13:45
