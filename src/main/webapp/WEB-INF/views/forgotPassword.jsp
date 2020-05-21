<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<head>
	 <link rel="stylesheet" href="<c:url value="/resources/static/css/login.css" />" />
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
            <c:if test="${invalidEmail == true}">
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					<strong>User with email does not exists</strong>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
				 	</button>
				</div>
			  </c:if>
			  <div class="alert alert-primary">
			  	<strong>A verification email will be sent to your email address for password reset</strong>
			  </div>
              <h3 class="login-heading text-center display-4 mb-4">Forgot Password</h3>
              <form:form action="/forgotPassword" modelAttribute="customer" method="POST" id="checkEmail">           	
	              	<div class="form-label-group">
	                  <form:input  path="email" id="inputEmail" name="email" class="form-control" placeholder="Enter Email" required="" />
	                  <label for="inputEmail">Enter Email</label>
	                </div>              
	                <button id="btn" class="btn btn-lg btn-block btn-primary text-white rounded-pill mb-2" type="submit">Continue</button>
               </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>