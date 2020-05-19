<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<base href="/"> 
	 <link href="webjars/bootstrap/4.4.1-1/css/bootstrap.min.css"
        rel="stylesheet" />
	<link rel="stylesheet" href="<c:url value="/resources/static/css/application.css"/>" />
</head>
<body>
	<div class="container-wrapper">
	    <div class="container main">
	            <div class="jumbotron text-center">
	                    <h1>Thank you for your business!</h1>
	                    <h4>Your order will be shipped in two business days!</h4>
	                    <div class="mt-4">
		                    <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/myOrders">Orders</a>
	                    </div>
	           </div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>