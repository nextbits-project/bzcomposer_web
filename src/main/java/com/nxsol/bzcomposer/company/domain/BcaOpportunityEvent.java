package com.nxsol.bzcomposer.company.domain;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bca_opportunity_event")
public class BcaOpportunityEvent 
{
	    @Id
	    @Column(name= "EventId", nullable = false, updatable = false)
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer eventId;
	 
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "OpportunityID")
	    private BcaOpportunity opportunity;
	    
	    @Column(name= "EventName")
	    private String eventName;
	    
	    public String getEventMemo() {
			return eventMemo;
		}

		public void setEventMemo(String eventMemo) {
			this.eventMemo = eventMemo;
		}

		@Column(name= "EventMemo")
	    private String eventMemo;
	
	    @Column(name= "EventStartDate")
	    private LocalDateTime eventStartDate;
	    
	    @Column(name= "EventEndDate")
	    private  LocalDateTime  eventEndDate;
	    
	    @Column(name="Active")
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

		public  LocalDateTime getEventStartDate() {
			return eventStartDate;
		}

		public void setEventStartDate( LocalDateTime eventStartDate) {
			this.eventStartDate = eventStartDate;
		}

		public  LocalDateTime getEventEndDate() {
			return eventEndDate;
		}

		public void setEventEndDate( LocalDateTime eventEndDate) {
			this.eventEndDate = eventEndDate;
		}

		public Boolean getActive() {
			return active;
		}
		public void setActive(Boolean active) {
			this.active = active;
		}
}
