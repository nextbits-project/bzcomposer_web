<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="<bean:write name="path" property="pathvalue"/>/scripts/sortable.js"
	type="text/javascript"></script>

<%@ page import="java.util.*"%>
<%@	page
	import="com.avibha.bizcomposer.rma.dao.RMAInfo,java.util.ArrayList"%>
<%String sval = request.getParameter("val");

			if (null != request.getParameter("val")) {

				RMAInfo r = new RMAInfo();
				ArrayList arr = r.searchUserFName((String) request.getSession()
						.getAttribute("CID"), sval);
				request.setAttribute("fnameList", arr);
			}

			%>
			
			<form:select path="fnameList" style="width:100px;">
				<form:options items="${fnameList}" itemValue="value" itemLabel="label" />
            </form:select>
<%-- <logic:present name="fnameList">
			<logic:notEmpty name="fnameList">
				<select name="fnmSelect" size="5" id="fNameVal"
					onchange="setTxtval();" style="width:115px;">
					<logic:iterate name="fnameList" id="fnameListID">
						<option value='<bean:write name="fnameListID" property="fname" />'><bean:write
							name="fnameListID" property="fname" /></option>
					</logic:iterate>
				</select>
			</logic:notEmpty>
		</logic:present> --%>

