<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

	<title>Bots - Editar</title>
    
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
					
					<form:form modelAttribute="botModel" action="${contextPath}/thegoodbot/bot/${botModel.id_bot}" method="put">
					
						<spring:hasBindErrors name="botModel">
							<div class="alert alert-danger" role="alert">
								<form:errors path="*" class="has-error" />
							</div>
						</spring:hasBindErrors>
					
						<div class="form-group">
							<label class="control-label" for="name">Nome:</label>
							<form:input type="text" path="name" id="name" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="name"/></font><br/>
                        </div>
                        
                        <div class="form-group">
                        	<label class="control-label" for="segment">Segmentos:</label>
                        
	                        <form:select path="segment.idSegment">
	                        	<form:options items="${segments}" itemValue="idSegment" itemLabel="nameSegment" />
	                        </form:select>
						</div>
                        
                        <div class="form-group">
							<label class="control-label" for="welcome_msg">Mensagem de Boas Vindas:</label>
							<form:input type="text" path="welcome_msg" id="welcome_msg" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="welcome_msg"/></font><br/>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="farewell_msg">Mensagem de despedida:</label>
							<form:textarea class="form-control" path="farewell_msg" rows="4" cols="100" />
							<font color="red"><form:errors path="farewell_msg"/></font><br/>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="downtime">Tempo de inatividade:</label>
							<form:input type="number" step="0" id="downtime" path="downtime" class="form-control" />
							<font color="red"><form:errors path="downtime"/></font><br/>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="default_answer">Mensagem padrão:</label>
							<form:textarea id="default_answer" class="form-control" path="default_answer" rows="4" cols="100" />
							<font color="red"><form:errors path="default_answer"/></font><br/>
						</div>
						<hr>
						
						<a class="btn btn-default btn-lg" href="${contextPath}/thegoodbot/bot">Cancelar</a>
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