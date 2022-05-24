<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function() 
{ 
});

$(document).ready(function(){
});

function addNewTemplate()
{
	document.getElementById('selectedTemplateId').value = "";
    document.getElementById('templateName').value = "";
    document.getElementById('templateSubject').value = "";
	document.getElementById("emailText").value = "<<name>>"+'\n'+"<<company name>>"+'\n'+"<<address>>"+'\n'+"<<phonenumber>>";	
}
function setContentData(templateID){
    debugger;
    $.ajax({
    		type: "POST",
         	url:"ConfigurationAjax/SaveConfiguration?tabid=con&templateId="+templateID,
           	data: { emailText : templateID }
       		}).done(function(data){
       		const mailTemplate = JSON.parse(data);
       		document.getElementById('selectedTemplateId').value = mailTemplate.TemplateID;
            document.getElementById('templateName').value = mailTemplate.TemplateName;
            document.getElementById('templateSubject').value = mailTemplate.Subject;
            document.getElementById('emailText').value = mailTemplate.Content;
           	//$(document).find('div#emailTextDiv table').replaceWith($(data).find('div#emailTextDiv').html());
    });
}

function saveTemplate(){
    debugger;
    var selectedTemplateId = document.getElementById('selectedTemplateId').value;
    var templateName = document.getElementById('templateName').value;
    var subject = document.getElementById('templateSubject').value;
    var content = document.getElementById('emailText').value;
    var errorMessage="";
    if(templateName == "" || templateName == null){
        errorMessage = "<h3>Please Enter Template Name</h3>";
    }else if(subject == "" || subject == null){
        errorMessage = "<h3>Please Enter Subject</h3>";
    }
    if(errorMessage !=""){
        document.getElementById("errors").innerHTML = errorMessage;
        return false;
        event.preventDefault();
    }else{
        $.ajax({
                type : "POST",
                url:"ConfigurationAjax/SaveConfiguration?tabid=addNewEmailTemplate",
                data : "selectedTemplateId="+selectedTemplateId+"&templateName="+templateName+"&content="+content+"&subject="+subject,
                success : function(data) {
                    window.location = "/Configuration?tabid=config&&tab=tr2";
                },
                error : function(data) {
                    alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                    return false;
                }
        });
    }
}
function deleteTemplate(){
    var selectedTemplateId = document.getElementById('selectedTemplateId').value;
    if(selectedTemplateId == null && selectedTemplateId == ""){
        alert("Please select template!");
    }else{
    $.ajax({
            type : "POST",
            url:"ConfigurationAjax/SaveConfiguration?tabid=deleteEmailTemplate",
            data : "selectedTemplateId="+selectedTemplateId,
            success : function(data) {
                window.location = "/Configuration?tabid=config&&tab=tr2";
            },
            error : function(data) {
                alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                return false;
            }
    });

    }

}
</script>
<!-- emailSetUp Starts -->
<table class="table-notifications" width="100%">
	<tr>
		<th colspan="3" align="left" style="font-size:12px; padding: 5px;">
			<b><spring:message code="BzComposer.configuration.emailtemplate" /></b>
		</th>
	</tr>
	<tr>
        <td colspan="3" align="center"><div id="errors" style="color: red;"></div></td>
    </tr>
	<tr>
		<td colspan="3" style="font-size:12px;">
			<a href="#" onclick="addNewTemplate();" style="font-size:12px;">
				<spring:message code="BzComposer.configuration.newtemplate"/>
			</a>
			&nbsp;&nbsp;
			<a href="#" onclick="saveTemplate();" style="font-size:12px;">
			<spring:message code="BzComposer.configuration.savetemplate"/>
			</a>
			&nbsp;&nbsp;
			<a href="#" onclick="deleteTemplate();" style="font-size:12px;">
			<spring:message code="BzComposer.configuration.deletetemplate"/>
			</a>
		</td>
	</tr>
	<tr>
		<td style="font-size:12px;">
			<spring:message code="BzComposer.configuration.availabletemplate"/>:
		</td>
		<td colspan="3" align="center" style="font-size:12px;">
			<spring:message code="BzComposer.configuration.templatenote"/>
		</td>
	</tr>
	<tr>
		<td rowspan="4" style="font-size:12px;">
			<select id="selectedTemplateId1"  multiple="multiple" style="height:300px;">
				<c:if test="${not empty mailTemplateDtoArrayList}">
					<c:forEach items="${mailTemplateDtoArrayList}" var="objList1" varStatus="loop">
						<option onclick="setContentData('${objList1.templateID}')" value="${objList1.templateID}">${objList1.templateName}</option>
					</c:forEach>
				</c:if>
			</select>
		</td>
		<td style="font-size:12px;">
			<spring:message code="BzComposer.configuration.templatename"/>* :
		</td>

		<td style="font-size:12px;">
			<input type="text" id="templateName" style="display: block;">
			<%-- <c:if test="${configurationForm.listOfExistingTemplates}"> --%>
				<input type="text" id="txtTemplateName" style="display: none;" value="${objList1.templateName}" readonly="readonly">
			<%-- </c:if> --%>
		</td>
	</tr>
	<tr>
		<td style="font-size:12px;">
			<spring:message code="BzComposer.configuration.subject"/>* :
		</td>
		<td style="font-size:12px;">
			
			<input type="text" id="templateSubject">
			<%-- <c:if test="${configurationForm.listOfExistingTemplates}"> --%>
				<input type="text" id="txtTemplateSubject" style="display: none;" value="${objList1.templateSubject}" readonly="readonly">
			<%-- </c:if> --%>
		</td>
	</tr>
	<tr>
		<td style="font-size:12px;">
			<spring:message code="BzComposer.configuration.emailtext"/> :
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left" style="font-size:12px; padding: 5px;">
			<table>
				<tr>
					<td>
						<div id="emailTextDiv">
						<!-- <input type="text" id="emailText" name="emailText" style="height: 150px; width: 520px;"> -->
							<textarea id="emailText" style="height: 150px;width: 520px;"></textarea>
							<%-- <c:if test="${configurationForm.listOfExistingTemplates}"> --%>
				 			<%-- <input type="text" id="txtTemplateText" style="display: none;" value="${objList1.templateContent}"> --%>
							<textarea id="txtTemplateText" style="display: none;height: 150px;width: 520px;">${objList1.templateContent}</textarea>
							<%-- </c:if> --%>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<input type="hidden" name="selectedTemplateId" id="selectedTemplateId" />
</table>
<!-- emailSetUp Ends -->