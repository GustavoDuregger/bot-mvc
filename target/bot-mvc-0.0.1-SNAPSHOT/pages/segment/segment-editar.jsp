<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html>

<head>
		
	<title>Segmentos - Editar</title>
    
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
            </div>
        </div>
    </nav>
    
    <div class="container">

        <!-- Call to Action Well -->
        <div class="row">
            <div class="col-lg-12">
                <div class="well" id="fundo">
					
					<h2>Segmento</h2>
					
					<form:form modelAttribute="segmentModel" action="${contextPath}/thegoodbot/segment/${segmentModel.idSegment}" method="put">
					
						<spring:hasBindErrors name="segmentModel">
							<div class="alert alert-danger" role="alert">
								<form:errors path="*" class="has-error" />
							</div>
						</spring:hasBindErrors>
					
						<div class="form-group">
							<label class="control-label" for="nameSegment">Nome:</label>
							<form:input type="text" path="nameSegment" id="nameSegment" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="nameSegment"/></font><br/>
                        </div>
						<hr>
						
						<a class="btn btn-default btn-lg" href="${contextPath}/thegoodbot/segment">Cancelar</a>
						<button type="submit" class="btn btn-primary btn-lg" id="btnGravar">Gravar</button>
                            
                        <br>
                        <br>
					</form:form>
					
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="${js}/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${js}/bootstrap.min.js"></script>


</body>
</html>