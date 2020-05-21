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
            <c:if test="${not empty message}">
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					<strong>${message}</strong>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
				 	</button>
				</div>
			  </c:if>
              <h3 class="login-heading text-center display-4 mb-4">Reset Password</h3>
              <form:form action="/reset-Password" modelAttribute="customer" method="POST" id="checkPassword">           	
	              	<div class="form-label-group">
	                  <input type="password" id="inputPassword" name="email" class="form-control" placeholder="New Password" required />
	                  <label for="inputPassword">New Password</label>
	                </div>
	                <div class="form-label-group">
	                  <input id="inputConfirmPassword" name="email" class="form-control" placeholder="Confirm Password" required />
	                  <label for="inputConfirmPassword">Confirm Password</label>
	                </div>              
	                <button id="btn" class="btn btn-lg btn-block btn-primary text-white rounded-pill mb-2" type="submit">Save</button>
               </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
const inputOne = document.getElementById('inputPassword');
const inputTwo = document.getElementById('inputConfirmPassword');
document.getElementById('checkPassword').addEventListener('submit', function(e){
  if(inputOne.value != inputTwo.value){
    inputTwo.style.borderColor = 'red';
    e.preventDefault();
  }
});
</script>
<jsp:include page="footer.jsp"></jsp:include>