<%--
  Created by IntelliJ IDEA.
  User: roni
  Date: 6/1/23
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Print Page</title>
</head>
<body>
<!-- HTML content to be printed -->
<h1>Print Content</h1>
<p>This is the content to be printed.</p>

<!-- JavaScript code to trigger print -->
<script>
    window.onload = function () {
        window.print();
    };
</script>
</body>
</html>
