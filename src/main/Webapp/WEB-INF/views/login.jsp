<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<head>
	 <link rel="stylesheet" href="<c:url value="/resources/static/css/login.css" />" />
    <sec:authorize access="isAuthenticated()">
		<% response.sendRedirect("views/?loginaccesserror"); %>
	</sec:authorize>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container-fluid">
  <div class="row no-gutter">
   <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
			<c:if test="${not empty message}">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
					<strong>${message}</strong>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
				 	</button>
				</div>
			  </c:if>
			  <c:if test="${not empty logout}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
					  <strong>${logout}</strong>
				  	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						 <span aria-hidden="true">&times;</span>
					  </button>
					</div>
				</c:if>
				<c:if test = "${not empty error}">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
					  <strong>${error}</strong>
					  	 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
				</c:if>
              <h3 class="login-heading display-4 mb-4">Welcome!</h3>
              <form:form action="/login" modelAttribute="logininfo" method="POST" >
                <div class="form-label-group">
                  <form:input path="email" id="inputEmail" class="form-control" placeholder="Email address" required="autofocus" />
                  <label for="inputEmail">Email</label>
                </div>

                <div class="form-label-group">
                  <form:input path="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="autofocus" />
                  <label for="inputPassword">Password</label>
                </div>
                
                <form:button class="btn btn-lg btn-block btn-primary text-white rounded-pill mb-2" type="submit">Sign in</form:button>
                <div class="text-center">
                  <a class="small" href="#">Forgot password?</a></div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>