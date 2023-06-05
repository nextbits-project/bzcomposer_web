<%
    String iconName = request.getParameter("iconName");
%>

<% if (iconName.equalsIgnoreCase("Software")) { %>
<jsp:include page="icons/software.jsp"/>

<% } else if (iconName.equalsIgnoreCase("Monitor")) { %>
<jsp:include page="icons/monitorIcon.jsp"/>

<% } else if (iconName.equalsIgnoreCase("Dvd")) { %>
<jsp:include page="icons/dvd.jsp"/>

<% } else if (iconName.equalsIgnoreCase("Video Games")) { %>
<jsp:include page="icons/videoGames.jsp" />

<% } else if (iconName.equalsIgnoreCase("Hardware")) { %>
<jsp:include page="icons/hardware.jsp" />

<% } else if (iconName.equalsIgnoreCase("Upfront Deposit")) { %>
<jsp:include page="icons/upfront.jsp" />

<% } else if (iconName.equalsIgnoreCase("Security")) { %>
<jsp:include page="icons/security.jsp" />

<% } else if (iconName.equalsIgnoreCase("Productivity")) { %>
<jsp:include page="icons/productivity.jsp" />

<% } else if (iconName.equalsIgnoreCase("Computer Service")) { %>
<jsp:include page="icons/comService.jsp" />

<% } else if (iconName.equalsIgnoreCase("Recurring Service Billing")) { %>
<jsp:include page="icons/recuring.jsp" />

<% } else { %>
<jsp:include page="icons/unclassified.jsp" />

<% } %>
