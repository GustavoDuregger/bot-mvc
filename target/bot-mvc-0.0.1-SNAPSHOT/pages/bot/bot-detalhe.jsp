<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>
	
	<title>Bots - Detalhe</title>
    
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
        <div class="row">
            <div class="col-lg-12">
                <div class="well" id="fundo">
					
					<h2>Bot</h2>
					
						<div class="form-group">
							<label class="control-label" for="name">Nome:</label>
							<b>${bot.name}</b>
                        </div>
                        
                         <div class="form-group">
							<label class="control-label" for="name">Segmento:</label>
							<label class="label label-default" id="btnNovoum">${bot.segment.nameSegment}</label>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="mensagem">Mensagem de Boas Vindas:</label>
							<label class="label label-default" id="btnNovoum">${bot.welcome_msg}</label>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="mensagem">Mensagem de despedida:</label>
							<label class="label label-default" id="btnNovoum">${bot.farewell_msg}</label>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="inatividade">Tempo de inatividade:</label>
							<label class="label label-default" id="btnNovoum">${bot.downtime}</label>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="mensagem">Mensagem Padrão:</label>
							<label class="label label-default" id="btnNovoum">${bot.default_answer}</label>
						</div>
						<hr>
						
						<a class="btn btn-default btn-lg" href="${contextPath}/thegoodbot/bot">Voltar</a>
                            
                        <br>
                        <br>
					
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