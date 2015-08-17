<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
  <title>Home</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
  
</head>

<body>
  <!--  Navigation -->
  <%@include file="navigation.jsp"%>
  
  <div class="container">
    <div class="jumbotron">
      <h1>Lets Explore!</h1>

      <h2>${welcomeMessage}</h2>
      
      <sec:authorize access="hasRole('USER')">
        <!-- For login user -->
        <c:url value="/logout" var="logoutUrl" />
        <form action="${logoutUrl}" method="post" id="logoutForm">
          <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
        </form>
        <script>
          function formSubmit() {
            document.getElementById("logoutForm").submit();
          }
        </script>
    
        <c:if test="${pageContext.request.userPrincipal.name != null}">
          <h2>
            User : ${pageContext.request.userPrincipal.name} | <a
              href="javascript:formSubmit()"> Logout</a>
          </h2>
        </c:if>
      </sec:authorize>
    
      <!--  Help module -->
      <%@include file="help.jsp"%>
      
<%--       	
      
      <table>
			<tr>
				<td>ID</td><td>first name</td><td>last name</td><td>username</td><td>password</td><td>role</td><td></td>
			</tr>
		    <c:forEach items="${users}" var="user">
				<tr>
					<td>${user.id}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.role}</td>			
				</tr>
			</c:forEach>
		</table> --%>
      
    </div>

  </div>

</body>

</html>