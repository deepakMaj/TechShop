<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<base href="/"> 
	 <link href="webjars/bootstrap/4.4.1-1/css/bootstrap.min.css"
        rel="stylesheet" />
     <link rel="shortcut icon" href="<c:url value="/resources/static/images/download.png"/>" type="image/png" />
</head>
<nav class="navbar navbar-expand-xl navbar-light bg-light">
	  <a class="navbar-brand" href="/">TechShop<i class="fab fa-accusoft" style="margin-left: 2px"></i></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item ">
	        <a class="nav-link" href="${pageContext.request.contextPath}/product/list/0">Products</a>
	      </li>
	      <li class="nav-item ">
	        <a class="nav-link" href="${pageContext.request.contextPath}/product/list/0?mobiles">Mobiles</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/product/list/0?laptops">Laptops</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Brands
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/list/0?brandProduct=Oneplus">Oneplus</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/list/0?brandProduct=Apple">Apple</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/list/0?brandProduct=Samsung">Samsung</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/list/0?brandProduct=Redmi">Redmi</a>
	           <a class="dropdown-item" href="${pageContext.request.contextPath}/product/list/0?brandProduct=Lenovo">Lenovo</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/list/0?brandProduct=HP">HP</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/list/0?brandProduct=Dell">Dell</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
	      </li>
	    </ul>
	    <form method="GET" action="${pageContext.request.contextPath}/product/list/0" class="form-inline my-2 my-lg-0">
		  	<input class="form-control mr-sm-2" type="search" placeholder="Search by Brand..."  name="searchValue"/>
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>	
		  </form>
	     <sec:authorize access="!isAuthenticated()">
		    <form class="form-inline my-1 my-lg-0">
		      <a class="btn btn-outline-primary my-2 my-sm-0 ml-1" href="signup">Sign up</a>
		      <a class="btn btn-outline-danger my-2 my-sm-0 ml-1" href="login">Sign In</a>
		    </form>
		  </sec:authorize>
		  <sec:authorize access="isAuthenticated()">
		    	<form:form action="${pageContext.request.contextPath}/logout" method="POST" class="form-inline my-2 my-lg-0">	
			     	<div class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          Account
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <p class="dropdown-item"><i class="fas fa-user mr-1"></i><em class="text-muted" style="font-weight: 500">
				          <%String arr[] = SecurityContextHolder.getContext().getAuthentication().getName().split("@");
				          	out.println(arr[0]);%></em></p>
				          <sec:authorize access="hasRole('ADMIN')">
				          	<hr>
				          	<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product/new">Add Product</a>
				          </sec:authorize>
				          <hr>
				          <a class="dropdown-item" href="${pageContext.request.contextPath}/myOrders">My Orders<i class="fas fa-shopping-bag ml-1"></i></a>
				          <a class="dropdown-item" href="${pageContext.request.contextPath}/edit_form">Edit Account<i class="fas fa-user-circle ml-1"></i></a>
				          <a class="dropdown-item" href="${pageContext.request.contextPath}/shipping_details_form">Edit Shipping details<i class="fas fa-truck ml-1"></i></a>
				          <a class="dropdown-item" href="${pageContext.request.contextPath}/cart/mycart">My Cart<i class="fas fa-shopping-cart ml-1"></i></a>
				        </div>
				      </div>
		      		<input type="submit" class="btn btn-outline-danger my-2 my-sm-0 ml-sm-0" value="Sign Out" />
		    	</form:form>
	    	</sec:authorize>
	    </div>
</nav>
 <script src="webjars/jquery/3.4.1/jquery.min.js"></script>
 <script src="webjars/bootstrap/4.4.1-1/js/bootstrap.min.js"></script>