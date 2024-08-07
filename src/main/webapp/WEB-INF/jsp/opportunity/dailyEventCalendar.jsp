<%@ page language="java" contentType="text/html; "
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Event Calendar</title>


<script src="/dist/js/index.global.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- JS for jQuery  JS for full calender -->
<!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>


-->

<meta charset='utf-8' />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
	

	</script>




<script type="text/javascript">
var allevents= new Array();

document.addEventListener('DOMContentLoaded', function()
		{

	 var size = document.getElementById("eventListSize").value;
	   
	 display_events();
	 
	
	 
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
    	  left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek,listMonth'
        
      },
      buttonText:
      {
      today: 'Today',
     // month: 'Month',
     // week: 'Week',
      day: 'Day'
     
      },
      
    
      views: {
          listMonth: { buttonText: 'List Month' },
          listWeek: { buttonText: 'List Week' },
          
        },
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      displayEventTime:true,
      displayEventEnd:true,
      showNonCurrentDates:false,
      eventTimeFormat:
      {
    	  hour: 'numeric',
    	  minute: '2-digit',
    	  meridiem: 'short'
    	},
    	/*
    	eventMouseEnter:function(arg)
    	{
    		document.getElementById('eName').innerHTML =arg.event.title ;
    		// document.getElementById("eStart").innerHTML=arg.event.start;
    		 //document.getElementById("eEnd").innerHTML=arg.event.end;
    		 document.getElementById("eMemo").innerHTML=arg.event.extendedProps.description;
    	$('#event_popup').modal('toggle');
    	},
    	eventMouseLeave:function(arg)
    	{
    		$('#event_popup').modal('hide');
    	},
    	*/
    	    
    	
    	    
      eventClick: function(arg,info)
      {

    	
    	  
       
        	  let  startDateTime,endDateTime;
        	 
        	 document.getElementById("event_id").value=arg.event.id;
        	 document.getElementById("event_name").value=arg.event.title;
        	 document.getElementById("event_memo").value=arg.event.extendedProps.description;
          
        if(arg.event.start!=null)
        	{
       startDateTime=arg.event.start.getFullYear()+"-"+(arg.event.start.getMonth()+1).AddZero()+"-"+arg.event.start.getDate().AddZero()
       +"T"+arg.event.start.getHours().AddZero()+":"+arg.event.start.getMinutes().AddZero();
        	} 
        if(arg.event.end!=null)
        	{
        
       endDateTime=arg.event.end.getFullYear()+"-"+(arg.event.end.getMonth()+1).AddZero()+"-"+arg.event.end.getDate().AddZero()
       +"T"+arg.event.end.getHours().AddZero()+":"+arg.event.end.getMinutes().AddZero();
    	  
        	}
    
        	 document.getElementById("event_start_date").value=startDateTime;
      	
        	 if(arg.event.end==null)
        	 document.getElementById("event_end_date").value=startDateTime;
        	 else
        		 document.getElementById("event_end_date").value=endDateTime;
       
        	  $('#event_entry_modal').modal('toggle');
       
      },
      
    
 
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events:allevents
    });

    
   
 	
    
    calendar.render();
  });

Number.prototype.AddZero= function(b,c){
    var  l= (String(b|| 10).length - String(this).length)+1;
    return l> 0? new Array(l).join(c|| '0')+this : this;
 }

function  display_events()
{

	  var size = document.getElementById("eventListSize").value;
	
    var i;
    for(i=0;i<size;i++)
    {
 	   
	   allevents.push({
		   id:document.getElementById(i+"eventId").value,
           title:document.getElementById(i+"eventName").value,
            start:document.getElementById(i+"eventStartDate").value,
            end:document.getElementById(i+"eventEndDate").value,
            extendedProps: {
            	 description:document.getElementById(i+"eventMemo").value
              },
           
              display:'block',
	          color: '#05A9C5',
            textColor: 'white',
           
            allDay:false
            
        }); 
	   
	   
	}
	  
}


</script>



<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.required:after {
    content:" *";
    color: red;
  }


</style>

