<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
 		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/application.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/navbar.jsp" %>
	<div class="container-wrapper">
	    <div class="container main">
	        <section>
	            <div class="jumbotron">
	                <div class="container">
	                    <h1>Thank you for your business!</h1>
	                    <h6>Your order will be shipped in two business days!</h6>
	                </div>
	            </div>
	        </section>
	        <section class="container">
	            <p><a href="<spring:url value="/" />" class="btn btn-default">Explore</a></p>
	        </section>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>