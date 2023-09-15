<%@ page import="com.avibha.bizcomposer.sales.forms.CustomerDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<label for="customerId" class="form-label">Customer :</label>
<select id="customerId" class="form-control">
    <option value="">Choose Option</option>
    <%
        List<CustomerDto> customerList = (ArrayList<CustomerDto>) request.getAttribute("customerList");
        if (customerList.size() == 0) {
            return;
        }
    %>
    <% for (CustomerDto customerDto : customerList) { %>
    <option value="<%= customerDto.getClientVendorID() %>"><%= customerDto.getCname() %>
    </option>
    <% } %>
</select>
<button type="button" class="btn btn-lg customer-refresh" data-toggle="tooltip"
        data-placement="top" title="Refresh">
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
         xmlns="http://www.w3.org/2000/svg">
        <g clip-path="url(#clip0_80_355)">
            <path d="M0.666504 13.3333V9.33333H4.6665" stroke="#E8AE00" stroke-width="1.5"
                  stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M15.3335 2.66667V6.66667H11.3335" stroke="#E8AE00" stroke-width="1.5"
                  stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M2.33984 5.99999C2.67795 5.04452 3.25259 4.19026 4.01015 3.51694C4.7677 2.84362 5.68348 2.37317 6.67203 2.1495C7.66058 1.92583 8.68967 1.95622 9.6633 2.23784C10.6369 2.51947 11.5233 3.04314 12.2398 3.75999L15.3332 6.66666M0.666504 9.33333L3.75984 12.24C4.47634 12.9569 5.36275 13.4805 6.33638 13.7621C7.31 14.0438 8.3391 14.0742 9.32765 13.8505C10.3162 13.6268 11.232 13.1564 11.9895 12.483C12.7471 11.8097 13.3217 10.9555 13.6598 9.99999"
                  stroke="#E8AE00" stroke-width="1.5" stroke-linecap="round"
                  stroke-linejoin="round"/>
        </g>
        <defs>
            <clipPath id="clip0_80_355">
                <rect width="16" height="16" fill="white"/>
            </clipPath>
        </defs>
    </svg>
</button>