package com.avibha.bizcomposer.sales.dto;

public class SavePrintResponse {
    private boolean status;
    private String invoiceId;

    public SavePrintResponse() {
    }

    public SavePrintResponse(boolean status, String invoiceId) {
        this.status = status;
        this.invoiceId = invoiceId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }
}
