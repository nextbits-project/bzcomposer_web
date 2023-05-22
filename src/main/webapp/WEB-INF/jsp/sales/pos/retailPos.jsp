<%@ page import="com.avibha.bizcomposer.sales.forms.CustomerDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.avibha.bizcomposer.sales.dao.Item" %>
<%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custtom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <title>POS</title>
    <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</head>

<body class="d-flex flex-column h-100" data-new-gr-c-s-check-loaded="14.1107.0" data-gr-ext-installed=""
      cz-shortcut-listen="true">
<!-- Loader Start -->
<div class="loader d-none">
    <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>
<!-- Loader End -->

<!-- Nav Start -->
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/Dashboard?tabid=Dashboard"> <i data-feather="chevron-left"></i> POS</a>
    </div>
</nav>
<!-- Nav End -->
<%
    List<CustomerDto> customerList = (ArrayList<CustomerDto>) request.getAttribute("customerList");
    List<Item> categories = (ArrayList<Item>) request.getAttribute("categories");
    List<Item> itemList = (ArrayList<Item>) request.getAttribute("itemList");
%>

<!-- Main Container -->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="column-lef">
                <div class="left-top">
                    <div class="customer-group">
                        <div class="select-user">
                            <label for="customerId" class="form-label">Customer :</label>
                            <select id="customerId" class="form-control">
                                <% for (CustomerDto customerDto : customerList) { %>
                                <option value="<%= customerDto.getClientVendorID() %>"><%= customerDto.getCname() %>
                                </option>
                                <% } %>
                            </select>
                        </div>
                        <button type="button" class="btn btn-secondary add-user-btn">Add User</button>
                    </div>
                    <div class="cart-group">
                        <div class="cart-row cart-header">
                            <div class="th">Product Name</div>
                            <div class="th">Price</div>
                            <div class="th">Quantity</div>
                            <div class="th">Sub Total</div>
                            <div class="th">Action</div>
                        </div>

<%--                        <jsp:include page="cart.jsp" />--%>

                    </div>
                </div>
<%--                <div class="left-bottom">--%>
<%--                    <div class="summary">--%>
<%--                        <div class="summary-group">--%>
<%--                            <div class="summary-item">--%>
<%--                                <div class="summary-title">Items Total</div>--%>
<%--                                <div class="summary-amount">$1200</div>--%>
<%--                            </div>--%>
<%--                            <div class="summary-item">--%>
<%--                                <div class="summary-title">Tax</div>--%>
<%--                                <div class="summary-amount"><span>(7.75%)</span> $1200</div>--%>
<%--                            </div>--%>
<%--                            <div class="summary-item">--%>
<%--                                <div class="summary-title">Discount Amount</div>--%>
<%--                                <input type="number" placeholder="0.0">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="separator"></div>--%>
<%--                        <div class="summary-item total-summary-item">--%>
<%--                            <div class="summary-title">Total</div>--%>
<%--                            <div class="summary-amount">$1200</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="payment summary-item">--%>
<%--                        <div class="payment-title">Payment Method</div>--%>
<%--                        <div class="payment-method">--%>
<%--                            <div class="form-check">--%>

