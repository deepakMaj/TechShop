<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	        <section>
	            <div class="jumbotron">
	                <div class="container text-center">
	                    <h1>Invalid Cart!</h1>
		                    <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/product/list/0">Products</a>
	                </div>
	            </div>
	        </section>
		</div>
	</div> 
</body> 
<%@ include file="/WEB-INF/views/footer.jsp" %>