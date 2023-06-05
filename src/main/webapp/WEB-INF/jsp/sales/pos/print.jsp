<%@ page import="com.avibha.bizcomposer.sales.dto.InvoiceDetailsResponse" %>
<%@ page import="com.avibha.bizcomposer.sales.dto.CartItem" %>

<% InvoiceDetailsResponse box = (InvoiceDetailsResponse) request.getAttribute("box"); %>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @media print {
            .print-button {
                display: none;
            }

            .back-button {
                display: none;
            }
        }

        /* Styles for the invoice receipt */
        .invoice {
            font-family: Arial, sans-serif;
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .invoice-details p {
            margin: 5px 0;
        }

        .table > :not(:last-child) > :last-child > * {
            border-bottom-color: #ccc;
        }

        .item-section {
            margin-bottom: 20px;
        }

        .item-table {
            width: 100%;
            border-collapse: collapse;
        }

        .item-table th,
        .item-table td {
            padding: 2px 0px;
            /*border-bottom: 1px solid #ccc;*/
            text-align: right;
        }

        .item-table th {
            text-align: left;
        }

        .total-section {
            margin-top: 20px;
            text-align: right;
        }

        .total-section tr th {
            text-align: right;
        }

        .total-section p {
            margin: 5px 0;
        }

        .back-print-section {
            text-align: center;
        }

        .right {
            text-align: right;
        }

    </style>
</head>
<body>
<div class="invoice">
    <div class="header">
        <h2><%= box.getCompanyName() %></h2>
        <p>Invoice #: <%= box.getOrderNo() %>
        </p>
        <p>
            Customer: <%= box.getCustomerName() %>
        </p>
        <p>Date: <%= box.getDate() %></p>
    </div>

<%--    <div class="header">--%>
<%--        <h2><%= box.getCompanyName() %></h2>--%>
<%--        <div>--%>
<%--            <span style="float: left">--%>
<%--                Invoice #: <%= box.getOrderNo() %>--%>
<%--            </span>--%>
<%--            <span style="float: right">Date: <%= box.getDate() %></span>--%>
<%--        </div>--%>
<%--        <div style="float: left">Customer: <%= box.getCustomerName() %></div>--%>
<%--    </div>--%>

    <div class="item-section">
        <table class="item-table table table-striped">
            <thead>
            <tr>
                <th>Item Name</th>
                <th class="right">Qty</th>
                <th class="right">Price</th>
                <th class="right">Amount</th>
            </tr>
            </thead>
            <tbody>
            <% for (CartItem item : box.getCartItems()) { %>
            <tr>
                <td style="max-width: 210px; text-align: left;">
                    <%= item.getItemName() %>
                </td>
                <td><%= item.getQty() %>
                </td>
                <td><%= item.getPrice() %>
                </td>
                <td><%= item.getAmount() %>
                </td>
            </tr>
            <% } %>

            </tbody>
            <tfoot class="total-section">
            <tr>
                <th colspan="3">Subtotal</th>
                <th>$<%= box.getSubTotal() %>
                </th>
            </tr>
            <tr>
                <th colspan="3">Tax</th>
                <th>$<%= box.getTaxTotal() %>
                </th>
            </tr>
            <tr>
                <th colspan="3">Discount</th>
                <th>$<%= box.getDiscount() %>
                </th>
            </tr>
            <tr>
                <th colspan="3">Total</th>
                <th>$<%= box.getGrandTotal() %>
                </th>
            </tr>
            </tfoot>
        </table>
    </div>

    <div class="back-print-section">
        <button class="print-button" onclick="window.print()">Print</button>
        <button class="back-button" onclick="goBack()">Back</button>
    </div>
</div>
</body>
<script>
    function goBack() {
        window.location.href = "/retail-pos";
    }

    window.print();
</script>
</html>