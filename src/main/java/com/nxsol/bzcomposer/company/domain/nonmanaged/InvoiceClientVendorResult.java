package com.nxsol.bzcomposer.company.domain.nonmanaged;

import java.time.OffsetDateTime;

import lombok.Data;

@Data
public class InvoiceClientVendorResult {

//	"Select a.InvoiceID,a.OrderNum,a.DateAdded,a.TermID,a.Total,a.Balance,b.Firstname,b.LastName,a.clientvendorId from bca_invoice as a, bca_clientvendor as b"
//			+ " where a.ClientVendorId=b.ClientVendorId and b.Status in ('U','N') and b.Active=1 and a.invoicestatus in (0,2) and a.invoicetypeID in (1,7) and b.deleted=0 and a.CompanyID=?"

	private String invoiceId;
	private String OrderNum;
	private OffsetDateTime DateAdded;
	private String TermID;
	private String total;
	private String Balance;
	private String Firstname;
	private String lastName;
	private String clientVendorId;

}
