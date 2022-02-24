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
<link rel="stylesheet" href="css/novo-cliente-css/novo-cliente-css.css">
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
			<div class="form">
				<form action=" ${usuario.nome != null ? "
					atualizarUsuario?idUsuario=" : "
					inserirNovoUsuario"}${usuario.nome !=null ? usuario.id
					: ""}" method="post">
					<table>
						<tr>
							<th>Nome</th>
							<th>Número de Telefone</th>
						</tr>
						<tr>
							<td><input type="text" name="nome" value="${usuario.nome }"
								required /></td>
							<td><input type="number" name="numero"
								value="${usuario.numero }" required /></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<th>Data de Nascimento</th>
						</tr>
						<tr>
							<td><input type="email" name="email"
								value="${usuario.email }" required /></td>
							<td><input type="date" name="dataNascimento"
								value="<fmt:formatDate value="${usuario.dataNascimento.time}" pattern="yyyy-MM-dd" />"
								required /></td>
						</tr>
						<tr>
							<th>Endereço</th>
						</tr>
						<tr>
							<td><input type="text" name="endereco"
								value="${usuario.endereco}" required /></td>
						</tr>
						<tr>
							<td><input type="radio" name="genero" value="1"
								${usuario.genero == "1" ? "checked" : "" }> Feminino <input
								type="radio" name="genero" value="2"
								${usuario.genero == "2" ? "checked" : "" }> Masculino <input
								type="radio" ${usuario.genero == "3" ? "checked" : "" }
								name="genero" value="3" required> Prefiro näo Informar</td>
						</tr>
						<tr>
							<td><textarea name="pedido" required>${usuario.pedido }</textarea></td>
						</tr>
					</table>
					<div class="bg-butto">
						<button class="btn-confirm" value="cadastro" type="submit">${usuario.nome != null ? "Atualizar" : "Cadastrar" }</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>

</html>