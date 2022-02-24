<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QYosky - Dashboard</title>
<link rel="stylesheet" href="css/only/only.css">
<link rel="stylesheet"
	href="css/barra-esquerda-css/barra-esquerda-css.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Saira+Condensed:wght@100;300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/ver-cliente-css/ver-cliente-css.css">
</head>

<body>
	<main>
		<div class="bar-lateral">
			<div class="logo-super">
				<img src="images/svg/LogoQYosky.svg">
			</div>
			<div class="list-super">
				<ul>
					<li><a href="dashboard">Dashboard</a></li>
					<li><a class="a2" href="verCliente">Clientes</a></li>
					<li><a class="a3" href="novoCliente">Novo Cliente</a></li>
				</ul>
			</div>
			<div class="foot-super">
				<h5>Desenvolvido por : Arthur e Matheus</h5>
				<h5>Versão : 1.0.1</h5>
				<h5>GitHub Link</h5>
				<h5>Todos os direitos reservados © 2022</h5>
			</div>
		</div>
		<div class="content">
			<div class="table">
				<table>
					<tr>
						<th>Nome</th>
						<th>E-mail</th>
						<th>Telefone</th>
						<th>Data de Nascimento</th>
						<th>Gênero</th>
						<th>Endereço</th>
						<th>Produtos do Cliente</th>
						<th>EDITAR | EXCLUIR</th>
					</tr>
					<c:forEach items="${usuarios}" var="u">
						<tr>
							<td>${u.nome}</td>
							<td>${u.email }</td>
							<td>${u.numero }</td>
							<td><fmt:formatDate value="${u.dataNascimento.time}" pattern="dd/MM/yy" /></td>
							<td>${u.genero == 1 ? "Feminino" : u.genero == 2 ? "Masculino" : "Não informou" }</td>
							<td>${u.endereco}</td>
							<td>${u.pedido }</td>
							<td><button class="edt" onclick="window.location.href = 'editarUsuario?idUsuario=${u.id}';">Editar</button> |
								<button class="exc" onclick="window.location.href = 'deletaUsuario?idUser=${u.id}';">Excluir</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>
</body>

</html>