<%--                                <label class="rad-label">--%>
<%--                                    <input type="radio" class="rad-input" name="rad">--%>
<%--                                    <div class="rad-design"></div>--%>
<%--                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <path d="M9.57319 4.102C9.51035 4.03681 9.42372 4 9.33319 4H6.66654C6.576 4 6.48938 4.03681 6.42654 4.102C5.93919 4.60666 1.6665 9.08934 1.6665 11C1.6665 13.7573 4.50785 16 7.99985 16C11.4918 16 14.3332 13.7573 14.3332 11C14.3332 9.08934 10.0605 4.60666 9.57319 4.102Z"--%>
<%--                                              fill="#4CAF50"/>--%>
<%--                                        <path d="M12.2497 0.446C11.6944 -0.182 10.2497 0.642 9.42037 1.2C9.04037 0.66 8.47772 0 7.99972 0C7.52172 0 6.95906 0.66 6.57906 1.2C5.75172 0.641344 4.30437 -0.182656 3.74972 0.446C3.59597 0.623281 3.52344 0.856813 3.54972 1.09C3.65706 2.32466 6.17037 4.36534 6.45637 4.59334C6.51591 4.64113 6.59003 4.667 6.66637 4.66669H9.33303C9.40859 4.66675 9.48194 4.64113 9.54103 4.59403C9.82703 4.36538 12.341 2.32737 12.4477 1.09069C12.475 0.857531 12.4032 0.623625 12.2497 0.446Z"--%>
<%--                                              fill="#4CAF50"/>--%>
<%--                                        <path d="M10.6667 4.66666H5.33334C5.14925 4.66666 5 4.51741 5 4.33331C5 4.14922 5.14925 4 5.33334 4H10.6667C10.8508 4 11 4.14925 11 4.33334C11 4.51744 10.8508 4.66666 10.6667 4.66666Z"--%>
<%--                                              fill="#388E3C"/>--%>
<%--                                        <path d="M7.99988 13.3333C7.20722 13.4116 6.48522 12.8738 6.33322 12.092C6.31776 11.9079 6.45447 11.7461 6.63857 11.7306C6.82266 11.7151 6.98444 11.8519 6.99991 12.036C7.02926 12.384 7.47791 12.6666 7.99991 12.6666C8.54257 12.6666 8.99991 12.3613 8.99991 12C8.99991 11.6746 8.68391 11.4666 8.00591 11.34L7.93326 11.3266C6.85126 11.1266 6.33326 10.6846 6.33326 9.99996C6.43754 9.17833 7.17544 8.58802 7.99991 8.66662C8.79257 8.58834 9.51457 9.12608 9.66657 9.90796C9.68204 10.0921 9.54532 10.2538 9.36122 10.2693C9.17713 10.2848 9.01535 10.1481 8.99988 9.96396C8.97188 9.61596 8.52322 9.3333 7.99988 9.3333C7.45722 9.3333 6.99988 9.63865 6.99988 9.99996C6.99988 10.3253 7.31654 10.5333 7.99522 10.66L8.06857 10.674C9.14857 10.874 9.66857 11.3153 9.66857 12.0006C9.56391 12.8228 8.82488 13.4131 7.99988 13.3333Z"--%>
<%--                                              fill="#FAFAFA"/>--%>
<%--                                        <path d="M7.99985 14C7.81575 14 7.6665 13.8508 7.6665 13.6667V8.33334C7.6665 8.14925 7.81575 8 7.99985 8C8.18394 8 8.33319 8.14925 8.33319 8.33334V13.6667C8.33319 13.8508 8.18394 14 7.99985 14Z"--%>
<%--                                              fill="#FAFAFA"/>--%>
<%--                                    </svg>--%>
<%--                                    <div class="rad-text">Cash</div>--%>
<%--                                </label>--%>

