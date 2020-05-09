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
	                    <h1>Invalid Cart!</h1>
	                     <p><a href="<spring:url value="/product/productList" />" class="btn btn-default">Products</a></p>
	                </div>
	            </div>
	        </section>
		</div>
	</div> 
</body> 
<jsp:include page="footer.jsp"></jsp:include>