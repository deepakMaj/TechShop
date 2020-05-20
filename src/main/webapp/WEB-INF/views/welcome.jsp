<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/static/css/application.css" />" />
</head>
<body class="body">
   <jsp:include page="navbar.jsp"></jsp:include>
	<div class="container main main1" >
		<sec:authorize access="isAuthenticated()">
			<c:if test="${not empty loginsuccess}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<strong>${loginsuccess}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
			</c:if>
			<c:if test="${not empty addproductaccesserror}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<strong>${addproductaccesserror}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
			</c:if>
			<c:if test="${not empty updatesuccess}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<strong>${updatesuccess}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
			</c:if>
			<c:if test="${not empty success}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<strong>${success}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
			</c:if>
		<c:if test="${not empty loginaccesserror}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>${loginaccesserror}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<c:if test="${not empty signupaccesserror}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>${signupaccesserror}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		</sec:authorize>
		<c:if test="${not empty shippingdetailsaccesserror}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>${shippingdetailsaccesserror}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
			</c:if>
			<c:if test="${not empty updateaccesserror}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>${updateaccesserror}</strong>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
	    <div class="jumbotron">
		  <h1 class="display-4">Welcome to TechShop <i class="fab fa-accusoft" style="margin-left: 1px"></i></h1>
		  <hr class="my-4">
		  <p class="psize">Dive into world of technology and explore various mobile and laptop devices from world leading manufacturing companies
		  making the world a better place. Buy products at affordable prices with our website.</p>
		  <a class="btn btn-primary btn-lg mt-4" href="${pageContext.request.contextPath}/product/list/0" role="button">Explore</a>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>