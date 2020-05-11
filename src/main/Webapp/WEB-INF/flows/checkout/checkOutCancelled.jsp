<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
 		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/application.css" />
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container-wrapper">
	    <div class="container main">
	        <section>
	            <div class="jumbotron">
	                <div class="container">
	                    <h1 class="alert alert-danger">Checkout cancelled!</h1>
	                    <h6>Your checkout process is cancelled! You may continue shopping.</h6>
	                </div>
	            </div>
	        </section>
	
	        <section class="container">
	            <p><a href="<spring:url value="/product/list/0" />" class="btn btn-default">Products</a></p>
	        </section>
		</div>
	</div>
</body>
<jsp:include page="navbar.jsp"></jsp:include>