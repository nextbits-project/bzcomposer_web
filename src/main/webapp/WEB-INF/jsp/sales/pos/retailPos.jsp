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
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <title>POS</title>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
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
    List<Item> categories = (ArrayList<Item>) request.getAttribute("categories");
%>

<!-- Main Container -->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="column-lef">
                <div class="left-top">
                    <div class="customer-group">
                        <div class="select-user">
                            <jsp:include page="customers.jsp" />
                        </div>
                        <a type="button" class="btn btn-secondary add-user-btn" target="_blank"
                           href="/Customer?tabid=Customer">Add Customer</a>
                        <button type="button" class="btn btn-lg clear-cart" data-toggle="tooltip" data-placement="top"
                                title="Refresh">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-cart" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg>
                            Clear
                        </button>
                    </div>
                    <div class="cart-group">
                        <div class="cart-row cart-header">
                            <div class="th">Product Name</div>
                            <div class="th">Price</div>
                            <div class="th">Quantity</div>
                            <div class="th">Sub Total</div>
                            <div class="th">Action</div>
                        </div>
                    </div>
                </div>
                <div class="left-bottom">
                    <div class="summary">
                        <div class="summary-group">
                            <div class="summary-item">
                                <div class="summary-title">Items Total:</div>
                                <div class="summary-amount">$<span id="sub_total">0.00</span></div>
                            </div>
                            <div class="summary-item">
                                <div class="summary-title">Tax:</div>
                                <div class="summary-amount summary-tax"><span>(7.75%)</span> $<span
                                        id="tax_total">0.00</span>
                                </div>
                            </div>
                            <div class="summary-item">
                                <div class="summary-title">Discount Amount:</div>
                                <input type="number" id="discount_amount" placeholder="0.00">
                            </div>
                        </div>
                        <div class="separator"></div>
                        <div class="summary-item total-summary-item">
                            <div class="summary-title">Total</div>
                            <div class="summary-amount">$<span id="grand_total">0.00</span></div>
                        </div>
                    </div>
                    <div class="payment summary-item">
                        <div class="payment-title">Payment Method</div>
                        <div class="payment-method">
                            <div class="form-check custom-form-check">

                                <label class="rad-label">
                                    <input type="radio" class="rad-input payment_method" name="payment_method"
                                           value="cash">
                                    <div class="rad-design"></div>
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path
                                                d="M9.57319 4.102C9.51035 4.03681 9.42372 4 9.33319 4H6.66654C6.576 4 6.48938 4.03681 6.42654 4.102C5.93919 4.60666 1.6665 9.08934 1.6665 11C1.6665 13.7573 4.50785 16 7.99985 16C11.4918 16 14.3332 13.7573 14.3332 11C14.3332 9.08934 10.0605 4.60666 9.57319 4.102Z"
                                                fill="#4CAF50"></path>
                                        <path
                                                d="M12.2497 0.446C11.6944 -0.182 10.2497 0.642 9.42037 1.2C9.04037 0.66 8.47772 0 7.99972 0C7.52172 0 6.95906 0.66 6.57906 1.2C5.75172 0.641344 4.30437 -0.182656 3.74972 0.446C3.59597 0.623281 3.52344 0.856813 3.54972 1.09C3.65706 2.32466 6.17037 4.36534 6.45637 4.59334C6.51591 4.64113 6.59003 4.667 6.66637 4.66669H9.33303C9.40859 4.66675 9.48194 4.64113 9.54103 4.59403C9.82703 4.36538 12.341 2.32737 12.4477 1.09069C12.475 0.857531 12.4032 0.623625 12.2497 0.446Z"
                                                fill="#4CAF50"></path>
                                        <path
                                                d="M10.6667 4.66666H5.33334C5.14925 4.66666 5 4.51741 5 4.33331C5 4.14922 5.14925 4 5.33334 4H10.6667C10.8508 4 11 4.14925 11 4.33334C11 4.51744 10.8508 4.66666 10.6667 4.66666Z"
                                                fill="#388E3C"></path>
                                        <path
                                                d="M7.99988 13.3333C7.20722 13.4116 6.48522 12.8738 6.33322 12.092C6.31776 11.9079 6.45447 11.7461 6.63857 11.7306C6.82266 11.7151 6.98444 11.8519 6.99991 12.036C7.02926 12.384 7.47791 12.6666 7.99991 12.6666C8.54257 12.6666 8.99991 12.3613 8.99991 12C8.99991 11.6746 8.68391 11.4666 8.00591 11.34L7.93326 11.3266C6.85126 11.1266 6.33326 10.6846 6.33326 9.99996C6.43754 9.17833 7.17544 8.58802 7.99991 8.66662C8.79257 8.58834 9.51457 9.12608 9.66657 9.90796C9.68204 10.0921 9.54532 10.2538 9.36122 10.2693C9.17713 10.2848 9.01535 10.1481 8.99988 9.96396C8.97188 9.61596 8.52322 9.3333 7.99988 9.3333C7.45722 9.3333 6.99988 9.63865 6.99988 9.99996C6.99988 10.3253 7.31654 10.5333 7.99522 10.66L8.06857 10.674C9.14857 10.874 9.66857 11.3153 9.66857 12.0006C9.56391 12.8228 8.82488 13.4131 7.99988 13.3333Z"
                                                fill="#FAFAFA"></path>
                                        <path
                                                d="M7.99985 14C7.81575 14 7.6665 13.8508 7.6665 13.6667V8.33334C7.6665 8.14925 7.81575 8 7.99985 8C8.18394 8 8.33319 8.14925 8.33319 8.33334V13.6667C8.33319 13.8508 8.18394 14 7.99985 14Z"
                                                fill="#FAFAFA"></path>
                                    </svg>
                                    <div class="rad-text">Cash</div>
                                </label>

                                <label class="rad-label">
                                    <input type="radio" class="rad-input payment_method" name="payment_method"
                                           value="card">
                                    <div class="rad-design"></div>
                                    <svg width="26" height="16" viewBox="0 0 26 16" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.44507 1.71094H16.445V14.2887H9.44507V1.71094Z" fill="#FF5F00">
                                        </path>
                                        <path
                                                d="M9.88892 7.99999C9.88892 5.44448 11.0889 3.17777 12.9333 1.71107C11.5778 0.644421 9.86675 0 8.00009 0C3.57772 0 0 3.57772 0 7.99999C0 12.4222 3.57772 16 7.99999 16C9.86665 16 11.5777 15.3556 12.9333 14.2888C11.0889 12.8444 9.88892 10.5555 9.88892 7.99999V7.99999Z"
                                                fill="#EB001B"></path>
                                        <path
                                                d="M25.889 7.99999C25.889 12.4222 22.3112 16 17.889 16C16.0223 16 14.3112 15.3556 12.9557 14.2888C14.8223 12.8222 16.0001 10.5555 16.0001 7.99999C16.0001 5.44448 14.8001 3.17777 12.9557 1.71107C14.3111 0.644421 16.0223 0 17.889 0C22.3112 0 25.8891 3.59999 25.8891 7.99999H25.889Z"
                                                fill="#F79E1B"></path>
                                    </svg>
                                    <div class="rad-text">Card</div>
                                </label>

                            </div>
                        </div>
                    </div>
                    <div class="received-amount d-none">
                        <div class="received">
                            <div class="title">Received Amount:</div>
                            <input type="number" id="received_amount" placeholder="0.00">
                        </div>
                        <div class="change">
                            Change:
                            <span>$<span id="due_amount">0.00</span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="column-right">
                <div class="product-group" style="width: 100%;">
                    <div class="right-top">
                        <input class="form-control mr-sm-2 search-item" type="search"
                               placeholder="Search Product By Name/Code"
                               aria-label="Search">

                        <!-- Added a new button -->
                        <button type="button" class="btn btn-lg btn-refresh cate-and-item-refresh" data-toggle="tooltip"
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
                            Refresh
                        </button>
                    </div>

                    <div class="products">
                        <jsp:include page="items.jsp"/>
                    </div>
                </div>

                <ul class="category-tab-group">
                    <li class="cate-item category all-cat"><a class="cate-link active" href="#">
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

                    <li class="cate-item category" id="category-<%= category.getInvID() %>">
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
        <button type="button" class="btn btn-lg btn-primary print">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-printer">
                <polyline points="6 9 6 2 18 2 18 9"></polyline>
                <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
                <rect x="6" y="14" width="12" height="8"></rect>
            </svg>
            Save & Print
        </button>
        <button type="button" class="btn btn-lg btn-secondary save">
            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                 height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round" class="feather feather-save">
                <path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"></path>
                <polyline points="17 21 17 13 7 13 7 21"></polyline>
                <polyline points="7 3 7 8 15 8"></polyline>
            </svg>
            Save
        </button>
        <a href="/retail-pos" type="button" class="btn btn-lg btn-danger">
            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                 height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
            Clear All</a>
    </div>

    <!-- Modal Start-->
    <div class="modal fade" id="save" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content custom-modal-content">
                <div class="modal-body custom-modal-body">
                    <svg width="48" height="48" viewBox="0 0 48 48" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <rect width="48" height="48" rx="24" fill="#D1FAE5"></rect>
                        <path d="M17 25L21 29L31 19" stroke="#059669" stroke-width="2" stroke-linecap="round"
                              stroke-linejoin="round"></path>
                    </svg>
                    <div class="modal-title">Successful</div>
                    <p class="modal-description">Your data was successfully saved</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary w-100" data-bs-dismiss="modal">Done</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal End -->

    <div class="modal fade" id="invoicePrint" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content custom-modal-content new-custom-modal-content">
                <div class="modal-body custom-modal-body new-custom-modal-body">
                    <div class="container">
                        <div class="card">
                            <div class="card-header">
                                Invoice
                                <strong>01/01/2018</strong>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive-sm">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th class="center">#</th>

                                            <th>Description</th>

                                            <th class="right">Unit Cost</th>
                                            <th class="center">Qty</th>
                                            <th class="right">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="center">1</td>

                                            <td class="left">Extended License</td>

                                            <td class="right">$999,00</td>
                                            <td class="center">1</td>
                                            <td class="right">$999,00</td>
                                        </tr>
                                        <tr>
                                            <td class="center">2</td>

                                            <td class="left">Instalation and Customization (cost per hour)</td>

                                            <td class="right">$150,00</td>
                                            <td class="center">20</td>
                                            <td class="right">$3.000,00</td>
                                        </tr>
                                        <tr>
                                            <td class="center">3</td>

                                            <td class="left">1 year subcription</td>

                                            <td class="right">$499,00</td>
                                            <td class="center">1</td>
                                            <td class="right">$499,00</td>
                                        </tr>
                                        <tr>
                                            <td class="center">4</td>

                                            <td class="left">1 year subcription 24/7</td>

                                            <td class="right">$3.999,00</td>
                                            <td class="center">1</td>
                                            <td class="right">$3.999,00</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-sm-5">

                                    </div>
                                    <div class="col-lg-4 col-sm-5">

                                    </div>

                                    <div class="col-lg-4 col-sm-5 ml-auto">
                                        <table class="table table-clear">
                                            <tbody>
                                            <tr>
                                                <td class="left">
                                                    <strong>Subtotal</strong>
                                                </td>
                                                <td class="right">$8.497,00</td>
                                            </tr>
                                            <tr>
                                                <td class="left">
                                                    <strong>Discount (20%)</strong>
                                                </td>
                                                <td class="right">$1,699,40</td>
                                            </tr>
                                            <tr>
                                                <td class="left">
                                                    <strong>VAT (10%)</strong>
                                                </td>
                                                <td class="right">$679,76</td>
                                            </tr>
                                            <tr>
                                                <td class="left">
                                                    <strong>Total</strong>
                                                </td>
                                                <td class="right">
                                                    <strong>$7.477,36</strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-print">Print</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/style.js"></script>
<script>feather.replace()</script>

</body>
</html>