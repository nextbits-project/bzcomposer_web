
-- changes 1 foriegn keys added, inventortCode may not required  
-- Indexes for table `adjustment_reason`
--
ALTER TABLE `adjustment_reason`
--   ADD PRIMARY KEY (`ID`),
  ADD FOREIGN KEY (`companyId`) REFERENCES `bca_company`(`companyId`),
  ADD FOREIGN KEY (`inventoryid`) REFERENCES `bca_iteminventory`(`inventoryid`); 
  
--
-- Indexes for table `bca_account`
-- changes 2 foreign key added. AcctTypeID can be foreign key , parent Id, DepositPaymentID can be foreign key
ALTER TABLE `bca_account`
--   ADD PRIMARY KEY (`AccountID`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES `bca_company`(`CompanyId`),
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor`(`clientVendorId`),
  ADD FOREIGN KEY (`AcctCategoryID`) REFERENCES `bca_acctcategory`(`AcctCategoryID`),
  ADD FOREIGN KEY (`AcctTypeID`) REFERENCES `bca_accttype`(`AcctTypeID`);


--
-- Indexes for table `bca_accountable`
--  changes 3 foreign key added . The key PayableID is primary and unique not requird. PayFromID,PayerCvID can be foreign key
ALTER TABLE `bca_accountable`
--   ADD PRIMARY KEY (`PayableID`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category`(`CategoryID`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES `bca_company`(`CompanyId`),
  ADD FOREIGN KEY (`CreditCardID`) REFERENCES `bca_cvcreditcard`(`CreditCardID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice`(`InvoiceID`),
--   ADD KEY `PayerCvID` (`PayerCvID`),
--   ADD KEY `PayFromID` (`PayFromID`),
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`);


--
-- Indexes for table `bca_acctcategory`
-- changes 4 key can be changed as primary key
ALTER TABLE `bca_acctcategory`
 -- ADD  KEY `AcctCategoryID` (`AcctCategoryID`);
 ADD PRIMARY KEY (`AcctCategoryID`);

--
-- Indexes for table `bca_accttype`
--
-- ALTER TABLE `bca_accttype`
--   ADD UNIQUE KEY `AcctTypeID` (`AcctTypeID`);

--
-- Indexes for table `bca_activestoreforproductssubmission`
-- changes 5 forign key added
ALTER TABLE `bca_activestoreforproductssubmission`
  ADD FOREIGN KEY (`storeID`) REFERENCES `bca_store`(`storeID`),
  ADD FOREIGN KEY (`StoreTypeID`) REFERENCES `bca_storetype`(`StoreTypeID`);

--
-- Indexes for table `bca_amazoncategorytemplate`
-- changes 6 auto increment constraint added lately in line 212127. it can be in 1 place
-- ALTER TABLE `bca_amazoncategorytemplate`
--  ADD PRIMARY KEY (`CategoryTemplateID`);
   -- ADD KEY `CategoryTemplateID` (`CategoryTemplateID`);

--
-- Indexes for table `bca_apmemorizedgroup`
-- changes 7  added foreign key . GroupID not required to be mul key
ALTER TABLE `bca_apmemorizedgroup`
--   ADD PRIMARY KEY (`GroupID`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES `bca_company`(`CompanyId`);

 -- ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `bca_apmemorizedingroup`
-- changes 8 foreign key added 
ALTER TABLE `bca_apmemorizedingroup`
--   ADD KEY `BillingGroupID` (`BillingGroupID`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES `bca_company`(`CompanyId`);
--   ADD KEY `MemorizeID` (`MemorizeID`);


--
-- Indexes for table `bca_argroupbilling`
-- changes 9 added forign keys 
ALTER TABLE `bca_argroupbilling`
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor`(`clientVendorId`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES `bca_company`(`CompanyId`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice`(`InvoiceID`);

--
-- Indexes for table `bca_att1`
--
-- ALTER TABLE `bca_att1`
--   ADD KEY `Att1_ID` (`Att1_ID`);

--
-- Indexes for table `bca_att2`
--
-- ALTER TABLE `bca_att2`
--   ADD KEY `Att2_ID` (`Att2_ID`);

--
-- Indexes for table `bca_authorizemerchantaccount`
-- changes 10 CompanyID present in 2 tables bca_authorizemerchantaccount and bca_company. So it should be clarified 
-- for primary key index mul key not required .CompanyID can be forign key 
-- ALTER TABLE `bca_authorizemerchantaccount`
--   ADD PRIMARY KEY (`CompanyID`),
  -- ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `x_tran_key` (`x_tran_key`);

--
-- Indexes for table `bca_balancesheetitem`
-- changes 11 companyID referes to which companyID 
ALTER TABLE `bca_balancesheetitem`
--   ADD PRIMARY KEY (`balancesheetitemID`),
--   ADD KEY `CategoryTypeID` (`CategoryTypeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);


--
-- Indexes for table `bca_bill`
-- changes 12 foreign key added 
ALTER TABLE `bca_bill`
--   ADD KEY `AmountPaid` (`AmountPaid`),
--   ADD KEY `BillNum` (`BillNum`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category`(`CategoryID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
--   ADD KEY `PayerID` (`PayerID`),
  ADD FOREIGN KEY (`PaymentID`) REFERENCES `bca_payment`(`PaymentID`),
  ADD FOREIGN KEY (`ServiceID`) REFERENCES `bca_servicetype`(`ServiceID`);
--   ADD KEY `VendorId` (`VendorId`);


--
-- Indexes for table `bca_billdetail`
-- changes 13 redundant key for billdetailid not required companyid refers to what table? 13
ALTER TABLE `bca_billdetail`
--   ADD PRIMARY KEY (`BillDetailID`),
--   ADD KEY `BillNum` (`BillNum`),
--   ADD KEY `CompanyID` (`CompanyID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
--   ADD KEY `ExpenseAcctID` (`ExpenseAcctID`),
--   ADD KEY `ExpenseClientVendorID` (`ExpenseClientVendorID`),
--   ADD KEY `InventoryCustID` (`InventoryCustID`),
--   ADD KEY `InventoryID` (`InventoryID`),
  ADD FOREIGN KEY (`InventoryID`) REFERENCES `bca_iteminventory`(`InventoryID`),
--   ADD KEY `InvoiceID` (`InvoiceID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice`(`InvoiceID`);


--
-- Indexes for table `bca_billingaddress`
-- changes foreign key added
ALTER TABLE `bca_billingaddress`
--   ADD PRIMARY KEY (`AddressID`),
--   ADD KEY `LastName` (`LastName`),
--   ADD KEY `ZipCode` (`ZipCode`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES `bca_clientvendor`(`ClientVendorID`);

--
-- Indexes for table `bca_billingstatements`
-- changes 14 unique key can be  removed, foreign key added.unique ky can be removd 

ALTER TABLE `bca_billingstatements`
--   ADD PRIMARY KEY (`StatementNo`),
  ADD UNIQUE KEY `UK_StatementNo` (`StatementNo`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES `bca_clientvendor` (`ClientVendorID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice` (`InvoiceID`);

--
-- Indexes for table `bca_budget`
-- changes 15 since primary key is added key not required 
ALTER TABLE `bca_budget`
--   ADD PRIMARY KEY (`BudgetID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`);


--
-- Indexes for table `bca_budgetcategory`
-- changes 16 added foreign key 
ALTER TABLE `bca_budgetcategory`
--   ADD PRIMARY KEY (`BudgetCategoryID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`);

--
-- Indexes for table `bca_budgetdetail`
-- changes 17 added foreign key  
ALTER TABLE `bca_budgetdetail`
--   ADD KEY `BudgetdetailID` (`BudgetdetailID`),
  ADD FOREIGN KEY (`BudgetID`) REFERENCES `bca_budget` (`BudgetID`);
--   ADD KEY `CategoryID` (`CategoryID`),
--   ADD KEY `cvId` (`cvId`);


--
-- Indexes for table `bca_businesscategories`, bca_category
-- changes  18 There are 3 categoryID in the table so CategoryID can be named accordingly. It can be businessCategoriesID from --------bca_businesscategories, categoryDetailsId from bca_category_details and categoryId from bca_category, uniqus is not rquired. Foreign key added 
ALTER TABLE `bca_businesscategories`
--   ADD PRIMARY KEY (`CategoryID`),
  ADD FOREIGN KEY (`CategoryTypeID`) REFERENCES `bca_categorytype` (`CategoryTypeID`);
--   ADD KEY `BusinessTypeID` (`BusinessTypeID`);

--
-- Indexes for table `bca_businessmodules`
-- changes 19 added foreign key 
ALTER TABLE `bca_businessmodules`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD FOREIGN KEY (`ModuleID`) REFERENCES `bca_usermodules` (`ModuleID`);

--
-- Indexes for table `bca_businesstype`
-- changes 19 key not required, Primary key already defined clientvendorid refers supplierid  
-- ALTER TABLE `bca_businesstype`
--   ADD PRIMARY KEY (`BusinessTypeID`);

--
-- Indexes for table `bca_cart`
--
ALTER TABLE `bca_cart`
--   ADD PRIMARY KEY (`CartID`),
--   ADD KEY `CategoryID` (`CategoryID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
--   ADD KEY `InventoryCode` (`InventoryCode`),
  ADD FOREIGN KEY (`Inventoryid`) REFERENCES `bca_iteminventory` (`inventoryid`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice` (`InvoiceID`),
--   ADD KEY `itempromotionid` (`itempromotionid`),
--   ADD KEY `ItemTypeID` (`ItemTypeID`),
	MODIFY COLUMN `orderid` INT,
  ADD FOREIGN KEY (`orderid`) REFERENCES `bca_ordertemplate` (`OrderID`);
--   ADD KEY `OrderItemID` (`OrderItemID`),
--   ADD KEY `shippromotionid` (`shippromotionid`),
--   ADD KEY `SupplierID` (`SupplierID`),
--   ADD KEY `SalesTaxRate` (`SalesTaxRate`);

--
-- Indexes for table `bca_cartmemorized`
-- changes 20 added foreign key orderid is present in 2 tables. What to use here?
ALTER TABLE `bca_cartmemorized`
--   ADD PRIMARY KEY (`CartID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
--   ADD KEY `InventoryCode` (`InventoryCode`),
  ADD FOREIGN KEY (`Inventoryid`) REFERENCES `bca_iteminventory` (`inventoryid`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice` (`InvoiceID`),
--   ADD KEY `itempromotionid` (`itempromotionid`),
--   ADD KEY `ItemTypeID` (`ItemTypeID`),
  ADD FOREIGN KEY (`OrderId`) REFERENCES `smc_orders` (`OrderId`);
--   ADD KEY `OrderItemID` (`OrderItemID`),
--   ADD KEY `shippromotionid` (`shippromotionid`);
-- 

--
-- Indexes for table `bca_category`
-- changes 22
ALTER TABLE `bca_category`
--   ADD PRIMARY KEY (`CategoryID`),
--   ADD KEY `CategoryTypeID` (`CategoryTypeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`);

--
-- Indexes for table `bca_categorytype`
-- changes 23
ALTER TABLE `bca_categorytype`
--   ADD PRIMARY KEY (`CategoryTypeID`),
--   ADD KEY `CategoryTypeID` (`CategoryTypeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`);

--
-- Indexes for table `bca_cities`
--
-- ALTER TABLE `bca_cities`
--   ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bca_clientcategory`
--
-- ALTER TABLE `bca_clientcategory`
--   ADD KEY `CVCategoryID` (`CVCategoryID`);

--
-- Indexes for table `bca_clientvendor`
-- changes 23 CVCategoryID rfers clientcategory
ALTER TABLE `bca_clientvendor`
  ADD PRIMARY KEY (`ClientVendorID`);
--   ADD KEY `BankAccountID` (`BankAccountID`),
--   ADD KEY `CategoryID` (`CategoryID`),
--   ADD KEY `CCTypeID` (`CCTypeID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `CustomerTitleID` (`CustomerTitleID`),
--   ADD KEY `CVCategoryID` (`CVCategoryID`),
--   ADD KEY `CVTypeID` (`CVTypeID`),
--   ADD KEY `LineofCreditTermID` (`LineofCreditTermID`),
--   ADD KEY `PayFromID` (`PayFromID`),
--   ADD KEY `PaymentTypeID` (`PaymentTypeID`),
--   ADD KEY `PriceLevelID` (`PriceLevelID`),
--   ADD KEY `ReferenceCustomerID` (`ReferenceCustomerID`),
--   ADD KEY `SalesRepID` (`SalesRepID`),
--   ADD KEY `ShipCarrierID` (`ShipCarrierID`),
--   ADD KEY `ResellerTaxID` (`ResellerTaxID`),
--   ADD KEY `TermID` (`TermID`),
--   ADD KEY `ZipCode` (`ZipCode`),
--   ADD KEY `ZipCodeID` (`ZipCodeID`);

ALTER TABLE `bca_clientvendor`
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category` (`CategoryID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype` (`PaymentTypeID`),
  ADD FOREIGN KEY (`SalesRepID`) REFERENCES `bca_salestax` (`SalesTaxID`),
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES `bca_shipcarrier` (`ShipCarrierID`),
  ADD FOREIGN KEY (`TermID`) REFERENCES `bca_term` (`TermID`);



--
-- Indexes for table `bca_clientvendorcontacthistory`
-- changes 24 ClientVendorID can be primary key
ALTER TABLE `bca_clientvendorcontacthistory`
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor` (`clientVendorId`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`);

--
-- Indexes for table `bca_clientvendorfinancecharges`
-- changes 25 ClientVendorID can be foreign key
ALTER TABLE `bca_clientvendorfinancecharges`
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor` (`clientVendorId`);

--
-- Indexes for table `bca_clientvendorjob`
-- changes 26
ALTER TABLE `bca_clientvendorjob`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD KEY (`ClientVendorID`);


--
-- Indexes for table `bca_clientvendorservice`
-- changes 27 added foreign key
ALTER TABLE `bca_clientvendorservice`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor` (`clientVendorId`),
  ADD KEY (`ServiceID`),
  ADD KEY (`ServiceTypeID`);


--
-- Indexes for table `bca_company`
-- changes 26 key company id not required
ALTER TABLE `bca_company`
--   ADD PRIMARY KEY (`CompanyID`),
  ADD FOREIGN KEY (`BusinessTypeID`) REFERENCES `bca_businesstype` (`BusinessTypeID`),
  ADD FOREIGN KEY (`POStyleID`) REFERENCES `bca_postyle` (`POStyleID`),
  ADD FOREIGN KEY (`SalesTaxID`) REFERENCES `bca_salestax` (`SalesTaxID`),
  ADD KEY (`InvoiceFootnoteID`),
  ADD KEY (`POFootnoteID`),
  ADD KEY (`Zipcode`);

--
-- Indexes for table `bca_consignmentsale`
-- changes 27 foreign key added. OrderNum may be foreign key
ALTER TABLE `bca_consignmentsale`
--   ADD PRIMARY KEY (`ConsignID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice` (`InvoiceID`),
  ADD KEY (`OrderNum`),
  ADD KEY (`SupplierID`);

--
-- Indexes for table `bca_cordinates`
-- changes 28 key not required
-- ALTER TABLE `bca_cordinates`
--   ADD PRIMARY KEY (`cordinatesID`);


--
-- Indexes for table `bca_countries`
--
-- ALTER TABLE `bca_countries`
--   ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bca_creditcardtype`
--
ALTER TABLE `bca_creditcardtype`
--   ADD KEY `CCTypeID` (`CCTypeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`);


--
-- Indexes for table `bca_currency`
--
-- ALTER TABLE `bca_currency`
--   ADD UNIQUE KEY `CurrencyID` (`CurrencyID`);

--
-- Indexes for table `bca_customdate`
--
-- ALTER TABLE `bca_customdate`
--   ADD PRIMARY KEY (`ID`);
-- 
--
-- Indexes for table `bca_customer_type`
--
-- ALTER TABLE `bca_customer_type`
--   ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bca_customfile`
--
-- ALTER TABLE `bca_customfile`
--   ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bca_customoptions`
--
-- ALTER TABLE `bca_customoptions`
--   ADD PRIMARY KEY (`OptionId`),
--   ADD KEY `OptionId` (`OptionId`),
--   ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `bca_customtext`
--
-- ALTER TABLE `bca_customtext`
--   ADD PRIMARY KEY (`ID`);
-- 
--
-- Indexes for table `bca_cvcreditcard`
--
-- ALTER TABLE `bca_cvcreditcard`
--   ADD UNIQUE KEY `CreditCardID` (`CreditCardID`);

--
-- Indexes for table `bca_cvtype`
--
-- ALTER TABLE `bca_cvtype`
--   ADD UNIQUE KEY `CVTypeID` (`CVTypeID`);

--
-- Indexes for table `bca_esalesitemcategory`
-- changes 29 added foreign keys
ALTER TABLE `bca_esalesitemcategory`
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category` (`CategoryID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES `bca_store` (`StoreID`),
  ADD FOREIGN KEY (`StoreTypeID`) REFERENCES `bca_storetype` (`StoreTypeID`);

--
-- Indexes for table `bca_exporteditemedetail`
-- chnges 30 foreign key added
ALTER TABLE `bca_exporteditemedetail`
--   ADD PRIMARY KEY (`ExportedProductID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD KEY (`CrossSellParentID`),
  ADD KEY (`ExportedInventoryID`),
  ADD KEY (`ExportedProductID`),
  ADD KEY (`ProductCode`),
  ADD KEY (`StoreID`),
  ADD FOREIGN KEY (`Inventoryid`) REFERENCES `bca_iteminventory` (`inventoryid`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES `bca_store` (`StoreID`);


--
-- Indexes for table `bca_features`
--
ALTER TABLE `bca_features`
--   ADD KEY `BusinessID` (`BusinessID`),
  ADD FOREIGN KEY (`ModuleID`) REFERENCES `bca_usermodules` (`ModuleID`);


--
-- Indexes for table `bca_footnote`
--
-- ALTER TABLE `bca_footnote`
--   ADD UNIQUE KEY `FootNoteID` (`FootNoteID`);

--
-- Indexes for table `bca_form_templates`
-- changes foreign key added. different name FK25by5d07g10gf4mcldiy8ik9m
ALTER TABLE `bca_form_templates`
--   ADD PRIMARY KEY (`template_type_no`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);
--   ADD KEY `FK25by5d07g10gf4mcldiy8ik9m` (`template_id_type`);

--
-- Indexes for table `bca_form_templates_type`
-- changes foreign key added
ALTER TABLE `bca_form_templates_type`
--   ADD PRIMARY KEY (`template_id`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);

--
-- Indexes for table `bca_history`
-- changes what is ImportedHistoryID
ALTER TABLE `bca_history`
--   ADD PRIMARY KEY (`ImportId`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
--   ADD KEY `ImportedHistoryID` (`ImportedHistoryID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES `bca_store`(`StoreID`);


--
-- Indexes for table `bca_inventoryassembly`
--
ALTER TABLE `bca_inventoryassembly`
   ADD FOREIGN KEY (`Inventoryid`) REFERENCES bca_iteminventory(`inventoryid`);
	 
--
-- Indexes for table `bca_inventorycollectedfromstore`
-- changes foreign key added. OrderItemID can be foreign key
ALTER TABLE `bca_inventorycollectedfromstore`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`OrderId`) REFERENCES smc_orders(`OrderId`);
--   ADD KEY `OrderItemID` (`OrderItemID`),
--   ADD KEY `SKU` (`SKU`);

--
-- Indexes for table `bca_inventorycrosssell`
-- changes foreign key added
ALTER TABLE `bca_inventorycrosssell`
  ADD FOREIGN KEY (`Inventoryid`) REFERENCES `bca_iteminventory`(`inventoryid`);

--
-- Indexes for table `bca_inventorysupplierdetail`
--
ALTER TABLE `bca_inventorysupplierdetail`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD KEY (`SupplierBarCode`),
  ADD KEY (`ID`),
  ADD FOREIGN KEY (`Inventoryid`) REFERENCES `bca_iteminventory`(`inventoryid`);


--
-- Indexes for table `bca_invoice`
-- changes foreign key added. BillingAddrID can be primary
-- changes `bca_bsaddress`(`BSAddressID`), `bca_employee`(`EmployeeIndexID`) not a primary key
ALTER TABLE `bca_invoice`
--   ADD PRIMARY KEY (`InvoiceID`),
--   ADD KEY `BankAccountID` (`BankAccountID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD FOREIGN KEY (`InvoiceTypeID`) REFERENCES `bca_invoicetype`(`InvoiceTypeID`),
--   ADD KEY `BillingAddrID` (`BillingAddrID`),
--   ADD FOREIGN KEY (`BSAddressID`) REFERENCES `bca_bsaddress`(`BSAddressID`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category`(`CategoryID`),
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor`(`clientVendorId`),
--   ADD KEY `dropShipCustomerID` (`dropShipCustomerID`),
--   ADD FOREIGN KEY (`EmployeeID`) REFERENCES `bca_employee`(`EmployeeIndexID`),
--   ADD KEY `EstNum` (`EstNum`),
  ADD FOREIGN KEY (`GatewayID`) REFERENCES `bca_masterpaymentgateways`(`GatewayID`),
--   ADD KEY `GiftCertificateCode` (`GiftCertificateCode`),
  ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES `bca_invoicestyle`(`InvoiceStyleID`),
  ADD FOREIGN KEY (`MessageID`) REFERENCES `bca_message`(`MessageID`),
  ADD FOREIGN KEY (`OrderId`) REFERENCES `smc_orders`(`OrderId`),
--   ADD KEY `OrderNum` (`OrderNum`),
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`),
--   ADD KEY `PONum` (`PONum`),
--   ADD KEY `RcvNum` (`RcvNum`),
--   ADD KEY `RefNum` (`RefNum`),
  ADD FOREIGN KEY (`SalesRepID`) REFERENCES `bca_salestax`(`SalesTaxID`),
  ADD FOREIGN KEY (`SalesTaxID`) REFERENCES `bca_salestax`(`SalesTaxID`),
--   ADD KEY `ServiceID` (`ServiceID`),
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES `bca_shipcarrier`(`ShipCarrierID`),
--   ADD KEY `ShippingAddrID` (`ShippingAddrID`),
--   ADD KEY `SONum` (`SONum`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES `bca_store`(`StoreID`),
  ADD FOREIGN KEY (`TermID`) REFERENCES `bca_term`(`TermID`);
--   ADD KEY `TrackingCode` (`TrackingCode`),
--   ADD KEY `TransactionID` (`TransactionID`);


--
-- Indexes for table `bca_invoicecredit`
-- changes cvId can be primary
ALTER TABLE `bca_invoicecredit`
--   ADD KEY `cvId` (`cvId`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice`(`InvoiceID`),
  ADD FOREIGN KEY (`InvoiceTypeID`) REFERENCES `bca_invoicetype`(`InvoiceTypeID`);


--
-- Indexes for table `bca_invoicediscount`
-- changes foreign key added
ALTER TABLE `bca_invoicediscount`
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category`(`CategoryID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice`(`InvoiceID`);


--
-- Indexes for table `bca_invoicememorized`
-- changes foreign key added. employeeId, employeeindexId conflict 
-- changes `bca_bsaddress`(`BSAddressID`), `bca_employee`(`EmployeeIndexID`) not a primary key
--
ALTER TABLE `bca_invoicememorized`
--   ADD PRIMARY KEY (`InvoiceID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD FOREIGN KEY (`InvoiceTypeID`) REFERENCES `bca_invoicetype`(`InvoiceTypeID`),
  ADD KEY (`BillingAddrID`),
--   ADD FOREIGN KEY (`BSAddressID`) REFERENCES `bca_bsaddress`(`BSAddressID`),
  ADD KEY (`CategoryID`),
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor`(`clientVendorId`),
  ADD KEY (`dropShipCustomerID`),
--   ADD FOREIGN KEY (`EmployeeID`) REFERENCES `bca_employee`(`EmployeeIndexID`),
  ADD KEY (`EstNum`),
  ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES `bca_invoicestyle`(`InvoiceStyleID`),
  ADD FOREIGN KEY (`MessageID`) REFERENCES `bca_message`(`MessageID`),
  ADD FOREIGN KEY (`OrderId`) REFERENCES `smc_orders`(`OrderId`),
  ADD KEY (`OrderNum`),
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`),
  ADD KEY (`PONum`),
  ADD KEY (`RcvNum`),
  ADD KEY (`RefNum`),
  ADD FOREIGN KEY (`SalesRepID`) REFERENCES `bca_salestax`(`SalesTaxID`),
  ADD FOREIGN KEY (`SalesTaxID`) REFERENCES `bca_salestax`(`SalesTaxID`),
  ADD KEY (`ShipCarrierID`),
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES `bca_shipcarrier`(`ShipCarrierID`),
  ADD KEY (`ShippingAddrID`),
  ADD KEY (`StoreID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES `bca_store`(`StoreID`),
  ADD KEY (`TermID`),
  ADD FOREIGN KEY (`TermID`) REFERENCES `bca_term`(`TermID`);


--
-- Indexes for table `bca_invoicesalessummaryamt`
-- changes 3  foreign key added
ALTER TABLE `bca_invoicesalessummaryamt`
--   ADD PRIMARY KEY (`ID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice`(`InvoiceID`);

--
-- Indexes for table `bca_invoiceshipdetail`
-- changes 3  added foreign keys
ALTER TABLE `bca_invoiceshipdetail`
--   ADD PRIMARY KEY (`ShipDetailID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice`(`InvoiceID`),
  ADD KEY (`ShippingServiceID`);


--
-- Indexes for table `bca_invoiceshipped`
-- changes  added foreign key, unique key not required. InvoiceID,EstNum,OrderNum can be foreign key
--
ALTER TABLE `bca_invoiceshipped`
--   ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY (`BillingAddrID`),
  ADD KEY (`BSAddressID`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category`(`CategoryID`),
  ADD FOREIGN KEY (`clientVendorId`) REFERENCES `bca_clientvendor`(`clientVendorId`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD KEY (`dropShipCustomerID`),
  ADD KEY (`EmployeeID`),
  ADD KEY (`EstNum`),
  ADD KEY (`GatewayTypeID`),
  ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES `bca_invoicestyle`(`InvoiceStyleID`),
  ADD FOREIGN KEY (`InvoiceTypeID`) REFERENCES `bca_invoicetype`(`InvoiceTypeID`),
  ADD KEY (`MessageID`),
  ADD FOREIGN KEY (`OrderId`) REFERENCES `smc_orders`(`OrderId`),
  ADD KEY (`OrderNum`),
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`),
  ADD KEY (`PONum`),
  ADD KEY (`RcvNum`),
  ADD KEY (`RefNum`),
  ADD FOREIGN KEY (`SalesRepID`) REFERENCES `bca_salestax`(`SalesTaxID`),
  ADD FOREIGN KEY (`SalesTaxID`) REFERENCES `bca_salestax`(`SalesTaxID`),
  ADD KEY (`ServiceID`),
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES `bca_shipcarrier`(`ShipCarrierID`),
  ADD KEY (`ShippingAddrID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES `bca_store`(`StoreID`),
  ADD FOREIGN KEY (`TermID`) REFERENCES `bca_term`(`TermID`),
  ADD KEY (`TrackingCode`),
  ADD KEY (`TransactionID`);


--
-- Indexes for table `bca_invoicestyle`
--
-- ALTER TABLE `bca_invoicestyle`
--   ADD UNIQUE KEY `InvoiceStyleID` (`InvoiceStyleID`);

--
-- Indexes for table `bca_invoicetype`
--
-- ALTER TABLE `bca_invoicetype`
--   ADD UNIQUE KEY `InvoiceTypeID` (`InvoiceTypeID`);

--
-- Indexes for table `bca_invoice_activetemplates`
-- changes key not required., since primary key present. foreign ky added
ALTER TABLE `bca_invoice_activetemplates`
--   ADD PRIMARY KEY (`ID`),
  ADD FOREIGN KEY (`TemplateId`) REFERENCES `bca_invoice_template`(`TemplateId`);


--
-- Indexes for table `bca_invoice_layoutcolumnsscreensetting`
-- changes   2 tables `bca_invoice_template`, bca_mailtemplate has primary key as templateId
ALTER TABLE `bca_invoice_layoutcolumnsscreensetting`
    ADD FOREIGN KEY (`TemplateId`) REFERENCES bca_invoice_template(`TemplateId`);



--
-- Indexes for table `bca_invoice_layoutfieldscreensetting`
-- changes foreign key added new alter
ALTER TABLE `bca_invoice_layoutcolumnssetting`
    ADD FOREIGN KEY (`TemplateId`) REFERENCES bca_invoice_template(`TemplateId`);

--
-- Indexes for table `bca_invoice_layoutfieldscreensetting`
-- changes there are 2 template ids. which one is refered here?
ALTER TABLE `bca_invoice_layoutfieldscreensetting`
    ADD FOREIGN KEY (`TemplateId`) REFERENCES bca_invoice_template(`TemplateId`);

--
-- Indexes for table `bca_invoice_layoutfieldssetting`
-- changes bca_invoice_template(`TemplateId`) not a primary key
-- ALTER TABLE `bca_invoice_layoutfieldssetting`
--    ADD FOREIGN KEY (`TemplateId`) REFERENCES bca_invoice_template(`TemplateId`);

--
-- Indexes for table `bca_invoice_template`
-- changes foreign key added
ALTER TABLE `bca_invoice_template`
--   ADD PRIMARY KEY (`TemplateId`),
  ADD KEY (`BaseTemplateId`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD KEY (`TemplateStyleTypeID`),
  ADD KEY (`TemplateTypeId`);


--
-- Indexes for table `bca_invstatus`
--
-- ALTER TABLE `bca_invstatus`
--   ADD UNIQUE KEY `InvStatusID` (`InvStatusID`);
-- 
--
-- Indexes for table `bca_itemcategory`
-- changes added foreign key. ItemTypeID can be foreign key
-- changes bca_lineofcreditterm table don't have collumn named by ItemCategoryID
ALTER TABLE `bca_itemcategory`
--   ADD FOREIGN KEY (`ItemCategoryID`) REFERENCES `bca_lineofcreditterm`(`ItemCategoryID`),
  ADD KEY (`ParentItemCategoryID`);
--
-- Indexes for table `bca_iteminventory`
-- changes added foreign key. ParentId can be foreign key. ItemTypeID can be foreign key
--
ALTER TABLE `bca_iteminventory`
  ADD UNIQUE KEY (`InventoryID`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category`(`CategoryID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD KEY (`EBayInventoryID`),
  ADD KEY (`InventoryBarCode`),
  ADD KEY (`InvoiceInNum`),
  ADD KEY (`ItemTypeID`),
  ADD KEY (`ParentID`),
  ADD KEY (`POInNum`),
  ADD KEY (`SalesTaxRate`),
  ADD KEY (`SerialNum`),
  ADD KEY (`SMCInventoryID`),
  ADD FOREIGN KEY (`StoreTypeID`) REFERENCES `bca_storetype`(`StoreTypeID`),
  ADD KEY (`taxCode`);


--
-- Indexes for table `bca_jobcategory`
-- changes 46foreign key added. unique key not required
ALTER TABLE `bca_jobcategory`
--   ADD PRIMARY KEY (`JobCategoryID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);


--
-- Indexes for table `bca_label`
--
-- ALTER TABLE `bca_label`
--   ADD PRIMARY KEY (`ID`),
--   ADD UNIQUE KEY `LabelType` (`LabelType`);

--
-- Indexes for table `bca_lineofcreditterm`
-- changes 47 foreign key added
ALTER TABLE `bca_lineofcreditterm`
--   ADD PRIMARY KEY (`CreditTermId`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD KEY (`CreditTermId`);
  
  
--
-- Indexes for table `bca_location`
--
ALTER TABLE `bca_location`
  ADD UNIQUE KEY (`LocationID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);


--
-- Indexes for table `bca_mailtemplate`
--
-- ALTER TABLE `bca_mailtemplate`
--   ADD PRIMARY KEY (`TemplateID`),
--   ADD KEY `TemplateName` (`TemplateName`);


--
-- Indexes for table `bca_masterbalancesheetitem`
--
-- ALTER TABLE `bca_masterbalancesheetitem`
--   ADD PRIMARY KEY (`balancesheetitemID`),
--   ADD KEY `CategoryTypeID` (`CategoryTypeID`);


--
-- Indexes for table `bca_masterclientcategory`
--
-- ALTER TABLE `bca_masterclientcategory`
--   ADD KEY `CVCategoryID` (`CVCategoryID`);


--
-- Indexes for table `bca_mastercreditcardtype`
--
-- ALTER TABLE `bca_mastercreditcardtype`
--   ADD KEY `CCTypeID` (`CCTypeID`);


--
-- Indexes for table `bca_mastercustomergroup`
--
-- ALTER TABLE `bca_mastercustomergroup`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `ID` (`ID`);


--
-- Indexes for table `bca_masteritemcategory`
--
-- ALTER TABLE `bca_masteritemcategory`
--   ADD KEY `ItemCategoryID` (`ItemCategoryID`),
--   ADD KEY `ParentItemCategoryID` (`ParentItemCategoryID`);


--
-- Indexes for table `bca_masterpaymentgateways`
--
-- ALTER TABLE `bca_masterpaymentgateways`
--   ADD PRIMARY KEY (`GatewayID`),
--   ADD KEY `GatewayID` (`GatewayID`);


--
-- Indexes for table `bca_masterpaymenttype`
--
-- ALTER TABLE `bca_masterpaymenttype`
--   ADD KEY `PaymentTypeID` (`PaymentTypeID`);


--
-- Indexes for table `bca_masterreceivedtype`
--
-- ALTER TABLE `bca_masterreceivedtype`
--   ADD KEY `PaymentTypeID` (`PaymentTypeID`);


--
-- Indexes for table `bca_masterrmareason`
--
-- ALTER TABLE `bca_masterrmareason`
--   ADD KEY `rmaReasonID` (`rmaReasonID`);


--
-- Indexes for table `bca_mastershipcarrier`
--
-- ALTER TABLE `bca_mastershipcarrier`
--   ADD KEY `ShipCarrierID` (`ShipCarrierID`);


--
-- Indexes for table `bca_mastershippingcontainer`
--
-- ALTER TABLE `bca_mastershippingcontainer`
--   ADD KEY `ContainerID` (`ContainerID`);


--
-- Indexes for table `bca_mastershippingmailtype`
--
-- ALTER TABLE `bca_mastershippingmailtype`
--   ADD PRIMARY KEY (`MailTypeID`);


--
-- Indexes for table `bca_mastershippingpackagesize`
--
-- ALTER TABLE `bca_mastershippingpackagesize`
--   ADD KEY `PackageSizeID` (`PackageSizeID`);


--
-- Indexes for table `bca_masterstartingmodule`
--
-- ALTER TABLE `bca_masterstartingmodule`
--   ADD PRIMARY KEY (`StartModuleID`),
--   ADD KEY `BusinessTypeID` (`BusinessTypeID`);


--
-- Indexes for table `bca_mastervendorcategory`
--
-- ALTER TABLE `bca_mastervendorcategory`
--   ADD KEY `CVCategoryID` (`CVCategoryID`);


--
-- Indexes for table `bca_message`
--
-- ALTER TABLE `bca_message`
--   ADD UNIQUE KEY `MessageID` (`MessageID`);


--
-- Indexes for table `bca_ordertemplate`
--
-- ALTER TABLE `bca_ordertemplate`
--   ADD PRIMARY KEY (`OrderID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `OrderID` (`OrderID`);


--
-- Indexes for table `bca_payment`
--
-- ALTER TABLE `bca_payment`
--   ADD PRIMARY KEY (`PaymentID`) USING BTREE;


--
-- Indexes for table `bca_payment2invoice`
--
-- ALTER TABLE `bca_payment2invoice`
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `InvoiceID` (`InvoiceID`),
--   ADD KEY `PaymentID` (`PaymentID`);


--
-- Indexes for table `bca_paymentdetail`
--
-- ALTER TABLE `bca_paymentdetail`
--   ADD PRIMARY KEY (`DetailID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `CreditCardID` (`CreditCardID`),
--   ADD KEY `DetailID` (`DetailID`),
--   ADD KEY `GatewayID` (`GatewayID`),
--   ADD KEY `PaymentID` (`PaymentID`);


--
-- Indexes for table `bca_paymenttype`
--
-- ALTER TABLE `bca_paymenttype`
--   ADD UNIQUE KEY `PaymentTypeID` (`PaymentTypeID`),
--   ADD KEY `BankAcctID` (`BankAcctID`),
--   ADD KEY `CCTypeID` (`CCTypeID`);


--
-- Indexes for table `bca_peritempricelevel`
--
-- ALTER TABLE `bca_peritempricelevel`
--   ADD PRIMARY KEY (`ItemPriceID`),
--   ADD KEY `InventoryID` (`InventoryID`),
--   ADD KEY `ItemPriceID` (`ItemPriceID`),
--   ADD KEY `ParentID` (`ParentID`);


--
-- Indexes for table `bca_postyle`
-- changes 48 can be primary key
-- ALTER TABLE `bca_postyle`
--   ADD KEY `POStyleID` (`POStyleID`);
  
  
--
-- Indexes for table `bca_preference`
--
-- ALTER TABLE `bca_preference`
--   ADD KEY `BarcodeID` (`BarcodeID`),
--   ADD KEY `BillingStyleTypeID` (`BillingStyleTypeID`),
--   ADD KEY `PreferenceID` (`PreferenceID`),
--   ADD KEY `CustomerStateID` (`CustomerStateID`),
--   ADD KEY `DefaultPayableAccountID` (`DefaultPayableAccountID`),
--   ADD KEY `DefaultARCategoryID` (`DefaultARCategoryID`),
--   ADD KEY `DefaultBankTransferAccID` (`DefaultBankTransferAccID`),
--   ADD KEY `DefaultCategoryID` (`DefaultCategoryID`),
--   ADD KEY `DefaultCustomerGroupID` (`DefaultCustomerGroupID`),
--   ADD KEY `DefaultCustomerSortID` (`DefaultCustomerSortID`),
--   ADD KEY `DefaultEBayBankID` (`DefaultEBayBankID`),
--   ADD KEY `DefaultEBayOnlineBankID` (`DefaultEBayOnlineBankID`),
--   ADD KEY `DefaultPackingSlipStyleID` (`DefaultPackingSlipStyleID`),
--   ADD KEY `DefaultVendorCategoryID` (`DefaultVendorCategoryID`),
--   ADD KEY `DefaultVendorrSortID` (`DefaultVendorrSortID`),
--   ADD KEY `InvoiceStyleTypeID` (`InvoiceStyleTypeID`),
--   ADD KEY `IsRefundAllowed` (`IsRefundAllowed`),
--   ADD KEY `LineofCreditTermID` (`LineofCreditTermID`),
--   ADD KEY `PackingSlipStyleTypeID` (`PackingSlipStyleTypeID`),
--   ADD KEY `PackingSlipZipcode` (`PackingSlipZipcode`),
--   ADD KEY `POPayMethodID` (`POPayMethodID`),
--   ADD KEY `PORepID` (`PORepID`),
--   ADD KEY `POStyleID` (`POStyleID`),
--   ADD KEY `POStyleTypeID` (`POStyleTypeID`),
--   ADD KEY `POTermID` (`POTermID`),
--   ADD KEY `POViaID` (`POViaID`),
--   ADD KEY `SalesOrderStyleTypeID` (`SalesOrderStyleTypeID`),
--   ADD KEY `SalesPayMethodID` (`SalesPayMethodID`),
--   ADD KEY `VendorStateID` (`VendorStateID`);


--
-- Indexes for table `bca_pricelevel`
--
-- ALTER TABLE `bca_pricelevel`
--   ADD PRIMARY KEY (`PriceLevelID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `PriceLevelID` (`PriceLevelID`);


--
-- Indexes for table `bca_productchannelsetting`
--
-- ALTER TABLE `bca_productchannelsetting`
--   ADD PRIMARY KEY (`ChannelsettingID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `InventoryID` (`InventoryID`),
--   ADD KEY `StoreID` (`StoreID`);


--
-- Indexes for table `bca_quickbooklist`
--
-- ALTER TABLE `bca_quickbooklist`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `customerListID` (`customerListID`),
--   ADD KEY `cvID` (`cvID`),
--   ADD KEY `id` (`id`),
--   ADD KEY `inventoryListID` (`inventoryListID`),
--   ADD KEY `invID` (`invID`);


--
-- Indexes for table `bca_realtimeshippingservice`
--
-- ALTER TABLE `bca_realtimeshippingservice`
--   ADD PRIMARY KEY (`ShippingServiceID`),
--   ADD KEY `ShippingServiceID` (`ShippingServiceID`);


--
-- Indexes for table `bca_recentbills`
--
-- ALTER TABLE `bca_recentbills`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `ClientVendorID` (`ClientVendorID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `ID` (`ID`),
--   ADD KEY `ServiceID` (`ServiceID`);
  
  

--
-- Indexes for table `bca_recurrentpayment` 
-- Starting from here 20230818
-- 7 Foreign key added
-- Confusion about RefPaymentID, TransactionID
-- PlanID, PaymentTypeID not a primary key
--
ALTER TABLE `bca_recurrentpayment`
--   ADD PRIMARY KEY (`PaymentID`),
  ADD KEY (`RefPaymentID`),
  ADD KEY (`TransactionID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
  ADD FOREIGN KEY (`PaymentID`) REFERENCES `bca_payment`(`PaymentID`),
  ADD FOREIGN KEY (`PayeeID`) REFERENCES `bca_account`(`AccountID`),
  ADD FOREIGN KEY (`PayerID`) REFERENCES `bca_account`(`AccountID`),
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`),
  ADD FOREIGN KEY (`PlanID`) REFERENCES `bca_recurrentpaymentplan`(`PlanID`),
  ADD FOREIGN KEY (`ServiceID`) REFERENCES `bca_servicetype`(`ServiceID`);

  

--
-- Indexes for table `bca_recurrentpaymentplan`
-- 5 Foreign key added
-- Confusion about PayeeId, PaymentAccountID
-- PlanID, PaymentTypeID not a primary key
-- change `bca_recurrentpaymentplan`(`PlanID`) not a primary key
--
ALTER TABLE `bca_recurrentpaymentplan`
  ADD KEY (`NumberOfPayments`),
  ADD FOREIGN KEY (`PayeeID`) REFERENCES `bca_account`(`AccountID`),
  ADD FOREIGN KEY (`PaymentAccountID`) REFERENCES `bca_account`(`AccountID`),
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`),
--   ADD FOREIGN KEY (`PlanID`) REFERENCES `bca_recurrentpaymentplan`(`PlanID`),
  ADD FOREIGN KEY (`ServiceID`) REFERENCES `bca_servicetype`(`ServiceID`);


--
-- Indexes for table `bca_refundlist`
-- 7 Foreign key added
-- Confusion about OrderNum 
-- ClientVendorID, PaymentTypeID, InvoiceTypeID, OrderPaymentTypeID, SalesRepID not a primary key
-- change `bca_paymenttype`(`PaymentTypeID`) not a primary key
-- PaymentTypeID type changed to int
--
ALTER TABLE `bca_refundlist`
--   ADD PRIMARY KEY (`RefundID`),
--   ADD UNIQUE KEY `RefundID` (`RefundID`),
--   ADD KEY `OrderNum` (`OrderNum`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES `bca_clientvendor`(`ClientVendorID`), 
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`), 
  ADD FOREIGN KEY (`InvoiceTypeID`) REFERENCES `bca_invoicetype`(`InvoiceTypeID`), 
  ADD FOREIGN KEY (`PaymentID`) REFERENCES `bca_payment`(`PaymentID`), 
	 MODIFY COLUMN `PaymentTypeID` INT,
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`),
  ADD FOREIGN KEY (`OrderPaymentTypeID`) REFERENCES `bca_paymenttype`(`PaymentTypeID`),
  ADD FOREIGN KEY (`SalesRepID`) REFERENCES `bca_salesrep`(`SalesRepID`);


--
-- Indexes for table `bca_refundreason`
-- 1 Foreign key added
--
ALTER TABLE `bca_refundreason`
--   ADD PRIMARY KEY (`ReasonID`),
--   ADD UNIQUE KEY `ReasonID` (`ReasonID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);

--
-- Indexes for table `bca_reportproperty`
-- 1 Foreign key added
--
ALTER TABLE `bca_reportproperty`
--   ADD KEY `ReportType` (`ReportType`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_rmaitem`
-- 2 Foreign key added
-- Faceing problem to find RmaNo, parentReasonID, RmaItemID
-- parentReasonID not a primary key
--
ALTER TABLE `bca_rmaitem`
--   ADD PRIMARY KEY (`RmaUniqueID`),
--   ADD KEY `RmaNo` (`RmaNo`),
--   ADD KEY `RmaItemID` (`RmaItemID`),
--   ADD KEY `RmaUniqueID` (`RmaUniqueID`),
  ADD FOREIGN KEY (`CartID`) REFERENCES bca_cart(`CartID`),
  ADD FOREIGN KEY (`parentReasonID`) REFERENCES bca_masterrmareason (`rmaReasonID`);


--
-- Indexes for table `bca_rmamaster`
-- 3 Foreign key added
-- ClientVendorID not a primary key
--
ALTER TABLE `bca_rmamaster`
--   ADD PRIMARY KEY (`RmaID`),
--   ADD UNIQUE KEY `RmaID` (`RmaID`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`), 
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`), 
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES bca_invoice(`InvoiceID`);


--
-- Indexes for table `bca_rmareason`
-- 2 Foreign key added
-- parentReasonID not a primary key
-- 
ALTER TABLE `bca_rmareason`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`parentReasonID`) REFERENCES bca_masterrmareason (`rmaReasonID`),
  ADD FOREIGN KEY (`ReasonID`) REFERENCES bca_refundreason(`ReasonID`);


--
-- Indexes for table `bca_rule`
-- 1 Foreign key added
--
ALTER TABLE `bca_rule`
--   ADD PRIMARY KEY (`RuleName`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_ruleconditions`
-- 1 Foreign key added
--
ALTER TABLE `bca_ruleconditions`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_salesorder`
-- 2 Foreign key added
-- Faceing problem to find SONum
--
ALTER TABLE `bca_salesorder`
--   ADD KEY `SONum` (`SONum`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`), 
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES bca_invoice(`InvoiceID`);


--
-- Indexes for table `bca_salesrep`
--
-- ALTER TABLE `bca_salesrep`
--   ADD UNIQUE KEY `SalesRepID` (`SalesRepID`);


--
-- Indexes for table `bca_salessummary`
-- 1 Foreign key added
-- CompanyID type changed to int
--
ALTER TABLE `bca_salessummary`
--   ADD PRIMARY KEY (`SalesID`),
--   ADD KEY `SalesID` (`SalesID`),
 MODIFY COLUMN `CompanyID` INT,
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);


--
-- Indexes for table `bca_salessummarydetail`
-- 1 Foreign key added
--
ALTER TABLE `bca_salessummarydetail`
--   ADD PRIMARY KEY (`Id`),
--   ADD KEY `Id` (`Id`),
  ADD FOREIGN KEY (`SalesID`) REFERENCES bca_salessummary(`SalesID`);


--
-- Indexes for table `bca_salestax`
-- 1 Foreign key added
--
ALTER TABLE `bca_salestax`
--   ADD UNIQUE KEY `SalesTaxID` (`SalesTaxID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_scheduletimes`
-- 2 Foreign key added
--
ALTER TABLE `bca_scheduletimes`
--   ADD KEY `ScheduleTime` (`ScheduleTime`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES bca_store(`StoreID`);


--
-- Indexes for table `bca_servicetype`
-- 3 Foreign key added
-- InventoryID, InvoiceStyleID not a primary key
--
ALTER TABLE `bca_servicetype`
--   ADD PRIMARY KEY (`ServiceID`),
--   ADD KEY `ServiceID` (`ServiceID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`),
  ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES bca_invoicestyle(`InvoiceStyleID`);
    
  

--
-- Indexes for table `bca_settings`
-- 1 Foreign key added
--
ALTER TABLE `bca_settings`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_shipcarrier`
-- 1 Foreign key added
-- Confusion about ParentID
--
ALTER TABLE `bca_shipcarrier`
--   ADD UNIQUE KEY `ShipCarrierID` (`ShipCarrierID`),
--   ADD KEY `ParentID` (`ParentID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_shippingaddress`
-- 2 Foreign key added
-- ClientVendorID, ZipCode not a primary key
--
ALTER TABLE `bca_shippingaddress`
--   ADD PRIMARY KEY (`AddressID`),
--   ADD KEY `LastName` (`LastName`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`);
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `bca_shippingrate`
-- 1 Foreign key added
-- ShipCarrierID not a primary key
--
ALTER TABLE `bca_shippingrate`
--   ADD PRIMARY KEY (`ShippingRateID`),
--   ADD UNIQUE KEY `ShippingRateID` (`ShippingRateID`),
--   ADD KEY `Weight` (`Weight`),
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES bca_shipcarrier(`ShipCarrierID`);


--
-- Indexes for table `bca_shippingservice`
-- 4 Foreign key added
-- ContainerID, PackageSizeID, ShipCarrierID not a primary key
--
ALTER TABLE `bca_shippingservice`
--   ADD PRIMARY KEY (`ShippingServiceID`),
--   ADD KEY `ShippingServiceID` (`ShippingServiceID`),
  ADD FOREIGN KEY (`ContainerID`) REFERENCES bca_mastershippingcontainer(`ContainerID`),
  ADD FOREIGN KEY (`MailTypeID`) REFERENCES bca_mastershippingmailtype(`MailTypeID`),
  ADD FOREIGN KEY (`PackageSizeID`) REFERENCES bca_mastershippingpackagesize(`PackageSizeID`),
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES bca_shipcarrier(`ShipCarrierID`);


--
-- Indexes for table `bca_states`
--
-- ALTER TABLE `bca_states`
--   ADD PRIMARY KEY (`id`) USING BTREE;


--
-- Indexes for table `bca_store`
-- 3 Foreign key added
-- Confusion about amazonMarketPlaceID, amazonMerchantID, eBaychangePaymentStatusID, defaultCategoryID, eBayDeveloperID, smcLoginID
-- bca_storetype, Zipcode not a primary key
-- change city_state_zip(`ZIP_CODE`) not a primary key
-- 
ALTER TABLE `bca_store`
--   ADD PRIMARY KEY (`StoreID`),
--   ADD KEY `amazonAccesKey` (`amazonAccesKey`),
--   ADD KEY `amazonMarketPlaceID` (`amazonMarketPlaceID`),
--   ADD KEY `amazonMerchantID` (`amazonMerchantID`),
--   ADD KEY `amazonSecretKey` (`amazonSecretKey`),
--   ADD KEY `eBaychangePaymentStatusID` (`eBaychangePaymentStatusID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `defaultCategoryID` (`defaultCategoryID`),
--   ADD KEY `eBayApplicationID` (`eBayApplicationID`),
--   ADD KEY `eBayDeveloperID` (`eBayDeveloperID`),
--   ADD KEY `smcLoginID` (`smcLoginID`),
  ADD FOREIGN KEY (`StoreTypeID`) REFERENCES bca_storetype(`StoreTypeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);
--   ADD FOREIGN KEY (`Zipcode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `bca_storetype`
-- 1 Foreign key added
-- zipcode not a primary key
-- change city_state_zip(`ZIP_CODE`) not a primary key
--
-- ALTER TABLE `bca_storetype`
--   ADD KEY `DefaultStoreID` (`DefaultStoreID`),
--   ADD KEY `StoreTypeID` (`StoreTypeID`),
--   ADD FOREIGN KEY (`Zipcode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `bca_template_config`
-- 1 Foreign key added
-- Confusion about baseTemplateId, templateId, templateStyleTypeId, templateTypeId
--
ALTER TABLE `bca_template_config`
--   ADD PRIMARY KEY (`id`),
--   ADD KEY `baseTemplateId` (`baseTemplateId`),
--   ADD KEY `id` (`id`),
--   ADD KEY `templateId` (`templateId`),
--   ADD KEY `templateStyleTypeId` (`templateStyleTypeId`),
--   ADD KEY `templateTypeId` (`templateTypeId`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_term`
--
-- ALTER TABLE `bca_term`
--   ADD UNIQUE KEY `TermID` (`TermID`);


--
-- Indexes for table `bca_title`
--
-- ALTER TABLE `bca_title`
--   ADD PRIMARY KEY (`TitleID`),
--   ADD KEY `TitleID` (`TitleID`);


--
-- Indexes for table `bca_unitofmeasure`
--
-- ALTER TABLE `bca_unitofmeasure`
--   ADD KEY `UnitCategoryID` (`UnitCategoryID`);


--
-- Indexes for table `bca_user`
-- Confusion about LoginID, TaxID
--
-- ALTER TABLE `bca_user`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `ID` (`ID`),
--   ADD KEY `LoginID` (`LoginID`),
--   ADD KEY `TaxID` (`TaxID`);


--
-- Indexes for table `bca_useractivity`
-- 3 Foreign key added 
-- confusion on DataId
--
ALTER TABLE `bca_useractivity`
--   ADD KEY `DataID` (`DataID`),
--   ADD KEY `UserActivityID` (`UserActivityID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES bca_store(`StoreID`),
  ADD FOREIGN KEY (`UserID`) REFERENCES bca_user(`ID`);


--
-- Indexes for table `bca_userdefineshipcarrier`
-- 2 foreign key added
-- Confusion on parentID
-- ShipCarrierID Not primary key 
--
ALTER TABLE `bca_userdefineshipcarrier`
--   ADD KEY `ParentID` (`ParentID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES bca_shipcarrier(`ShipCarrierID`);


--
-- Indexes for table `bca_usergroup`
-- 1 foreign key added
--
ALTER TABLE `bca_usergroup`
--   ADD PRIMARY KEY (`GroupID`),
--   ADD KEY `GroupID` (`GroupID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bca_usermapping`
-- 3 Foreign key added
--
ALTER TABLE `bca_usermapping`
--   ADD PRIMARY KEY (`MappingID`),
--   ADD UNIQUE KEY `MappingID` (`MappingID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`UserGroupID`) REFERENCES bca_usergroup(`GroupID`),
  ADD FOREIGN KEY (`UserID`) REFERENCES bca_user(`ID`);


--
-- Indexes for table `bca_usermodules`
-- Confusion on ParentId
--
-- ALTER TABLE `bca_usermodules`
--   ADD PRIMARY KEY (`ModuleID`),
--   ADD UNIQUE KEY `ModuleID` (`ModuleID`),
--   ADD KEY `ParentID` (`ParentID`);


--
-- Indexes for table `bca_vendorcategory`
-- 1 Foreign key added
-- CVCategoryID not a primary key
--
ALTER TABLE `bca_vendorcategory`
  ADD FOREIGN KEY (`CVCategoryID`) REFERENCES bca_clientcategory(`CVCategoryID`);
  

--
-- Indexes for table `bcp_deductionlist`
-- 1 Foreign key added
--
ALTER TABLE `bcp_deductionlist`
--   ADD PRIMARY KEY (`DeductionListID`),
--   ADD KEY `DeductionListID` (`DeductionListID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bcp_employee`
-- 6 Foreig key added
-- Confusion on EmployeeID, EmployeeTitleID
-- ZipCode not a primary key
-- change city_state_zip(`ZIP_CODE`) not a primary key
-- 
ALTER TABLE `bcp_employee`
--   ADD UNIQUE KEY `EmployeeIndexID` (`EmployeeIndexID`),
--   ADD KEY `EmployeeID` (`EmployeeID`),
--   ADD KEY `EmployeeTitleID` (`EmployeeTitleID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`EmployeeTypeID`) REFERENCES bcp_employeetype(`EmployeeTypeID`),
  ADD FOREIGN KEY (`FilingStatusID`) REFERENCES bcp_filingstatus(`FilingStatusID`),
  ADD FOREIGN KEY (`JobTitleID`) REFERENCES bcp_jobtitle(`JobTitleID`),
  ADD FOREIGN KEY (`PayrollPeriodID`) REFERENCES bcp_payrollperiod(`PayrollPeriodID`);
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES city_state_zip(`ZIP_CODE`);
   


--
-- Indexes for table `bcp_employeetype`
-- 1 Foreign key added
--
ALTER TABLE `bcp_employeetype`
--   ADD PRIMARY KEY (`EmployeeTypeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bcp_fedperallowance`
--
-- ALTER TABLE `bcp_fedperallowance`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `ID` (`ID`),
--   ADD KEY `NumTerm` (`NumTerm`);


--
-- Indexes for table `bcp_fedpermethod`
--
-- ALTER TABLE `bcp_fedpermethod`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `NumTerm` (`NumTerm`);


--
-- Indexes for table `bcp_fedrate`
--
-- ALTER TABLE `bcp_fedrate`
--   ADD PRIMARY KEY (`ID`);


--
-- Indexes for table `bcp_filingstate`
-- 2 Foreign key added 
-- Confusion on FilingStateTaxID
-- FilingStateID not a primary key
-- change bcp_filingstate(`FilingStateID`) not a primary key
--
ALTER TABLE `bcp_filingstate`
--   ADD KEY `FilingStateTaxID` (`FilingStateTaxID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);
--   ADD FOREIGN KEY (`FilingStateID`) REFERENCES bcp_filingstate(`FilingStateID`);


--
-- Indexes for table `bcp_filingstatus`
-- 2 foreign key added
--
ALTER TABLE `bcp_filingstatus`
--   ADD PRIMARY KEY (`FilingStatusID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bcp_income`
-- 4 Foreign key added
-- Confusion on DeductionID, EmployeeID
ALTER TABLE `bcp_income`
--   ADD PRIMARY KEY (`IncomeID`),
--   ADD KEY `DeductionID` (`DeductionID`),
--   ADD KEY `EmployeeID` (`EmployeeID`),
--   ADD KEY `IncomeID` (`IncomeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`EmployeeTypeID`) REFERENCES bcp_employeetype(`EmployeeTypeID`),
  ADD FOREIGN KEY (`IncomeListID`) REFERENCES bcp_incomelist(`IncomeListID`),
  ADD FOREIGN KEY (`PayrollPeriodID`) REFERENCES bcp_payrollperiod(`PayrollPeriodID`);


--
-- Indexes for table `bcp_incomelist`
--
-- ALTER TABLE `bcp_incomelist`
--   ADD PRIMARY KEY (`IncomeListID`),
--   ADD KEY `IncomeList` (`IncomeList`),
--   ADD KEY `IncomeListID` (`IncomeListID`);
  

--
-- Indexes for table `bcp_jobcode`
-- 1 Foreign key added
--
ALTER TABLE `bcp_jobcode`
--   ADD PRIMARY KEY (`JobID`),
--   ADD KEY `JobID` (`JobID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bcp_jobtitle`
-- 1 Foreign key added
--
ALTER TABLE `bcp_jobtitle`
--   ADD PRIMARY KEY (`JobTitleID`),
--   ADD KEY `JobTitleID` (`JobTitleID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bcp_payroll`
-- 1 Foreign key added
-- Confusion on EmployeeID
--
ALTER TABLE `bcp_payroll`
--   ADD PRIMARY KEY (`PayrollDate`,`EmployeeID`),
--   ADD KEY `EmployeeID` (`EmployeeID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bcp_payrollperiod`
-- 1 Foreign key added
--
ALTER TABLE `bcp_payrollperiod`
--   ADD PRIMARY KEY (`PayrollPeriodID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `bcp_stestdedtable`
--
-- ALTER TABLE `bcp_stestdedtable`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `NumAllow` (`NumAllow`),
--   ADD KEY `NumTerm` (`NumTerm`);


--
-- Indexes for table `bcp_stexempdedtable`
--
-- ALTER TABLE `bcp_stexempdedtable`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `NumAllow` (`NumAllow`),
--   ADD KEY `NumTerm` (`NumTerm`);


--
-- Indexes for table `bcp_stlowincomeexemptable`
--
-- ALTER TABLE `bcp_stlowincomeexemptable`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `NumTerm` (`NumTerm`);


--
-- Indexes for table `bcp_ststandarddedtable`
--
-- ALTER TABLE `bcp_ststandarddedtable`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `NumTerm` (`NumTerm`);


--
-- Indexes for table `bcp_sttaxrate`
--
-- ALTER TABLE `bcp_sttaxrate`
--   ADD PRIMARY KEY (`ID`);


--
-- Indexes for table `bcp_stwithholding`
--
-- ALTER TABLE `bcp_stwithholding`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `NumTerm` (`NumTerm`);


--
-- Indexes for table `bcp_tax_company`
--
-- ALTER TABLE `bcp_tax_company`
--   ADD PRIMARY KEY (`CompanyID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `DeductionID` (`DeductionID`);


--
-- Indexes for table `bcp_tax_fica_sdi`
-- Confusion on FID
--
-- ALTER TABLE `bcp_tax_fica_sdi`
--   ADD PRIMARY KEY (`CompanyID`),
--   ADD KEY `CompanyID` (`CompanyID`),
--   ADD KEY `FID` (`FID`),
--   ADD KEY `FITYear` (`FITYear`);


--
-- Indexes for table `bcp_timesheet_time`
-- 2 Foreign key added
-- Confusion on EmployeeID
--
ALTER TABLE `bcp_timesheet_time`
--   ADD KEY `Day` (`Day`),
--   ADD KEY `EmployeeID` (`EmployeeID`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES bca_company(`CompanyId`),
  ADD FOREIGN KEY (`JobID`) REFERENCES bcp_jobcode(`JobID`);


--
-- Indexes for table `bizcal_appoint`
-- 1 Foreign key added
--
ALTER TABLE `bizcal_appoint`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `CompanyID` (`CompanyID`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES bca_company(`CompanyId`);


--
-- Indexes for table `bizcal_reminder`
-- 1 Foreign key added
--
ALTER TABLE `bizcal_reminder`
--   ADD PRIMARY KEY (`ID`),
  ADD FOREIGN KEY (`CompanyId`) REFERENCES bca_company(`CompanyId`);


--
-- Indexes for table `bt_sales`
-- 2 Foreign key added
-- Confusion on BillingAddressID, BuyerID, CCID, ConsignModelID, ConsignorID, DisputeID, eBayID, EmailTemplateID,
--  ListingID, OrgTemplateID, ShippingAddressID, SiteID, StatusID, TransactionID
-- InventoryID not a primary key
--
ALTER TABLE `bt_sales`
--   ADD PRIMARY KEY (`SaleID`),
--   ADD KEY `BillingAddressID` (`BillingAddressID`),
--   ADD KEY `BuyerID` (`BuyerID`),
--   ADD KEY `CCID` (`CCID`),
--   ADD KEY `ConsignModelID` (`ConsignModelID`),
--   ADD KEY `ConsignorID` (`ConsignorID`),
--   ADD KEY `DateLastModified` (`DateLastModified`),
--   ADD KEY `DBToken` (`DBToken`),
--   ADD KEY `DisputeID` (`DisputeID`),
--   ADD KEY `eBayID` (`eBayID`),
--   ADD KEY `EmailTemplateID` (`EmailTemplateID`),
--   ADD KEY `IsArchive` (`IsArchive`),
--   ADD KEY `ListingID` (`ListingID`),
--   ADD KEY `OrgTemplateID` (`OrgTemplateID`),
--   ADD KEY `ShippingAddressID` (`ShippingAddressID`),
--   ADD KEY `SiteID` (`SiteID`),
--   ADD KEY `StatusID` (`StatusID`),
--   ADD KEY `TrackingNum` (`TrackingNum`),
--   ADD KEY `TransactionID` (`TransactionID`),
  ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`),
  ADD FOREIGN KEY (`OrderID`) REFERENCES smc_orders(`OrderID`);
  

--
-- Indexes for table `countries`
--
-- ALTER TABLE `countries`
--   ADD PRIMARY KEY (`CountryID`),
--   ADD KEY `CountryCode` (`CountryCode`);


--
-- Indexes for table `country`
--
-- ALTER TABLE `country`
--   ADD PRIMARY KEY (`CountryID`);


--
-- Indexes for table `crm_lead`
-- 1 Foreign key added
--
ALTER TABLE `crm_lead`
--   ADD PRIMARY KEY (`LeadID`),
--   ADD UNIQUE KEY `LeadID` (`LeadID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `fedexshipinvoice`
-- 1 Foreign key added
-- ZipCode not a primary key
-- change city_state_zip(`ZIP_CODE`) not a primary key
--
-- ALTER TABLE `fedexshipinvoice`
--   ADD PRIMARY KEY (`ID`),
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `galaxyshipinvoice`
-- 1 Foreign key added
-- Confusion on GroupCode
-- ZipCode not a primary key
-- change city_state_zip(`ZIP_CODE`) not a primary key
--
-- ALTER TABLE `galaxyshipinvoice`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `GroupCode` (`GroupCode`),
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `galaxyshippostback`
-- 1 Foreign key added
-- Confusion on GroupCode, TransactionID
-- ZipCode not a primary key
-- change city_state_zip(`ZIP_CODE`) not a primary key
--
-- ALTER TABLE `galaxyshippostback`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `GroupCode` (`GroupCode`),
--   ADD KEY `TransactionID` (`TransactionID`),
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `item_category_details`
--
-- ALTER TABLE `item_category_details`
--   ADD PRIMARY KEY (`CategoryID`),
--   ADD UNIQUE KEY `CategoryName_UNIQUE` (`CategoryName`);


--
-- Indexes for table `item_details`
--
-- ALTER TABLE `item_details`
--   ADD PRIMARY KEY (`ID`);
-- 

--
-- Indexes for table `smc_orders`
-- 1 Foreign key added
-- Confusion on CustomerID, CustomerID, DealerID, OrderID, PayPal_txn_id
--
ALTER TABLE `smc_orders`
--   ADD PRIMARY KEY (`OrderID`),
--   ADD KEY `CustomerID` (`CustomerID`),
--   ADD KEY `DealerID` (`DealerID`),
--   ADD KEY `OrderID` (`OrderID`),
--   ADD KEY `PayPal_txn_id` (`PayPal_txn_id`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);
	
	
--
-- Indexes for table `smd_admin`
-- 1 Foreign key added
-- Confision on MshopMerchantID
--
ALTER TABLE `smd_admin`
--   ADD PRIMARY KEY (`AdminID`),
--   ADD KEY `AdminID` (`AdminID`),
--   ADD KEY `MshopMerchantID` (`MshopMerchantID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `smd_bsaddress`
-- 1 Foreign key added
-- change InvoiceID type changed to int
--
ALTER TABLE `smd_bsaddress`
--   ADD PRIMARY KEY (`BsaID`),
	MODIFY COLUMN  InvoiceID int,
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES bca_invoice(`InvoiceID`);


--
-- Indexes for table `smd_category`
-- 1 Foreign key added
--
ALTER TABLE `smd_category`
--   ADD KEY `smdCategoryID` (`smdCategoryID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES bca_store(`StoreID`);
  

--
-- Indexes for table `smd_cvinfo`
-- 1 Foreign key added
-- Confusion on BillingAddressID, CustomerGroupID, FID, ResellerTaxID, ShippingAddressID
-- ClientVendorID not a primary key
--
ALTER TABLE `smd_cvinfo`
--   ADD KEY `BillingAddressID` (`BillingAddressID`),
--   ADD KEY `CustomerGroupID` (`CustomerGroupID`),
--   ADD KEY `FID` (`FID`),
--   ADD KEY `ResellerTaxID` (`ResellerTaxID`),
--   ADD KEY `ShippingAddressID` (`ShippingAddressID`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`);


--
-- Indexes for table `smd_ebaycategory`
--
-- ALTER TABLE `smd_ebaycategory`
--   ADD KEY `eBayCategoryID` (`eBayCategoryID`),
--   ADD KEY `smdCategoryID` (`smdCategoryID`);


--
-- Indexes for table `smd_gatewaydetails`
-- 1 Foreign key added
--
ALTER TABLE `smd_gatewaydetails`
--   ADD PRIMARY KEY (`GatewayID`),
--   ADD KEY `GatewayID` (`GatewayID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `smd_giftcertificate`
-- 1 Foreign key added
--
ALTER TABLE `smd_giftcertificate`
--   ADD PRIMARY KEY (`gcID`),
   ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);

--
-- Indexes for table `smd_giftcertificateused`
-- 3 Foreign key added
--
ALTER TABLE `smd_giftcertificateused`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`gcID`) REFERENCES smd_giftcertificate(`gcID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES bca_invoice(`InvoiceID`);


--
-- Indexes for table `smd_itemgroupprice`
-- 2 Foreign key added
-- Confusion on CustomerGroupID
-- InventoryID not a primary key
-- bca_iteminventory(`InventoryID`) not a primary key
--
ALTER TABLE `smd_itemgroupprice`
--   ADD KEY `CustomerGroupID` (`CustomerGroupID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);
--   ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`);
-- 

--
-- Indexes for table `smd_itemimage`
-- 2 Foreign key added
-- InventoryID not a primary key
-- bca_iteminventory(`InventoryID`) not a primary key
--
ALTER TABLE `smd_itemimage`
--   ADD PRIMARY KEY (`ItemImageId`),
--   ADD KEY `ItemImageId` (`ItemImageId`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);
--   ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`);
-- 

--
-- Indexes for table `smd_iteminventoryinfo`
-- 2 Foreign key added
-- Confusion on amazon_FeedSubmissionId, DiscountGroupID, eBayItemCode, GiftWrappingID, ItemClassID, MenuID
-- InventoryID not a primary key
--
ALTER TABLE `smd_iteminventoryinfo`
--   ADD KEY `amazon_FeedSubmissionId` (`amazon_FeedSubmissionId`),
--   ADD KEY `DiscountGroupID` (`DiscountGroupID`),
--   ADD KEY `eBayItemCode` (`eBayItemCode`),
--   ADD KEY `GiftWrappingID` (`GiftWrappingID`),
--   ADD KEY `ItemClassID` (`ItemClassID`),
--   ADD KEY `MenuID` (`MenuID`),
  ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`),
  ADD FOREIGN KEY (`ItemImageID`) REFERENCES smd_itemimage(`ItemImageID`);


--
-- Indexes for table `smd_refcountry`
--
-- ALTER TABLE `smd_refcountry`
--   ADD PRIMARY KEY (`CountryID`),
--   ADD KEY `CountryCode` (`CountryCode`);


--
-- Indexes for table `smd_shipdetails`
-- 1 Foreign key added
--
ALTER TABLE `smd_shipdetails`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- Indexes for table `smd_storeebaycategory`
-- 1 Foreign key added
-- Confusion on smdCategoryID
--
ALTER TABLE `smd_storeebaycategory`
--   ADD KEY `smdCategoryID` (`smdCategoryID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES bca_store(`StoreID`);


--
-- Indexes for table `smd_subproduct`
-- Confusion on MasterProductID
--
-- ALTER TABLE `smd_subproduct`
--   ADD PRIMARY KEY (`SubProductID`),
--   ADD KEY `MasterProductID` (`MasterProductID`),
--   ADD KEY `SubProductID` (`SubProductID`);


--
-- Indexes for table `state`
--
-- ALTER TABLE `state`
--   ADD PRIMARY KEY (`StateID`);
-- 

--
-- Indexes for table `storage_billingaddress`
-- 2 Foreign key added
-- ClientVendorID, ZipCode not a primary key
-- city_state_zip(`ZIP_CODE`) not a primary key
--
ALTER TABLE `storage_billingaddress`
--   ADD PRIMARY KEY (`AddressID`),
--   ADD KEY `LastName` (`LastName`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`);
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `storage_cart`
-- 4 Foreign key added
-- confusion on InventoryCode, itempromotionid, ItemTypeID, orderid, OrderItemID, shippromotionid, SupplierID
-- InventoryID not a primary key
-- 
ALTER TABLE `storage_cart`
--   ADD PRIMARY KEY (`CartID`),
--   ADD KEY `InventoryCode` (`InventoryCode`),
--   ADD KEY `itempromotionid` (`itempromotionid`),
--   ADD KEY `ItemTypeID` (`ItemTypeID`),
--   ADD KEY `OrderItemID` (`OrderItemID`),
--   ADD KEY `shippromotionid` (`shippromotionid`),
--   ADD KEY `SupplierID` (`SupplierID`),
--   ADD KEY `SalesTaxRate` (`SalesTaxRate`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES bca_category(`CategoryID`), 
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`),
  ADD FOREIGN KEY (`InvoiceID`) REFERENCES bca_invoice(`InvoiceID`),
	MODIFY COLUMN orderid int,
  ADD FOREIGN KEY (`orderid`) REFERENCES bca_ordertemplate(`orderID`);
  

--
-- Indexes for table `storage_clientvendor`
-- 13 Foreign key added
-- Confusion on BankAccountID, LineofCreditTermID, PayFromID, ReferenceCustomerID, ResellerTaxID, ZipCodeID
-- CCTypeID, CVTypeID, PaymentTypeID, PriceLevelID, SalesRepID not a primary key. 
-- ClientVendorID, CVCategoryID, CVTypeID, PaymentTypeID, SalesRepID, ShipCarrierID, TermID, ZipCode not a primary key
-- change column missing InvoiceID
-- `city_state_zip` (`ZIP_CODE`) not a primary key
--
ALTER TABLE `storage_clientvendor`
--   ADD KEY `BankAccountID` (`BankAccountID`),
--   ADD KEY `CustomerTitleID` (`CustomerTitleID`),
--   ADD KEY `LineofCreditTermID` (`LineofCreditTermID`),
--   ADD KEY `PayFromID` (`PayFromID`),
--   ADD KEY `ReferenceCustomerID` (`ReferenceCustomerID`),
--   ADD KEY `ResellerTaxID` (`ResellerTaxID`),
  ADD FOREIGN KEY (`CCTypeID`) REFERENCES `bca_creditcardtype` (`CCTypeID`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category` (`CategoryID`), 
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES `bca_clientvendor` (`ClientVendorID`), 
  ADD FOREIGN KEY (`CVCategoryID`) REFERENCES `bca_clientcategory` (`CVCategoryID`), 
  ADD FOREIGN KEY (`CVTypeID`) REFERENCES `bca_cvtype` (`CVTypeID`), 
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype` (`PaymentTypeID`), 
  ADD FOREIGN KEY (`PriceLevelID`) REFERENCES `bca_pricelevel` (`PriceLevelID`), 
  ADD FOREIGN KEY (`SalesRepID`) REFERENCES `bca_salesrep` (`SalesRepID`), 
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES `bca_shipcarrier` (`ShipCarrierID`),
  ADD FOREIGN KEY (`TermID`) REFERENCES `bca_term` (`TermID`);
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES `city_state_zip` (`ZIP_CODE`);
--   ADD FOREIGN KEY (`InvoiceID`) REFERENCES `bca_invoice` (`InvoiceID`);
	

--
-- Indexes for table `storage_invoice`
-- 15 Foreign key added
-- Confusion on BankAccountID, BillingAddrID, BSAddressID, dropShipCustomerID, EmployeeID, GiftCertificateCode
-- PONum, RcvNum, ShippingAddrID, SONum, TrackingCode, TransactionID 
-- InvoiceTypeID, ClientVendorID, InvoiceStyleID, MessageID, PaymentTypeID, SalesRepID, SalesTaxID, ShipCarrierID, TermID  not a primary key
-- change orderid type to int
--
ALTER TABLE `storage_invoice`
--   ADD PRIMARY KEY (`InvoiceID`),
--   ADD KEY `BankAccountID` (`BankAccountID`),
--   ADD KEY `BillingAddrID` (`BillingAddrID`),
--   ADD KEY `BSAddressID` (`BSAddressID`),
--   ADD KEY `dropShipCustomerID` (`dropShipCustomerID`),
--   ADD KEY `EmployeeID` (`EmployeeID`),
--   ADD KEY `EstNum` (`EstNum`),
--   ADD KEY `GiftCertificateCode` (`GiftCertificateCode`),
--   ADD KEY `PONum` (`PONum`),
--   ADD KEY `RcvNum` (`RcvNum`),
--   ADD KEY `RefNum` (`RefNum`),
--   ADD KEY `ShippingAddrID` (`ShippingAddrID`),
--   ADD KEY `SONum` (`SONum`),
--   ADD KEY `TrackingCode` (`TrackingCode`),
--   ADD KEY `TransactionID` (`TransactionID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
  ADD FOREIGN KEY (`InvoiceTypeID`) REFERENCES `bca_invoicetype` (`InvoiceTypeID`),
  ADD FOREIGN KEY (`CategoryID`) REFERENCES `bca_category` (`CategoryID`), 
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES `bca_clientvendor` (`ClientVendorID`), 
  ADD FOREIGN KEY (`GatewayID`) REFERENCES `bca_masterpaymentgateways` (`GatewayID`), 
  ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES `bca_invoicestyle` (`InvoiceStyleID`),
  ADD FOREIGN KEY (`MessageID`) REFERENCES `bca_message` (`MessageID`),
	MODIFY COLUMN orderid int,
  ADD FOREIGN KEY (`orderid`) REFERENCES `bca_ordertemplate` (`orderID`), -- Check if the column name and table name are correct
  ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES `bca_paymenttype` (`PaymentTypeID`), 
  ADD FOREIGN KEY (`SalesRepID`) REFERENCES `bca_salesrep` (`SalesRepID`), 
  ADD FOREIGN KEY (`SalesTaxID`) REFERENCES `bca_salestax` (`SalesTaxID`), 
  ADD FOREIGN KEY (`ServiceID`) REFERENCES `bca_servicetype` (`ServiceID`), 
  ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES `bca_shipcarrier` (`ShipCarrierID`),
  ADD FOREIGN KEY (`StoreID`) REFERENCES `bca_store` (`StoreID`),
  ADD FOREIGN KEY (`TermID`) REFERENCES `bca_term` (`TermID`);

	
	
--
-- Indexes for table `storage_payment`
--
-- ALTER TABLE `storage_payment`
--   ADD PRIMARY KEY (`PaymentID`);


--
-- Indexes for table `storage_shippingaddress`
-- 2 Foreign key added
-- ClientVendorID, ZipCode not a primary key
-- city_state_zip(`ZIP_CODE`) not a primary key
--
ALTER TABLE `storage_shippingaddress`
--   ADD PRIMARY KEY (`AddressID`),
--   ADD KEY `LastName` (`LastName`),
  ADD FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`);
--   ADD FOREIGN KEY (`ZipCode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `storage_useractivity`
-- 3 Foreign key added
-- Confusion on DataID,
-- UserActivityID is not a primary key
--
ALTER TABLE `storage_useractivity`
--   ADD KEY `DataID` (`DataID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`UserID`) REFERENCES bca_user(`ID`),
  ADD FOREIGN KEY (`UserActivityID`) REFERENCES bca_useractivity(`UserActivityID`);


--
-- Indexes for table `upsmailinnovation`
-- 1 Foreign key added
-- ZipCode not a primary key
-- city_state_zip(`ZIP_CODE`) not a primary key
--
-- ALTER TABLE `upsmailinnovation`
--   ADD PRIMARY KEY (`ID`),
--   ADD FOREIGN KEY (`Zipcode`) REFERENCES city_state_zip(`ZIP_CODE`);


--
-- Indexes for table `worldshipinvoice`
--
-- ALTER TABLE `worldshipinvoice`
--   ADD KEY `sfZipCode` (`sfZipCode`),
--   ADD KEY `stZipCode` (`stZipCode`);


--
-- Indexes for table `worldshippostdata`
--
-- ALTER TABLE `worldshippostdata`
--   ADD KEY `sfZipCode` (`sfZipCode`),
--   ADD KEY `siIsVOID` (`siIsVOID`),
--   ADD KEY `siShipmentID` (`siShipmentID`),
--   ADD KEY `stZipCode` (`stZipCode`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjustment_reason`
--
ALTER TABLE `adjustment_reason`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


--
-- AUTO_INCREMENT for table `bca_account`
--
ALTER TABLE `bca_account`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62535;


--
-- AUTO_INCREMENT for table `bca_accountable`
--
ALTER TABLE `bca_accountable`
  MODIFY `PayableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;


--
-- AUTO_INCREMENT for table `bca_acctcategory`
--
ALTER TABLE `bca_acctcategory`
  MODIFY `AcctCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


--
-- AUTO_INCREMENT for table `bca_accttype`
--
ALTER TABLE `bca_accttype`
  MODIFY `AcctTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


--
-- AUTO_INCREMENT for table `bca_amazoncategorytemplate`
--
ALTER TABLE `bca_amazoncategorytemplate`
  MODIFY `CategoryTemplateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;


--
-- AUTO_INCREMENT for table `bca_apmemorizedgroup`
--
ALTER TABLE `bca_apmemorizedgroup`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT for table `bca_att1`
--
ALTER TABLE `bca_att1`
  MODIFY `Att1_ID` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT for table `bca_att2`
--
ALTER TABLE `bca_att2`
  MODIFY `Att2_ID` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT for table `bca_balancesheetitem`
--
ALTER TABLE `bca_balancesheetitem`
  MODIFY `balancesheetitemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=733;


--
-- AUTO_INCREMENT for table `bca_bill`
--
ALTER TABLE `bca_bill`
  MODIFY `BillNum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


--
-- AUTO_INCREMENT for table `bca_billdetail`
--
ALTER TABLE `bca_billdetail`
  MODIFY `BillDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;


--
-- AUTO_INCREMENT for table `bca_billingaddress`
--
ALTER TABLE `bca_billingaddress`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1766;


--
-- AUTO_INCREMENT for table `bca_billingstatements`
--
ALTER TABLE `bca_billingstatements`
  MODIFY `StatementNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;


--
-- AUTO_INCREMENT for table `bca_budget`
--
ALTER TABLE `bca_budget`
  MODIFY `BudgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;


--
-- AUTO_INCREMENT for table `bca_budgetcategory`
--
ALTER TABLE `bca_budgetcategory`
  MODIFY `BudgetCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;


--
-- AUTO_INCREMENT for table `bca_budgetdetail`
--
ALTER TABLE `bca_budgetdetail`
  MODIFY `BudgetdetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1167;


--
-- AUTO_INCREMENT for table `bca_businesscategories`
--
ALTER TABLE `bca_businesscategories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2140049317;


--
-- AUTO_INCREMENT for table `bca_businesstype`
-- Ending here 20230818
-- ??
-- Key
--
-- AUTO_INCREMENT for table `bca_businesstype`
--
ALTER TABLE `bca_businesstype`
  MODIFY `BusinessTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


--
-- AUTO_INCREMENT for table `bca_cart`
--
ALTER TABLE `bca_cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


--
-- AUTO_INCREMENT for table `bca_cartmemorized`
--
ALTER TABLE `bca_cartmemorized`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;


--
-- AUTO_INCREMENT for table `bca_category`
--
ALTER TABLE `bca_category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2146773192;


--
-- AUTO_INCREMENT for table `bca_categorytype`
--
ALTER TABLE `bca_categorytype`
  MODIFY `CategoryTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;


--
-- AUTO_INCREMENT for table `bca_cities`
--
ALTER TABLE `bca_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48315;

--
-- AUTO_INCREMENT for table `bca_clientcategory`
--
ALTER TABLE `bca_clientcategory`
  MODIFY `CVCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;


--
-- AUTO_INCREMENT for table `bca_company`
--
ALTER TABLE `bca_company`
  MODIFY `CompanyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;


--
-- AUTO_INCREMENT for table `bca_consignmentsale`
--
ALTER TABLE `bca_consignmentsale`
  MODIFY `ConsignID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


--
-- AUTO_INCREMENT for table `bca_cordinates`
--
ALTER TABLE `bca_cordinates`
  MODIFY `cordinatesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;


--
-- AUTO_INCREMENT for table `bca_countries`
--
ALTER TABLE `bca_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;


--
-- AUTO_INCREMENT for table `bca_currency`
--
ALTER TABLE `bca_currency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


--
-- AUTO_INCREMENT for table `bca_customer_type`
--
ALTER TABLE `bca_customer_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


--
-- AUTO_INCREMENT for table `bca_cvcreditcard`
--
ALTER TABLE `bca_cvcreditcard`
  MODIFY `CreditCardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;


--
-- AUTO_INCREMENT for table `bca_cvtype`
--
ALTER TABLE `bca_cvtype`
  MODIFY `CVTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


--
-- AUTO_INCREMENT for table `bca_exporteditemedetail`
--
ALTER TABLE `bca_exporteditemedetail`
  MODIFY `ExportedProductID` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT for table `bca_footnote`
--
ALTER TABLE `bca_footnote`
  MODIFY `FootNoteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


--
-- AUTO_INCREMENT for table `bca_history`
--
ALTER TABLE `bca_history`
  MODIFY `ImportId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;


--
-- AUTO_INCREMENT for table `bca_inventorysupplierdetail`
--
ALTER TABLE `bca_inventorysupplierdetail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=859;


--
-- AUTO_INCREMENT for table `bca_invoice`
--
ALTER TABLE `bca_invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
	

--
-- AUTO_INCREMENT for table `bca_invoicememorized`
--
ALTER TABLE `bca_invoicememorized`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
	

--
-- AUTO_INCREMENT for table `bca_invoicesalessummaryamt`
--
ALTER TABLE `bca_invoicesalessummaryamt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=769;
	

--
-- AUTO_INCREMENT for table `bca_invoiceshipdetail`
--
ALTER TABLE `bca_invoiceshipdetail`
  MODIFY `ShipDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
	

--
-- AUTO_INCREMENT for table `bca_invoiceshipped`
--
ALTER TABLE `bca_invoiceshipped`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT;
	

--
-- AUTO_INCREMENT for table `bca_invoicestyle`
--
ALTER TABLE `bca_invoicestyle`
  MODIFY `InvoiceStyleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
	

--
-- AUTO_INCREMENT for table `bca_invoice_activetemplates`
--
ALTER TABLE `bca_invoice_activetemplates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;


--
-- AUTO_INCREMENT for table `bca_invstatus`
--
ALTER TABLE `bca_invstatus`
  MODIFY `InvStatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
	

--
-- AUTO_INCREMENT for table `bca_itemcategory`
--
ALTER TABLE `bca_itemcategory`
  MODIFY `ItemCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
	

--
-- AUTO_INCREMENT for table `bca_iteminventory`
--
ALTER TABLE `bca_iteminventory`
  MODIFY `InventoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6885;
	

--
-- AUTO_INCREMENT for table `bca_jobcategory`
--
ALTER TABLE `bca_jobcategory`
  MODIFY `JobCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
	

--
-- AUTO_INCREMENT for table `bca_label`
--
ALTER TABLE `bca_label`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
	

--
-- AUTO_INCREMENT for table `bca_lineofcreditterm`
--
ALTER TABLE `bca_lineofcreditterm`
  MODIFY `CreditTermId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;
	

--
-- AUTO_INCREMENT for table `bca_location`
--
ALTER TABLE `bca_location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;
	

--
-- AUTO_INCREMENT for table `bca_mailtemplate`
--
ALTER TABLE `bca_mailtemplate`
  MODIFY `TemplateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
	

--
-- AUTO_INCREMENT for table `bca_masterbalancesheetitem`
--
ALTER TABLE `bca_masterbalancesheetitem`
  MODIFY `balancesheetitemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
	

--
-- AUTO_INCREMENT for table `bca_mastercustomergroup`
--
ALTER TABLE `bca_mastercustomergroup`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
	

--
-- AUTO_INCREMENT for table `bca_masteritemcategory`
--
ALTER TABLE `bca_masteritemcategory`
  MODIFY `ItemCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
	

--
-- AUTO_INCREMENT for table `bca_masterpaymentgateways`
--
ALTER TABLE `bca_masterpaymentgateways`
  MODIFY `GatewayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
	

--
-- AUTO_INCREMENT for table `bca_mastershippingcontainer`
--
ALTER TABLE `bca_mastershippingcontainer`
  MODIFY `ContainerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
	

--
-- AUTO_INCREMENT for table `bca_mastershippingmailtype`
--
ALTER TABLE `bca_mastershippingmailtype`
  MODIFY `MailTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
	

--
-- AUTO_INCREMENT for table `bca_mastershippingpackagesize`
--
ALTER TABLE `bca_mastershippingpackagesize`
  MODIFY `PackageSizeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
	

--
-- AUTO_INCREMENT for table `bca_masterstartingmodule`
--
ALTER TABLE `bca_masterstartingmodule`
  MODIFY `StartModuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


--
-- AUTO_INCREMENT for table `bca_message`
--
ALTER TABLE `bca_message`
  MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;
	

--
-- AUTO_INCREMENT for table `bca_ordertemplate`
--
ALTER TABLE `bca_ordertemplate`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;
	

-- changes 1 foreign key added
ALTER TABLE `bca_ordertemplate`
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_payment`
--
ALTER TABLE `bca_payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
	

-- CHANGES 7 FOREIGN KEY ADDED
--  CONFUSION PayerID,PayeeID,RmaItemID,CategoryID,TransactionID,
-- AccountCategoryID
ALTER TABLE `bca_payment`
ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES bca_paymenttype(`PaymentTypeID`),
ADD FOREIGN KEY (`AccountID`) REFERENCES bca_account(`AccountID`),
ADD FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`),
ADD FOREIGN KEY (`InvoiceID`) REFERENCES bca_invoice(`InvoiceID`),
ADD FOREIGN KEY (`CategoryID`) REFERENCES bca_category(`CategoryID`),
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
ADD FOREIGN KEY (`PayableID`) REFERENCES bca_accountable(`PayableID`);


--
-- AUTO_INCREMENT for table `bca_paymentdetail`
--
ALTER TABLE `bca_paymentdetail`
  MODIFY `DetailID` int(11) NOT NULL AUTO_INCREMENT;
	

-- CHANGES 4 FOREIGN KEY ADDDED
-- confusion PayPal_txn_id
-- change GatewayID type changed to int
--
ALTER TABLE `bca_paymentdetail`
  ADD FOREIGN KEY (`PaymentID`) REFERENCES `bca_payment` (`PaymentID`),
  ADD FOREIGN KEY (`CreditCardID`) REFERENCES `bca_cvcreditcard` (`CreditCardID`),
  ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company` (`CompanyID`),
	MODIFY COLUMN GatewayID int,
  ADD FOREIGN KEY (`GatewayID`) REFERENCES `bca_masterpaymentgateways` (`GatewayID`);

	
	
--
-- AUTO_INCREMENT for table `bca_paymenttype`
--
ALTER TABLE `bca_paymenttype`
  MODIFY `PaymentTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;
	

  -- CHANGES 2 FOREIGN KEY ADDED
  -- CONFUSION
  -- BankAcctID,CCTypeID
ALTER TABLE `bca_paymenttype`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD FOREIGN KEY (`CCTypeID`) REFERENCES bca_creditcardtype(`CCTypeID`);
	

--
-- AUTO_INCREMENT for table `bca_peritempricelevel`
--
ALTER TABLE `bca_peritempricelevel`
  MODIFY `ItemPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
	

-- CHANGES 1 FOREIGN KEY ADDED
-- CONFUSION PARERNTID
ALTER TABLE `bca_peritempricelevel`
ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`);


--
-- AUTO_INCREMENT for table `bca_preference`
--
ALTER TABLE `bca_preference`
  MODIFY `PreferenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
	
	

--  CHANGES 8 FOREIGN KEY ADDED
-- CONFUSION WeightID,LabelSizeID,CustomerCountryID,BackupPeriodID,CustomerStateID,InvoiceFootnoteID,
-- VendorStateID,POFootnoteID,EmployeeStateID,EmployeeCountryID,BarcodeID,SalesViaID,SalesPayMethodID,DefaultAmazonSellerBankID,DefaultAmazonSellerOnlineBankID
-- DefaultAmazonMarketBankID,DefaultHalfdotComBankID,DefaultEBayBankID,DefaultEBayOnlineBankID,DefaultSMCBankID
-- ALTER TABLE `bca_preference`
-- ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
-- ADD FOREIGN KEY(`CurrencyID`) REFERENCES bca_currency(`CurrencyID`),
-- ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES bca_invoicestyle(`InvoiceStyleID`),
-- ADD FOREIGN KEY (`POStyleID`) REFERENCES bca_postyle(`POStyleID`),
-- ADD FOREIGN KEY(`SalesRepID`) REFERENCES (`SalesRepID`),
-- ADD FOREIGN KEY (`LocationID`) REFERENCES bca_location(`LocationID`),
-- ADD FOREIGN KEY (`CVCategoryID`) REFERENCES bca_vendorcategory(`CVCategoryID`),
-- ADD FOREIGN KEY(`SalesTaxID`) REFERENCES bca_salestax(`SalesTaxID`);



--
-- AUTO_INCREMENT for table `bca_pricelevel`
--
ALTER TABLE `bca_pricelevel`
  MODIFY `PriceLevelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=469;


-- CHANGES 1 FOREIGN KEY ADDED
ALTER TABLE `bca_pricelevel`
	ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_productchannelsetting`
--
ALTER TABLE `bca_productchannelsetting`
  MODIFY `ChannelsettingID` int(11) NOT NULL AUTO_INCREMENT;


-- CHANGES 3 FOREIGN KEY ADDED
--
ALTER TABLE `bca_productchannelsetting`
ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`),
ADD FOREIGN KEY (`StoreID`) REFERENCES bca_store(`StoreID`),
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_quickbooklist`
--
ALTER TABLE `bca_quickbooklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


-- CHANGES 1 FOREIGN KEY ADDED
-- CONFUSION customerListID,cvID,inventoryListID,invID

ALTER TABLE `bca_quickbooklist`
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_realtimeshippingservice`
--
ALTER TABLE `bca_realtimeshippingservice`
  MODIFY `ShippingServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;


--
-- AUTO_INCREMENT for table `bca_recentbills`
--
ALTER TABLE `bca_recentbills`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


-- CHANGES 3 FOREIGN KEY ADDED
-- CONFUSION RecentBillID
ALTER TABLE `bca_recentbills` 
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
ADD  FOREIGN KEY(`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`),
ADD FOREIGN KEY(`ServiceID`) REFERENCES bca_servicetype(`ServiceID`);


--
-- AUTO_INCREMENT for table `bca_recurrentpayment`
--
ALTER TABLE `bca_recurrentpayment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1019;


-- CHANGES 4 FOREIGN KEY ADDED
-- CONFUSION PAYERID,TransactionID,RefPaymentID
ALTER TABLE `bca_recurrentpayment`
ADD  FOREIGN KEY (`PaymentTypeID`) REFERENCES bca_paymenttype(`PaymentTypeID`),
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`),
ADD FOREIGN KEY(`PlanID`) REFERENCES bca_recurrentpaymentplan(`PlanID`),
ADD FOREIGN KEY(`ServiceID`) REFERENCES bca_servicetype(`ServiceID`);


--
-- AUTO_INCREMENT for table `bca_refundlist`
--
ALTER TABLE `bca_refundlist`
  MODIFY `RefundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
	

-- changes foreign key added -26
-- -confused with RefundReasonID,OrderPaymentTypeID
ALTER TABLE `bca_refundlist`
ADD  FOREIGN KEY (`PaymentTypeID`) REFERENCES bca_paymenttype(`PaymentTypeID`),
ADD  FOREIGN KEY(`SalesRepID`) REFERENCES bca_salesrep(`SalesRepID`),
ADD  FOREIGN KEY(`PaymentID`) REFERENCES bca_payment(`PaymentID`),
ADD  FOREIGN KEY(`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`),
ADD  FOREIGN KEY (`InvoiceTypeID`) REFERENCES bca_invoicetype(`InvoiceTypeID`),
ADD  FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_refundreason`
--
ALTER TABLE `bca_refundreason`
  MODIFY `ReasonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
  
	
-- changes added foreign key -25
-- confused with CompanyID
ALTER TABLE `bca_refundreason`
ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_rmaitem`
--
ALTER TABLE `bca_rmaitem`
  MODIFY `RmaUniqueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
	

-- changes added foreign key -24
ALTER TABLE `bca_rmaitem`
ADD  FOREIGN KEY(`CartID`) REFERENCES bca_cart(`CartID`),
ADD  FOREIGN KEY(`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`);


--
-- AUTO_INCREMENT for table `bca_rmamaster`
--
ALTER TABLE `bca_rmamaster`
  MODIFY `RmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
	

-- changes 4 foreign key add-23
-- confused with ClientVendorID ,InvoiceID,CompanyID
ALTER TABLE `bca_rmamaster`
ADD  FOREIGN KEY (`InvoiceTypeID`) REFERENCES bca_invoicetype(`InvoiceTypeID`),
ADD  FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`),
ADD  FOREIGN KEY (`InvoiceID`) REFERENCES bca_invoice(`InvoiceID`),
ADD  FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_rmareason`
--
ALTER TABLE `bca_rmareason`
  MODIFY `ReasonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
	

-- changes foreign key added 22
-- -- confused with CompanyID 
ALTER TABLE `bca_rmareason`
ADD  FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_salesrep`
--
ALTER TABLE `bca_salesrep`
  MODIFY `SalesRepID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
	

-- changes foreign key added 21
-- -- confused with CompanyID 
ALTER TABLE `bca_salesrep`
ADD  FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_salessummary`
--
ALTER TABLE `bca_salessummary`
  MODIFY `SalesID` int(11) NOT NULL AUTO_INCREMENT;


  -- changes foreign key added -20
-- confused with CompanyID 
ALTER TABLE `bca_salessummary`
ADD  FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_salessummarydetail`
--
ALTER TABLE `bca_salessummarydetail`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;


-- changes 1  Foreign key added -19
  ALTER TABLE `bca_salessummarydetail`
  ADD  FOREIGN KEY(`SalesID`) REFERENCES bca_salessummary(`SalesID`);


--
-- AUTO_INCREMENT for table `bca_salestax`
--
ALTER TABLE `bca_salestax`
  MODIFY `SalesTaxID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;


-- Changes 1 foreign key addd
  ALTER TABLE `bca_salestax`
  ADD  FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_servicetype`
--
ALTER TABLE `bca_servicetype`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
	

-- Changes 3 foreign key addd-17
-- confused with foreignkey inventoryID and CompanyID
ALTER TABLE `bca_servicetype`
ADD  FOREIGN KEY(`InvoiceStyleID`) REFERENCES bca_invoicestyle(`InvoiceStyleID`),
ADD  FOREIGN KEY(`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`),
ADD  FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_shipcarrier`
--
ALTER TABLE `bca_shipcarrier`
  MODIFY `ShipCarrierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=899;


-- Changes ForeignKey added -16
-- confused parentID
ALTER TABLE `bca_shipcarrier`
ADD  FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_shippingaddress`
--
ALTER TABLE `bca_shippingaddress`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1585;
	

-- Changes ForeignKey added -15
 -- confused which table to choose ClientVendorID for foreign key
ALTER TABLE `bca_shippingaddress`
ADD  FOREIGN KEY (`ClientVendorID`) REFERENCES bca_clientvendor(`ClientVendorID`);


--
-- AUTO_INCREMENT for table `bca_shippingrate`
--
ALTER TABLE `bca_shippingrate`
  MODIFY `ShippingRateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2185;
	

-- changes FOREIGN KEY ADDED -14
-- CONFUSED  WITH ShipCarrierID 
ALTER TABLE `bca_shippingrate`
ADD FOREIGN KEY (`ShipCarrierID`) REFERENCES bca_shipcarrier(`ShipCarrierID`);


--
-- AUTO_INCREMENT for table `bca_shippingservice`
--
ALTER TABLE `bca_shippingservice`
  MODIFY `ShippingServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


-- changes FOREIGN KEY ADDED -13
-- CONFUSED  WITH ShipCarrierID 
ALTER TABLE `bca_shippingservice`
ADD  FOREIGN KEY (`ContainerID`) REFERENCES bca_mastershippingcontainer(`ContainerID`),
ADD  FOREIGN KEY (`MailTypeID`) REFERENCES  bca_mastershippingmailtype(`MailTypeID`),
ADD  FOREIGN KEY (`PackageSizeID`) REFERENCES  bca_mastershippingpackagesize(`PackageSizeID`),
ADD  FOREIGN KEY (`ShipCarrierID`) REFERENCES bca_shipcarrier(`ShipCarrierID`);


--
-- AUTO_INCREMENT for table `bca_states`
--
ALTER TABLE `bca_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4121;

--
-- AUTO_INCREMENT for table `bca_store`
--
ALTER TABLE `bca_store`
  MODIFY `StoreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;


-- CHANGES FOREIGN KEY ADDED -13
-- connfusion eBayDeveloperID,eBayApplicationID,amazonMarketPlaceID
ALTER TABLE `bca_store`
ADD  FOREIGN KEY (`StoreTypeID`) REFERENCES bca_storetype(`StoreTypeID`),
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_template_config`
--
ALTER TABLE `bca_template_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;
	

-- changes 2 add foreig key -12
-- CONFUSION baseTemplateId,templateId,templateStyleTypeId
ALTER TABLE `bca_template_config`
ADD  FOREIGN KEY (`TemplateId`) REFERENCES bca_invoice_template(`TemplateId`),
ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_term`
--
ALTER TABLE `bca_term`
  MODIFY `TermID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;


-- changes 1 foreign key added
ALTER TABLE `bca_term`
ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_title`
--
ALTER TABLE `bca_title`
  MODIFY `TitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;


 -- changes 1 foreign key added
ALTER TABLE `bca_title`
ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_unitofmeasure`
--
ALTER TABLE `bca_unitofmeasure`
  MODIFY `UnitCategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1273;


 -- changes 1 foreign key added
 -- confusion ParentId
ALTER TABLE `bca_unitofmeasure`
ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_user`
--
ALTER TABLE `bca_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;


-- changes 1 foreign key added
ALTER TABLE `bca_user`
ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_useractivity`
--
ALTER TABLE `bca_useractivity`
  MODIFY `UserActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17462;
	

  -- changes 3 foreign key added
ALTER TABLE `bca_useractivity`
  ADD  FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`),
  ADD  FOREIGN KEY(`StoreID`) REFERENCES bca_store(`StoreID`),
  ADD FOREIGN KEY(`UserID`) REFERENCES bca_user(`ID`);


--
-- AUTO_INCREMENT for table `bca_userdefineshipcarrier`
--
ALTER TABLE `bca_userdefineshipcarrier`
  MODIFY `ShipCarrierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;


  -- changes foreign key add
ALTER TABLE `bca_userdefineshipcarrier`
ADD  FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_usergroup`
--
ALTER TABLE `bca_usergroup`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;


-- changes 2 foreign key added
ALTER TABLE `bca_usergroup`
ADD  FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bca_usermapping`
--
ALTER TABLE `bca_usermapping`
  MODIFY `MappingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;


-- changes 2 foreign key added
-- confusion UserGroupID
--
-- ALTER TABLE `bca_usermapping`
-- 	ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`),
-- 	ADD FOREIGN KEY (`UserID`) REFERENCES bca_user(`ID`);


--
-- AUTO_INCREMENT for table `bca_usermodules`
--
ALTER TABLE `bca_usermodules`
  MODIFY `ModuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;


-- CONFUSION PARENTID
--
-- AUTO_INCREMENT for table `bcp_deductionlist`
--
ALTER TABLE `bcp_deductionlist`
  MODIFY `DeductionListID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


-- CHANGES 1 FOREIGN KEY ADDED
ALTER TABLE `bcp_deductionlist`
	ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bcp_employee`
--
ALTER TABLE `bcp_employee`
  MODIFY `EmployeeIndexID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
	

-- CHANGES 5 FOREIGN KEY ADDED
-- CONFUSION EmployeeTitleID,
ALTER TABLE `bcp_employee`
	ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`),
	ADD FOREIGN KEY(`JobTitleID`) REFERENCES bcp_jobtitle(`JobTitleID`),
	ADD FOREIGN KEY(`EmployeeTypeID`) REFERENCES bcp_employeetype(`EmployeeTypeID`),
	ADD FOREIGN KEY(`PayrollPeriodID`) REFERENCES bcp_payrollperiod(`PayrollPeriodID`),
	ADD FOREIGN KEY(`FilingStatusID`) REFERENCES bcp_filingstatus(`FilingStatusID`);


--
-- AUTO_INCREMENT for table `bcp_employeetype`
--
ALTER TABLE `bcp_employeetype`
  MODIFY `EmployeeTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;
	
	

--
-- AUTO_INCREMENT for table `bcp_fedpermethod`
--
ALTER TABLE `bcp_fedpermethod`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
	

--
-- AUTO_INCREMENT for table `bcp_filingstate`
--
ALTER TABLE `bcp_filingstate`
  MODIFY `FilingStateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
	

-- changes 1 foreign added
-- Confusion FilingStateTaxID
ALTER TABLE `bcp_filingstate`
  ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);
	

--
-- AUTO_INCREMENT for table `bcp_income`
--
ALTER TABLE `bcp_income`
  MODIFY `IncomeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
	

-- chages  6 foreign key added
-- CONFUSION DeductionID
ALTER TABLE `bcp_income`
	ADD FOREIGN KEY (`EmployeeID`) REFERENCES bcp_employee(`EmployeeIndexID`),
	ADD FOREIGN KEY(`EmployeeTypeID`) REFERENCES bcp_employeetype(`EmployeeTypeID`),
	ADD FOREIGN KEY (`PayrollPeriodID`) REFERENCES bcp_payrollperiod(`PayrollPeriodID`),
	ADD FOREIGN KEY (`IncomeListID`) REFERENCES bcp_incomelist(`IncomeListID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bcp_incomelist`
--
ALTER TABLE `bcp_incomelist`
  MODIFY `IncomeListID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
	

--
-- AUTO_INCREMENT for table `bcp_jobcode`
--
ALTER TABLE `bcp_jobcode`
  MODIFY `JobID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
	

-- CHANGES 1 FOREIGN KEY ADDED

ALTER TABLE `bcp_jobcode`
ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bcp_jobtitle`
--
ALTER TABLE `bcp_jobtitle`
  MODIFY `JobTitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=390;
	

-- CHANGES 1 FOREIGN KEY ADDED

ALTER TABLE `bcp_jobtitle`
	ADD FOREIGN KEY(`CompanyID`) REFERENCES bca_company(`CompanyID`);


--
-- AUTO_INCREMENT for table `bcp_stestdedtable`
--
ALTER TABLE `bcp_stestdedtable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
	

--
-- AUTO_INCREMENT for table `bcp_stexempdedtable`
--
ALTER TABLE `bcp_stexempdedtable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
	

--
-- AUTO_INCREMENT for table `bcp_stlowincomeexemptable`
--
ALTER TABLE `bcp_stlowincomeexemptable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;
	

--
-- AUTO_INCREMENT for table `bcp_ststandarddedtable`
--
ALTER TABLE `bcp_ststandarddedtable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
	

--
-- AUTO_INCREMENT for table `bcp_stwithholding`
--
ALTER TABLE `bcp_stwithholding`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;
	

--
-- AUTO_INCREMENT for table `bizcal_appoint`
--
ALTER TABLE `bizcal_appoint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
	

--
-- AUTO_INCREMENT for table `bizcal_reminder`
--
ALTER TABLE `bizcal_reminder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
	

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;
	

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
	

--
-- AUTO_INCREMENT for table `crm_lead`
--
ALTER TABLE `crm_lead`
  MODIFY `LeadID` int(11) NOT NULL AUTO_INCREMENT;
	

--
-- AUTO_INCREMENT for table `fedexshipinvoice`
--
ALTER TABLE `fedexshipinvoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;
	

--
-- AUTO_INCREMENT for table `galaxyshipinvoice`
--
ALTER TABLE `galaxyshipinvoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
	

--
-- AUTO_INCREMENT for table `galaxyshippostback`
--
ALTER TABLE `galaxyshippostback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
	

--
-- AUTO_INCREMENT for table `item_category_details`
--
ALTER TABLE `item_category_details`
  MODIFY `CategoryID` bigint(20) NOT NULL AUTO_INCREMENT;
	

-- changes added foreign key -11
-- confused with foreign key CompanyID
ALTER TABLE `item_category_details`
	ADD  FOREIGN KEY (`CompanyID`) REFERENCES bca_company(`CompanyID`);

--
-- AUTO_INCREMENT for table `item_details`
--
ALTER TABLE `item_details`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
	

  -- changes add foreign key -10
  ALTER TABLE `item_details`
  ADD  FOREIGN KEY (`CategoryID`) REFERENCES item_category_details(`CategoryID`);
	

--
-- AUTO_INCREMENT for table `smd_bsaddress`
--
ALTER TABLE `smd_bsaddress`
  MODIFY `BsaID` int(11) NOT NULL AUTO_INCREMENT;
	

-- changes added foreign key -9
 ALTER TABLE `smd_bsaddress`
	 ADD CONSTRAINT smd_ba_invoice_id
	 FOREIGN KEY (`InvoiceID`) REFERENCES storage_invoice (`InvoiceID`); 
 

--
-- AUTO_INCREMENT for table `smd_gatewaydetails`
--
ALTER TABLE `smd_gatewaydetails`
  MODIFY `GatewayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2114;
	

-- changes added foreign key -8
-- confused about companyId
-- ALTER TABLE `smd_gatewaydetails`
-- ADD CONSTRAINT smd_gd_company_id FOREIGN KEY (`companyId`) REFERENCES smd_shipdetails(`companyId`);
--
-- AUTO_INCREMENT for table `smd_itemimage`
-- smd_iteminventoryinfo (`InventoryId`) not a primary key
--
ALTER TABLE `smd_itemimage`
  MODIFY `ItemImageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1449;
	

-- changes added foreign key -7
-- bca_company
-- ALTER TABLE `smd_itemimage`
-- 	ADD FOREIGN KEY (`InventoryId`) REFERENCES smd_iteminventoryinfo (`InventoryId`);


--
-- AUTO_INCREMENT for table `smd_refcountry`
--
ALTER TABLE `smd_refcountry`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
	

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `StateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4014;
	

--
-- AUTO_INCREMENT for table `storage_billingaddress`
--
ALTER TABLE `storage_billingaddress`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1744;
	

-- chages add forign key -6

ALTER TABLE `storage_billingaddress`
	ADD FOREIGN KEY (`ClientVendorID`) REFERENCES storage_clientvendor (`ClientVendorID`);


--
-- AUTO_INCREMENT for table `storage_cart`
--
ALTER TABLE `storage_cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50146;
	

--  changes Add Foreign key - 5
ALTER TABLE `storage_cart`
	ADD FOREIGN KEY (`InventoryID`) REFERENCES bca_iteminventory(`InventoryID`),
	ADD FOREIGN KEY (`InvoiceID`) REFERENCES storage_invoice(`InvoiceID`),
	ADD FOREIGN KEY (`companyId`) REFERENCES bca_company(`companyId`),
	ADD FOREIGN KEY (`CategoryID`) REFERENCES bca_category(`CategoryID`);


--
-- AUTO_INCREMENT for table `storage_invoice`
--
ALTER TABLE `storage_invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
	

-- Changes Added foreign key  -4 
-- bcp_employee
-- bca_bsaddress(`BSAddressID`) not a primary key
ALTER TABLE `storage_invoice`
	ADD FOREIGN KEY (`EmployeeID`) REFERENCES bcp_employee(`EmployeeIndexID`),
	ADD FOREIGN KEY (`ClientVendorID`) REFERENCES storage_clientvendor (`ClientVendorID`),
-- 	ADD FOREIGN KEY (`BSAddressID`) REFERENCES bca_bsaddress(`BSAddressID`),
	ADD FOREIGN KEY (`InvoiceTypeID`) REFERENCES bca_invoicetype(`InvoiceTypeID`),
	ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES bca_invoicestyle(`InvoiceStyleID`),
	ADD FOREIGN KEY (`SalesRepID`) REFERENCES bca_salesrep(`SalesRepID`);


--
-- AUTO_INCREMENT for table `storage_payment`
--
ALTER TABLE `storage_payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
	
	
-- CHANGES FOREIGN KEY -3 ADDED
ALTER TABLE `storage_payment`
	ADD FOREIGN KEY (`PaymentTypeID`) REFERENCES bca_paymenttype(`PaymentTypeID`),
	ADD FOREIGN KEY (`ClientVendorID`) REFERENCES storage_clientvendor (`ClientVendorID`);


--
-- AUTO_INCREMENT for table `storage_shippingaddress`
--
ALTER TABLE `storage_shippingaddress`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1564;


-- CHANGES FOREIGN KEY ADDED 2
ALTER TABLE `storage_shippingaddress`
	ADD FOREIGN KEY (`ClientVendorID`) REFERENCES storage_clientvendor (`ClientVendorID`);


--
-- AUTO_INCREMENT for table `storage_useractivity`
--
ALTER TABLE `storage_useractivity`
  MODIFY `UserActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17460;
	

-- CHANGES FOREIGN KEY ADDED 1--
ALTER TABLE `storage_useractivity`
ADD FOREIGN KEY (`UserID`) REFERENCES bca_user (`ID`);


-- Final alter SQLs

ALTER TABLE `bca_clientvendorjob`
ADD FOREIGN KEY (`ClientVendorID`) REFERENCES `bca_clientvendor`(`ClientVendorID`);

ALTER TABLE `bca_cvcreditcard`
ADD FOREIGN KEY (`ClientVendorID`) REFERENCES `bca_clientvendor`(`ClientVendorID`);

ALTER TABLE `bca_customer_type`
	ADD KEY `ID` (`ID`),
	ADD KEY `CompanyID` (`CompanyID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);

ALTER TABLE `bca_currency`
	ADD KEY `CompanyID` (`CompanyID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);	

ALTER TABLE `bca_footnote`
	ADD KEY `CompanyID` (`CompanyID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);

ALTER TABLE `bca_clientcategory`
	ADD KEY `CompanyID` (`CompanyID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);
	
ALTER TABLE `bca_vendorcategory`
	ADD KEY `CompanyID` (`CompanyID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);	

ALTER TABLE `bca_invstatus`
	ADD KEY `CompanyID` (`CompanyID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);
	
ALTER TABLE `bcp_tax_company`
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);	
	
	

ALTER TABLE `bca_inventoryunitmeasure`
	ADD KEY `CompanyID` (`CompanyID`),
	ADD KEY `InventoryID` (`InventoryID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
	ADD FOREIGN KEY (`InventoryID`) REFERENCES `bca_iteminventory`(`InventoryID`);	

ALTER TABLE `bca_receicedtype`
	ADD KEY `CompanyID` (`CompanyID`),
	ADD KEY `PaymentTypeID` (`PaymentTypeID`),
	ADD KEY `CCTypeID` (`CCTypeID`),
	ADD KEY `BankAcctID` (`BankAcctID`),
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`);

ALTER TABLE `bca_states`
	ADD KEY `country_id` (`country_id`),
	ADD FOREIGN KEY (`country_id`) REFERENCES `bca_countries`(`id`);

ALTER TABLE `bca_cities`
	ADD KEY `state_id` (`state_id`),
	ADD FOREIGN KEY (`state_id`) REFERENCES `bca_states`(`id`);

ALTER TABLE `bca_preference`
	ADD FOREIGN KEY (`CompanyID`) REFERENCES `bca_company`(`CompanyID`),
	ADD FOREIGN KEY (`CustomerCountryID`) REFERENCES `bca_countries`(`id`),
	ADD FOREIGN KEY (`CustomerStateID`) REFERENCES `bca_states`(`id`),
	ADD FOREIGN KEY (`InvoiceStyleID`) REFERENCES `bca_invoicestyle`(`InvoiceStyleID`),
	ADD FOREIGN KEY (`VendorCountryID`) REFERENCES `bca_countries`(`id`),
	ADD FOREIGN KEY (`VendorStateID`) REFERENCES `bca_states`(`id`),
	ADD FOREIGN KEY (`POStyleID`) REFERENCES `bca_postyle`(`POStyleID`),
	ADD FOREIGN KEY (`EmployeeCountryID`) REFERENCES `bca_countries`(`id`),
	ADD FOREIGN KEY (`EmployeeStateID`) REFERENCES `bca_states`(`id`),
	ADD FOREIGN KEY (`SalesTaxID`) REFERENCES `bca_salestax`(`SalesTaxID`);	
--
-- AUTO_INCREMENT for table `upsmailinnovation`
--
ALTER TABLE `upsmailinnovation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
  
 
  
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

