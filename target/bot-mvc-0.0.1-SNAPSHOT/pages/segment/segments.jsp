<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

	<title>Segmentos - Listagem</title>
    
    <spring:url value="/resources/css" var="css"/>
    <spring:url value="/resources/js" var="js"/>
    
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    
    <link href="${css}/bootstrap.css" rel="stylesheet">
    <link href="${css}/small-business.css" rel="stylesheet">
    <link href="${css}/estiloBot.css" rel="stylesheet">
    
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="btnNovo">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${contextPath}/thegoodbot/bot" id="menuBar">Bots</a>
                    </li>
                    <li>
                    	<a href="${contextPath}/thegoodbot/segment" id="menuBar">Segmentos</a>
                    </li>
                </ul>
                <img src="../resources/img/logo.png" width="200px" id="logo">
            </div>
        </div>
    </nav>
    
    <div class="container">
        <div class="row">
            <div class="col-md-12">
				
				<h1>Segmentos</h1>
				
				<p class="toolbar">
				
					<a class="create btn btn-default" id="btnNovoum" href="${contextPath}/thegoodbot/segment/form?page=segment-novo">Novo Segmento</a>
	
					<span class="alert"></span>
				</p>
				
				<c:if test="${not empty messages}">
					<h3 class="alert alert-warning">${messages}</h3>
				</c:if>
				<br>
				<!--CARD BOOTSTRAP PARA APRE. DOS ELEMENTOS. LAÇO FOREACH-->
				<c:forEach items="${segments}" var="segment">
					<div id="card">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">Nome: ${segment.nameSegment}</h5>
		
								<form:form action="${contextPath}/thegoodbot/segment/${segment.idSegment}" method="delete">
								
									<a class="btn btn-success btn-xs" id="btnDetalhes" href="${contextPath}/thegoodbot/segment/${segment.idSegment}">Detalhes</a>
									<a class="btn btn-warning btn-xs" id="btnEditar" href="${contextPath}/thegoodbot/segment/form?page=segment-editar&id=${segment.idSegment}">Editar</a>
									<input type="submit" value="Excluir" class="btn btn-danger btn-xs" id="btnDeletar">
								</form:form>
							</div>
						</div>
						<br>
					</div>
				</c:forEach>
			</div>
		</div>
		<hr>
	</div>

    <!-- jQuery -->
    <script src="${js}/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>