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
	            <div class="jumbotron">
	                <div class="container text-center">
	                    <h1 class="alert alert-danger">Checkout cancelled!</h1>
	                    <h6>Your checkout process is cancelled! You may continue shopping.</h6>
		                    <a href="${pageContext.request.contextPath}/product/list/0" class="btn btn-primary btn-lg" >Products</a>
	                </div>
	            </div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>