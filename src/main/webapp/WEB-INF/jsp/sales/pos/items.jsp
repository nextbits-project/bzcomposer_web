<%@ page import="com.avibha.bizcomposer.sales.dao.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    List<Item> itemList = (ArrayList<Item>) request.getAttribute("itemList");
    if (itemList.size() == 0) {
        out.print("<p>Nothing found</p>");
        return;
    }

    for (Item item : itemList) {
        if (item.getIsCategory() == 1) {
            continue;
        }
%>
<div class="card product-card h-100 item" id="item_<%= item.getInvID() %>"
     item_<%= item.getInvID() %>_name="<%= item.getInventoryName() %>"
     item_<%= item.getInvID() %>_code="<%= item.getInvCode() %>"
     item_<%= item.getInvID() %>_qty="<%= item.getQty() %>"
     item_<%= item.getInvID() %>_price="<%= item.getSalePrice() %>"
>

    <div class="card-body">
        <h5 class="card-title"><%= item.getInventoryName() %>
        </h5>
        <p class="card-text">(<%= item.getInvCode() %>)</p>
    </div>
    <div class="card-footer">
        <p>$<%= item.getSalePrice()%>
        </p>
    </div>
</div>
<% } %>