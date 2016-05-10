<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de produto</title>
</head>
<body>
	
	<form:form method="POST" action="/ecomerce/produtos" commandName="product"  enctype="multipart/form-data">
		<div>
			<label for="title">Titulo</label>
			<form:input path="title"/>
			<form:errors path="title"/>
		</div>
		<div>
			<label for="description">Descricao</label>
			<form:textarea rows="10" cols="20" path="description"/>
			<form:errors path="description"/>
		</div>
		<div> 
 			<label for="summaryPath">Sumario do livro</label> 
			<input name="summaryPath" type="file"/> 
		</div>
		<div>
			<label for="pages">Numero de paginas</label>
			<form:input path="pages" type="text"/>
			<form:errors  path="pages"/>
		</div>
		<div>
			<c:forEach items="${types}" var="bookType" varStatus="status">
				<div>
					<label for="price_${bookType}">${bookType}</label>
					<input type="text" name="prices[${status.index}].value" id="price_${bookType}"/>
					<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}" />
				</div>
			</c:forEach>
		</div>
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form:form>

</body>
</html>