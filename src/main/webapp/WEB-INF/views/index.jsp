<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QVeo web</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/general.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
</head>
<body>
<header>
    <%@include file="/WEB-INF/views/layout/header.jsp" %>
</header>
<main>
    <!-- 		<div class="row"> -->
    <!-- 		<div class="row"></div> -->
	<c:forEach items="${plataformas}" var="plataforma">
    <div class="row">
        <div class="col s12">
            <h3>
                <a href="#">Peliculas y series de ${plataforma.nombre}</a>
            </h3>
        </div>
    </div>

    <div class="row">
        <div class="col s12">
            <div class="carousel">
                <c:forEach items="${plataforma.peliculas}" var="pelicula">
                    <div class="carousel-item">
                        <a class="waves-effect waves-light modal-trigger" href="#modal-pelicula${plataforma.id}-${pelicula.id}">
                            <img src="${pageContext.request.contextPath}${pelicula.poster}"/>
                        </a>
                    </div>
                </c:forEach>
                <c:forEach items="${plataforma.series}" var="serie">
                    <div class="carousel-item">
                        <a class="waves-effect waves-light modal-trigger" href="#modal-serie${plataforma.id}-${serie.id}">
                            <img src="${pageContext.request.contextPath}${serie.poster}">
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
	</c:forEach>


</main>
<footer>
    <%@include file="/WEB-INF/views/layout/footer.jsp" %>
</footer>

<c:forEach items="${plataformas}" var="plataforma">
    <c:forEach items="${plataforma.peliculas}" var="pelicula">
        <div id="modal-pelicula${plataforma.id}-${pelicula.id}" class="modal bottom-sheet">
            <div class="modal-content">
                <img src="${pageContext.request.contextPath}${pelicula.poster}"/>
                <h4>${pelicula.titulo}</h4>
                <h5>${pelicula.plataformasConcatenadas()}</h5>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${plataforma.series}" var="serie">
        <div id="modal-serie${plataforma.id}-${serie.id}" class="modal bottom-sheet">
            <div class="modal-content">
                <img src="${pageContext.request.contextPath}${serie.poster}"/>
                <h4>${serie.titulo}</h4>
                <h5>${serie.plataformasConcatenadas()}</h5>
            </div>
        </div>
    </c:forEach>
</c:forEach>

</body>
<script src="${pageContext.request.contextPath}/resources/vendor/js/jquery-3.4.1.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/carousel.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
</html>
