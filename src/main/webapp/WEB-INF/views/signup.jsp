<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
	 <link rel="stylesheet" href="<c:url value="/resources/static/css/signup.css" />" />
	 <sec:authorize access="isAuthenticated()">
		<% response.sendRedirect("/?signupaccesserror"); %>
	</sec:authorize>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
  <div class="container-fluid">
  <div class="row no-gutter">
   <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
     	  <spring:hasBindErrors name="customer">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<c:forEach items="${errors.allErrors}" var="error">
					<strong><spring:message message="${error}" /></strong><br>
				</c:forEach>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
		 </spring:hasBindErrors>
		 <c:if test = "${not empty customererror}">
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					 <strong>${customererror}</strong>
					 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					   <span aria-hidden="true">&times;</span>
					 </button>
				</div>
			</c:if>
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading display-4 text-center mb-4">SignUp</h3>
              <form:form action="signup" modelAttribute="customer" method="POST">
           
                <div class="form-label-group">
                  <form:input path="firstname" id="inputfirstname" class="form-control" placeholder="First Name" required="autofocus"/>
                  <label for="inputfirstname">First Name</label>
                </div>
                
                  <div class="form-label-group">
                  <form:input path="lastname" type="text" id="inputlastname" class="form-control" placeholder="Last Name" required="autofocus"/>
                  <label for="inputlastname">Last Name</label>
                </div>
                
                  <div class="form-label-group">
                  <form:input path="email" id="inputEmail" class="form-control" placeholder="Email address"/>
                  <label for="inputEmail">Email address</label>
                </div>
                
                <div class="form-label-group">
                  <form:input path="mobile" type="text" id="inputmobile" class="form-control" placeholder="+91" />
                  <label for="inputmobile">Mobile +91</label>
                </div>
                
                <div class="form-label-group">
                  <form:input path="password" type="password" id="inputPassword" class="form-control" placeholder="Password"  required="autofocus" />
                  <label for="inputPassword">Password</label>
                </div>

                <form:button class="btn btn-lg btn-block btn-primary text-white rounded-pill mb-2" type="submit">Sign up</form:button>
                <div class="text-center">
                  <a class="small" href="login">Sign in</a></div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>