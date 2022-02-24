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
<link rel="stylesheet" href="css/dashboard-css/dashboard-css.css">
</head>
<style>
.ul-doida {
	flex-wrap: wrap;
}

.ul-doida li {
	width: 30%;
}

.yellow {
	color: rgb(226, 178, 19);
}
</style>
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
			<div class="group-cards">

				<!-- Card Faixa Etaria -->
				<div class="card hover1">
					<h1>
						Faixa Etária - <img src="images/svg/userSVG.svg" class="mt-1" />
					</h1>
					<div class="bar"></div>
					<ul>
						<li>Jovens : <span class="blue">${jovem}</span></li>
						<li>Adultos : <span class="blue">${adulto}</span></li>
						<li>Idosos : <span class="blue">${idoso}</span></li>
					</ul>
					<div class="bar" style="margin-bottom: 10px;"></div>
					<h3>
						Total de Usuários : <span class="blue">${tT}</span> - <img
							src="images/svg/userSVG.svg" class="mt-2" />
					</h3>
				</div>

				<!-- Card Genero -->
				<div class="card hover2">
					<h1>
						Gênero - <img src="images/svg/genderSVG.svg" class="mt-1" />
					</h1>
					<div class="bar"></div>
					<ul>
						<li>Feminino : <span class="green">${fValue}</span></li>
						<li>Masculino : <span class="green">${dValue}</span></li>
						<li>Optou por não falar : <span class="green">${nValue}</span></li>
					</ul>
					<div class="bar" style="margin-bottom: 10px;"></div>
				</div>

				<!-- Card Cadas -->
				<div class="card maior hover3">
					<h1>
						Cadastros - <img src="images/svg/databaseSVG.svg" class="mt-1" />
					</h1>
					<div class="bar"></div>
					<ul>
						<li>Cadastros Hoje : <span class="red">${data}</span></li>
						<li>Durante a manhã : <span class="red">${manha}</span></li>
						<li>Durante a tarde : <span class="red">${tarde}</span></li>
						<li>Durante a noite : <span class="red">${noite}</span></li>
					</ul>
					<div class="bar" style="margin-bottom: 10px;"></div>
				</div>

				<div class="card hover4">
					<h1>
						Dias - <img src="images/svg/calendar_svg.svg" class="mt-1" />
					</h1>
					<div class="bar"></div>
					<ul style="display: flex;" class="ul-doida">
						<li>Domingo : <span class="yellow">${dom}</span></li>
						<li>Segunda : <span class="yellow">${seg}</span></li>
						<li>Terça : <span class="yellow">${terc}</span></li>
						<li>Quarta : <span class="yellow">${quar}</span></li>
						<li>Quinta : <span class="yellow">${quin}</span></li>
						<li>Sexta : <span class="yellow">${sex}</span></li>
						<li>Sábado : <span class="yellow">${sab}</span></li>
					</ul>
					<div class="bar" style="margin-bottom: 10px;"></div>
				</div>
			</div>
		</div>
	</main>
</body>

</html>