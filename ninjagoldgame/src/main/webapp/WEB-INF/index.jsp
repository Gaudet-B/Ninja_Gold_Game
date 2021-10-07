<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<meta charset="ISO-8859-1">
		<title>Ninja Gold Game</title>
	</head>
	<body style="background-image: url('pexels-green-gold.jpg'); -webkit-background-size: cover;">
		<div class="mask" style="height: 100%; width: 100%; background-color: rgb(0, 0, 0, 0.2);">
			<div class="container d-flex flex-column text-light" style="width: 90vw; margin: auto;">
				<div class="d-flex flex-row my-4">
					<h3 style="color: whitesmoke; text-shadow: 2px 2px 2px black;">Your Gold:</h3>
					<div class="border border-light ms-3" style="width: 100px; height: 30px; background-color: rgb(0, 0, 0, 0.6);">
						<p class="fw-bold ms-2"><c:out value="${ gold }"/></p>
					</div>
				</div>
				<div class="d-flex flex-row justify-content-between">
					<div class="d-flex flex-column border border-light p-4 text-center" style="max-width: 20%; min-width: fit-content; background-color: rgb(0, 0, 0, 0.6);">
						<h5>Farm</h5>
						<p class="fst-italic">(earns 10-20 gold)</p>
						<form action="/gold/find" method="post">
							<input type="hidden" name="find" value="farm"/>
							<input name="submit-btn" class="btn btn-outline-warning mt-3" type="submit" value="Find Gold!"/>
						</form>
					</div>
					<div class="d-flex flex-column border border-light p-4 text-center" style="max-width: 20%; min-width: fit-content; background-color: rgb(0, 0, 0, 0.6);">
						<h5>Cave</h5>
						<p class="fst-italic">(earns 5-10 gold)</p>
						<form action="/gold/find" method="post">
							<input type="hidden" name="find" value="cave"/>
							<input name="submit-btn" class="btn btn-outline-warning mt-3" type="submit" value="Find Gold!"/>
						</form>
					</div>
					<div class="d-flex flex-column border border-light p-4 text-center" style="max-width: 20%; min-width: fit-content; background-color: rgb(0, 0, 0, 0.6);">
						<h5>House</h5>
						<p class="fst-italic">(earns 2-5 gold)</p>
						<form action="/gold/find" method="post">
							<input type="hidden" name="find" value="house"/>
							<input name="submit-btn" class="btn btn-outline-warning mt-3" type="submit" value="Find Gold!"/>
						</form>
					</div>
					<div class="d-flex flex-column border border-light p-4 text-center" style="max-width: 20%; min-width: fit-content; background-color: rgb(0, 0, 0, 0.6);">
						<h5>Casino!</h5>
						<p class="fst-italic my-0">(earns 0-50 gold</p>
						<p class="fst-italic mt-0 mb-2">or loses 0-50 gold)</p>
						<form action="/gold/find" method="post">
							<input type="hidden" name="find" value="casino"/>
							<input name="submit-btn" class="btn btn-outline-warning" type="submit" value="Find Gold!"/>
						</form>
					</div>
				</div>
				<div class="d-flex flex-column my-4">
					<h3 style="color: whitesmoke; text-shadow: 2px 2px 2px black;">Activities:</h3>
					<div class="d-flex flex-column border border-light p-2" style="min-height: 200px; max-height: fit-content; background-color: rgb(0, 0, 0, 0.6);">
						<c:if test="${ activity.size() > 0 }">
						<ul class="list-unstyled">
							<c:forEach var="action" items="${ activity }">
								<c:if test="${ action.color.equals('danger') }">
								<li class="text-decoration-none text-danger" style="text-shadow: 1px 1px black;"><c:out value="${ action.message }"/></li>
								</c:if>
								<c:if test="${ action.color.equals('success') }">
								<li class="text-decoration-none text-success" style="text-shadow: 1px 1px black;"><c:out value="${ action.message }"/></li>
								</c:if>
							</c:forEach>
						</ul>
						</c:if>
					</div>
				</div>
				<a class="btn btn-outline-light fw-bold my-2" href="/gold/reset" style="width: 100px">Reset</a>
			</div>
		</div>
	</body>
</html>