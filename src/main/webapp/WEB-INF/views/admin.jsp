<html>
<head>
  <title>Admin</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
</head>

<body>
  
  <!--  Navigation -->
  <%@include file="navigation.jsp" %>
  
  <div class="container">
  
    <br>
    <br>
    <a href="<%=request.getContextPath()%>">Home</a> >
    <a href="admin.html">Admin</a>
    <br>
    <h1>Admin page!</h1>
    
    <!--  Help module -->
    <div id="helpbox">
      <%@include file="help.jsp"%>
    </div>
      
  </div>
  
</body>
</html>