</head>
<body>

	<div class="container" style="background: #fffff">

		<div id="calendar" style="background: #f2f3f4 " ></div>

		<div class="modal fade" id="event_entry_modal" tabindex="-1"
			role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-md" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalLabel">
							<spring:message
								code="BzComposer.customer.opportunity.updateEvent" />
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="img-container">

							<div class="row">

								<div class="col-sm-12">

									<div class="form-group">
										 <label for="event_id"> <spring:message code="BzComposer.customer.opportunity.eventId" />
									</label>
									
										<input type="text" name="event_id" id="event_id" class="form-control" readonly="readonly"> 
										 <label
											class="required"  for="event_name"> <spring:message
												code="BzComposer.customer.opportunity.eventName" />
										</label> <input type="text" name="event_name" id="event_name"
											class="form-control" placeholder="Enter your event name" readonly="readonly">
										<label for="event_memo"><spring:message
												code="BzComposer.customer.opportunity.eventMemo" /> </label> <input
											type="text" name="event_memo" id="event_memo"
											class="form-control" placeholder="Enter your event Memo" readonly="readonly">

									</div>
								</div>

							</div>

							<div class="row">
								<div class="col-sm-6">

									<div class="form-group">
										<label class="required"  for="event_start_date"><spring:message
												code="BzComposer.customer.opportunity.eventStartDate" /> </label> <input
											type="datetime-local" name="event_start_date"
											id="event_start_date" required data-parsley-type="date"
											data-parsley-trigger="keyup" class="form-control"
											placeholder="Event start date" readonly="readonly" />
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label class="required"   for="event_end_date"><spring:message
												code="BzComposer.customer.opportunity.eventEndDate" /></label> <input
											type="datetime-local" name="event_end_date"
											id="event_end_date" required data-parsley-type="date"
											data-parsley-trigger="keyup" class="form-control"
											placeholder="Event end date" readonly="readonly" >
									</div>
								</div>

								<div class="col-sm-6">
									<label for="event_assignedTo"><spring:message
											code="BzComposer.customer.opportunity.assignedTo" /> </label> <span
										class="inputHighlighted"><spring:message
											code="BzComposer.CompulsoryField.Validation" /> </span> <select
										name="event_assignedTo" id="event_assignedTo" readonly="readonly">
										<option value="0">
											<spring:message code="BzComposer.ComboBox.Select" />
										</option>
										<option value="1">user</option>
										<!--  
														<options items="${assignedToList}" itemValue="name"
																	itemLabel="name" />
																	-->
									</select>

								</div>


							</div>
						</div>
					</div>
					
					<div class="modal-footer" align="center">
					<button type="button" class="btn btn-secondary"
							     onclick="edit_event()">
							<spring:message code="BzComposer.global.edit" />
				  </button>
						<button type="button" class="btn btn-secondary"
							onclick="update_event()">
							<spring:message code="BzComposer.global.update" />
						</button>
						
						<button type="button" class="btn btn-secondary"
							onclick="cancel_event()">
							<spring:message code="BzComposer.global.cancel" />
						</button>
						</div>
				</div>
			</div>
		</div>



		<div>

			<input type="hidden" name="eventListSize" id="eventListSize"
				value='${eventList.size()}'>
			<c:if test="${not empty eventList}">

				<c:forEach items="${eventList}" var="event" varStatus="loop">

					<input type="hidden" id='${loop.index}eventId'
						value='${event.eventId}' />
					<input type="hidden" id='${loop.index}eventName'
						value='${event.eventName}' />
					<input type="hidden" id='${loop.index}eventMemo'
						value='${event.eventMemo}' />
					<input type="hidden" id='${loop.index}eventStartDate'
						value='${event.eventStartDate}' />
					<input type="hidden" id='${loop.index}eventEndDate'
						value='${event.eventEndDate}' />

				</c:forEach>

			</c:if>
		</div>
	

</div>


	<br>
<div class="modal fade bd-example-modal-sm"   id="event_popup" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
     
  <div class="card text-white bg-info mb-0" style="max-width: 20rem;">
				  <div class="card-header">
				 
				  <label id="eName">Test</label>
				  </div>
  <div class="card-body">
  
   
   <h6 class="card-title">   <b> Event Memo: </b></h6>  <label class="card-text" id="eMemo">Details</label> 
  
     <h6 class="card-title"> <b> Assigned To </b> </h6>  <label  class="card-text" id="eMemo">Emp name</label>
    
  </div>
</div>
     
    </div>
  </div>
</div>

	
</body>


<script>

function edit_event()
{

	document.getElementById('event_name').readOnly = false;
	document.getElementById('event_memo').readOnly = false;
	document.getElementById('event_start_date').readOnly = false;
	document.getElementById('event_end_date').readOnly = false;
	document.getElementById('event_assignedTo').readOnly = false;
	
}
    
   function cancel_event()
   {

	  
	 $('#event_entry_modal').modal('hide');

   }
 

function update_event()
{
var event_id=$("#event_id").val();
var event_name=$("#event_name").val();
var event_start_date=$("#event_start_date").val();
var event_end_date=$("#event_end_date").val();
      
var event_memo=$("#event_memo").val();
if(event_name=="" || event_start_date=="" || event_end_date==""||event_memo=="")
{
alert("Please enter all required details.");
return false;

}

var EventDetail= 
{    "eventId":event_id,
    "eventName":event_name,
    "eventMemo": event_memo,
    "eventStartDate": event_start_date,
    "eventEndDate": event_end_date,
   };
var obj=JSON.stringify(EventDetail);
$.ajax({
		type : "POST",
		url : "opportunityEvent?tabid=update",
	    data :"data=" + obj,
	    success : function(data)
	    {
        
	     $('#event_entry_modal').modal('hide'); 
	    
	     alert("Event updated Successfully !!");
	     
	    	location.reload();
		}
		,
		 error : function(data) 
		 {

			 return showerrordialog();
		}
	});
}
</script>
</html>