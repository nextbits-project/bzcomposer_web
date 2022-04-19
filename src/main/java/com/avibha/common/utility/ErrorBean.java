/**
 * 
 */
package com.avibha.common.utility;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * @author Maimur
 *
 */
public class ErrorBean {

	private String statusCode;
	private   String errorMessage;
	private  Date date;
	private   String forwardPage;
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getForwardPage() {
		return forwardPage;
	}
	public void setForwardPage(String forwardPage) {
		this.forwardPage = forwardPage;
	}
	
	
}
