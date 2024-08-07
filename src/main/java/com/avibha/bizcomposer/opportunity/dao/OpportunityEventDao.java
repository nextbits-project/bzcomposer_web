package com.avibha.bizcomposer.opportunity.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.opportunity.form.OpportunityEventDto;
import com.nxsol.bzcomposer.company.domain.BcaOpportunity;
import com.nxsol.bzcomposer.company.domain.BcaOpportunityEvent;
import com.nxsol.bzcomposer.company.repos.BcaOpportunityEventRepository;
import com.nxsol.bzcomposer.company.repos.BcaOpportunityRepository;

@Service
public class OpportunityEventDao
{
	
	@Autowired
	private BcaOpportunityEventRepository bcaOpportunityEventRepository;
	
	@Autowired
	private BcaOpportunityRepository bcaOpportunityRepository;
	
	
	public  void saveEvent(HttpServletRequest request)
	{
		JSONObject newObj = new JSONObject();
		try 
		{
			
			String opportunityID=(String)request.getSession().getAttribute("opportunityID");
			newObj = new JSONObject(request.getParameter("data"));
			BcaOpportunityEvent event=new  BcaOpportunityEvent();
			event.setEventName(newObj.getString("eventName"));
			
			 BcaOpportunity opp=bcaOpportunityRepository.findById(Integer.parseInt(opportunityID)).orElse(null);
		    event.setOpportunity(opp);
			event.setEventMemo(newObj.getString("eventMemo"));
			
			 
			 LocalDateTime startdate = LocalDateTime.parse(newObj.getString("eventStartDate"));
			 LocalDateTime Enddate = LocalDateTime.parse(newObj.getString("eventEndDate"));
			
			ZoneOffset offset = ZoneOffset.UTC;
			
			OffsetDateTime sd = startdate.atOffset(offset);
			OffsetDateTime ed = Enddate.atOffset(offset);
			event.setEventStartDate(startdate);
			event.setEventEndDate(Enddate);
			event.setActive(true);
			bcaOpportunityEventRepository.save(event);
		}
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
	}
	
	

	
	public  void deleteEvent(HttpServletRequest request)
	{
		String eventId=request.getParameter("deletedEventId");
		//System.out.println(" ..............................to delete eid="+eventId);
		BcaOpportunityEvent event=bcaOpportunityEventRepository.findById(Integer.parseInt(eventId)).get();
		bcaOpportunityEventRepository.delete(event);
		
	}
	
	
	public  void updateEvent(HttpServletRequest request)
	{
		JSONObject newObj = new JSONObject();
		try 
		{
			
			String opportunityID=(String)request.getSession().getAttribute("opportunityID");
			newObj = new JSONObject(request.getParameter("data"));
			
			BcaOpportunityEvent event=bcaOpportunityEventRepository.findById(Integer.parseInt(newObj.getString("eventId"))).get();
		    event.setEventName(newObj.getString("eventName"));
		   // BcaOpportunity opp=bcaOpportunityRepository.findById(Integer.parseInt(opportunityID)).orElse(null);
		   // event.setOpportunity(opp);
			event.setEventMemo(newObj.getString("eventMemo"));
			 LocalDateTime startdate = LocalDateTime.parse(newObj.getString("eventStartDate"));
			 LocalDateTime Enddate = LocalDateTime.parse(newObj.getString("eventEndDate"));
			ZoneOffset offset = ZoneOffset.UTC;
			OffsetDateTime sd = startdate.atOffset(offset);
			OffsetDateTime ed = Enddate.atOffset(offset);
			event.setEventStartDate(startdate);
			event.setEventEndDate(Enddate);
			event.setActive(true);
			bcaOpportunityEventRepository.save(event);
		}
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
	}
	

	public  void getEventListByOpportunityID(String opportunityID,HttpServletRequest request)
	{
		 BcaOpportunity opportunity=bcaOpportunityRepository.findById(Integer.parseInt(opportunityID)).orElse(null);
		 List<BcaOpportunityEvent> eventList=    bcaOpportunityEventRepository.findByOpportunityAndActive(opportunity, true);
		 
		  
		 List<OpportunityEventDto> etList= new ArrayList<>();
		 
		
		 
		 
		 for (BcaOpportunityEvent bcaOpportunityEvent : eventList)
		 {
			 OpportunityEventDto opportunityEventDto =new OpportunityEventDto();
			 opportunityEventDto.setEventId(bcaOpportunityEvent.getEventId());
			 opportunityEventDto.setEventName(bcaOpportunityEvent.getEventName());
			 opportunityEventDto.setEventMemo(bcaOpportunityEvent.getEventMemo());
			 
			 opportunityEventDto.setEventStartDate(bcaOpportunityEvent.getEventStartDate());
			 opportunityEventDto.setEventEndDate(bcaOpportunityEvent.getEventEndDate());
			 etList.add(opportunityEventDto);
		 }
		 request.setAttribute("eventList", etList);
	}
	
	public  void getEventListByAllOpportunity(HttpServletRequest request)
	{
		 List<OpportunityEventDto> allEventstList= new ArrayList<>();
		 List<BcaOpportunity>opportunityList=bcaOpportunityRepository.findAll();
		
		 for (BcaOpportunity opportunity : opportunityList) 
		 {
			
			 List<BcaOpportunityEvent> eventListPerOpportunity=    bcaOpportunityEventRepository.findByOpportunity(opportunity);
		 		 
		 
				 for (BcaOpportunityEvent bcaOpportunityEvent : eventListPerOpportunity)
				 {
					 OpportunityEventDto opportunityEventDto =new OpportunityEventDto();
					 opportunityEventDto.setEventId(bcaOpportunityEvent.getEventId());
					 opportunityEventDto.setEventName(bcaOpportunityEvent.getEventName());
					 opportunityEventDto.setEventMemo(bcaOpportunityEvent.getEventMemo());
					 opportunityEventDto.setEventStartDate(bcaOpportunityEvent.getEventStartDate());
					 opportunityEventDto.setEventEndDate(bcaOpportunityEvent.getEventEndDate());
					 allEventstList.add(opportunityEventDto);
				 }
		
		 
		 }
		 request.setAttribute("eventList", allEventstList);
	}
	
}