<%--                                <label class="rad-label">--%>
<%--                                    <input type="radio" class="rad-input" name="rad">--%>
<%--                                    <div class="rad-design"></div>--%>
<%--                                    <svg width="26" height="16" viewBox="0 0 26 16" fill="none"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <path d="M9.44507 1.71094H16.445V14.2887H9.44507V1.71094Z" fill="#FF5F00"/>--%>
<%--                                        <path d="M9.88892 7.99999C9.88892 5.44448 11.0889 3.17777 12.9333 1.71107C11.5778 0.644421 9.86675 0 8.00009 0C3.57772 0 0 3.57772 0 7.99999C0 12.4222 3.57772 16 7.99999 16C9.86665 16 11.5777 15.3556 12.9333 14.2888C11.0889 12.8444 9.88892 10.5555 9.88892 7.99999V7.99999Z"--%>
<%--                                              fill="#EB001B"/>--%>
<%--                                        <path d="M25.889 7.99999C25.889 12.4222 22.3112 16 17.889 16C16.0223 16 14.3112 15.3556 12.9557 14.2888C14.8223 12.8222 16.0001 10.5555 16.0001 7.99999C16.0001 5.44448 14.8001 3.17777 12.9557 1.71107C14.3111 0.644421 16.0223 0 17.889 0C22.3112 0 25.8891 3.59999 25.8891 7.99999H25.889Z"--%>
<%--                                              fill="#F79E1B"/>--%>
<%--                                    </svg>--%>
<%--                                    <div class="rad-text">Card</div>--%>
<%--                                </label>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="received-amount d-none">--%>
<%--                        <div class="received">--%>
<%--                            <div class="title">Received Amount:</div>--%>
<%--                            <input type="number" placeholder="$">--%>
<%--                        </div>--%>
<%--                        <div class="change">--%>
<%--                            Change:--%>
<%--                            <span>$100</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
        <div class="col-md-6">
            <div class="column-right">
                <div class="product-group" style="width: 100%;">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search Product By Name/Code"
                           aria-label="Search">

                    <div class="products">
                        <jsp:include page="items.jsp" />
                    </div>
                </div>

                <ul class="category-tab-group">
                    <li class="cate-item"><a class="cate-link active" href="#">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M11.2 15.2V17.6C11.2 18.92 10.1199 20 8.8 20H6.4C5.08008 20 4 18.92 4 17.6V15.2C4 13.8801 5.08008 12.8 6.4 12.8H8.8C10.1199 12.8 11.2 13.8801 11.2 15.2Z"
                                  fill="#6B7280"/>
                            <path d="M11.2 6.4V8.8C11.2 10.1199 10.1199 11.2 8.8 11.2H6.4C5.08008 11.2 4 10.1199 4 8.8V6.4C4 5.08008 5.08008 4 6.4 4H8.8C10.1199 4 11.2 5.08008 11.2 6.4Z"
                                  fill="#6B7280"/>
                            <path d="M19.9998 15.2V17.6C19.9998 18.92 18.9197 20 17.5998 20H15.1998C13.8799 20 12.7998 18.92 12.7998 17.6V15.2C12.7998 13.8801 13.8799 12.8 15.1998 12.8H17.5998C18.9197 12.8 19.9998 13.8801 19.9998 15.2Z"
                                  fill="#6B7280"/>
                            <path d="M19.9998 6.4V8.8C19.9998 10.1199 18.9197 11.2 17.5998 11.2H15.1998C13.8799 11.2 12.7998 10.1199 12.7998 8.8V6.4C12.7998 5.08008 13.8799 4 15.1998 4H17.5998C18.9197 4 19.9998 5.08008 19.9998 6.4Z"
                                  fill="#6B7280"/>
                        </svg>
                        All</a></li>

                    <%--  Category loop started--%>
                    <%
                        for (Item category : categories) {
                    %>

                    <li class="cate-item category" id="category-<%= category.getInvID() %>" >
                        <a class="cate-link" href="#">
                            <jsp:include page="categoryIcons.jsp">
                                <jsp:param name="iconName" value="<%= category.getInvCode() %>"/>
                            </jsp:include>

                            <%= category.getInvCode() %>
                        </a>
                    </li>
                    <%--  ./ Category loop --%>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
</div>


<div class="footer">
    <div class="footer-btn-group">
        <button type="button" data-bs-toggle="modal" data-bs-target="#savePrint" class="btn btn-lg btn-primary"><i
                data-feather="printer"></i> Save & Print
        </button>
        <!-- Modal Start-->
        <div class="modal fade" id="savePrint" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content custom-modal-content">
                    <div class="modal-body custom-modal-body">
                        <svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect width="48" height="48" rx="24" fill="#D1FAE5"/>
                            <path d="M17 25L21 29L31 19" stroke="#059669" stroke-width="2" stroke-linecap="round"
                                  stroke-linejoin="round"/>
                        </svg>
                        <div class="modal-title">Successful</div>
                        <p class="modal-description">Your data was successfully saved and printed</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary w-100" data-bs-dismiss="modal">Done</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal End -->
        <button type="button" class="btn btn-lg btn-secondary"><i data-feather="save"></i>Draft</button>
        <button type="button" class="btn btn-lg btn-danger"><i data-feather="x"></i>Clear All</button>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/style.js"></script>
<script>feather.replace()</script>

</body>
</html>