<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>QVeo web</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/general.css">
</head>
<body>
	<header>
		<%@include file="/WEB-INF/views/layout/header.jsp"%>
	</header>
	<main>
	
	 <div class="row">

      <div class="col s3 izq ">
         <h3> ${objeto}</h3>
      </div>

      <div class="col derecha">
      	
        	<h3> ${objeto}</h3>
        
      </div>

    </div>

	</main>		

	<footer>
		<%@include file="/WEB-INF/views/layout/footer.jsp"%>
	</footer>

</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/carousel.js"></script>
</html>
