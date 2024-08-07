package com.avibha.bizcomposer.opportunity.form;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;

import com.nxsol.bzcomposer.company.domain.BcaOpportunity;

public class OpportunityEventDto
{
	  private Integer eventId;
	  private BcaOpportunity opportunity;
	  private String eventName;
	  private String eventMemo;
	  public String getEventMemo() {
		return eventMemo;
	}
	public void setEventMemo(String eventMemo) {
		this.eventMemo = eventMemo;
	}
	private LocalDateTime eventStartDate;
	  private LocalDateTime eventEndDate;
	  private Boolean active;
	  
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public BcaOpportunity getOpportunity() {
		return opportunity;
	}
	public void setOpportunity(BcaOpportunity opportunity) {
		this.opportunity = opportunity;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public LocalDateTime getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(LocalDateTime eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public LocalDateTime getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(LocalDateTime eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	  
}
