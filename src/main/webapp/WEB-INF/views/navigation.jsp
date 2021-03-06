<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css" scoped>
nav>ul { list-style-type:none;
    margin: 0;
    padding: 0;
  }
  
nav ul>li {
    display: inline;
}

.navbar-collapse.collapse {
  display: block!important;
}

.navbar-nav>li, .navbar-nav {
  float: left !important;
}

.navbar-nav.navbar-right:last-child {
  margin-right: -15px !important;
}

.navbar-right {
  float: right!important;
}

</style>

<!-- static navbar -->
<nav class="navbar navbar-default navbar-static-top">
<div class="container">
  <div class="navbar-header">
    <a class="navbar-brand" href="<%=request.getContextPath()%>">LETS</a>
  </div>
  
  <div id="navbar" class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      
      <li><a href="/Exploration/about">About</a></li>
      <li><a href="/Exploration/reports">Reports</a></li>
      <c:choose>
        <c:when test="${sessionScope.role != null}">
          <li><a href="/Exploration/user/profile">Profile</a></li>
          <li><a href="/Exploration/user/game/new">Create Game</a></li>
        </c:when>
        <c:otherwise>
          <li><a href="/Exploration/login">Sign In</a></li>
        </c:otherwise>
      </c:choose>
      <c:if test="${sessionScope.role == 'admin'}">
        <li><a href="/Exploration/admin/listusers">Edit Users</a></li>
      </c:if>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <c:if test="${sessionScope.role != null}">
        <li><a href="/Exploration/user/logout">Logout</a></li>
      </c:if>
    </ul>
    
  </div>
</div>
</nav>

