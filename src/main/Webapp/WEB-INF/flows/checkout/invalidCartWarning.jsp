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
	                    <h1>Invalid Cart!</h1>
	                     <p><a href="<spring:url value="/product/list/0" />" class="btn btn-default">Products</a></p>
	                </div>
	            </div>
	        </section>
		</div>
	</div> 
</body> 
<%@ include file="/WEB-INF/views/footer.jsp" %>