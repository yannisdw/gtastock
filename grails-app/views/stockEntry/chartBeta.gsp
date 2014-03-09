<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<g:resource dir='css' file='gtaStock.css'/>">
<link rel="stylesheet" type="text/css"
	href="<g:resource dir='css' file='bootstrap.min.css'/>">
<link rel="stylesheet" type="text/css"
	href="<g:resource dir='css' file='starter-template.css'/>">
</head>

<body ng-app="stockApp">

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">GTA Stock</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#general">Home</a></li>
					<li><a href="#player">Spelersportefeuille</a></li>
					<li><a href="#beta">Beta</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<div class="container">

		<div class="starter-template">
			<div class="row">
				<!-- start app -->
<%--				<div  ng-controller="StockController">--%>
					<div data-ng-view=""></div>
<%--				</div>--%>
				<!-- end app -->
			</div>
		</div>
	</div>

	<g:javascript src="angular.js"></g:javascript>
	<g:javascript src="angular-route.js"></g:javascript>
	<g:javascript src="jquery-1.8.3.min.js"></g:javascript>
	<g:javascript src="highstock.js"></g:javascript>
	<g:javascript src="gtastockBeta.js"></g:javascript>
	<g:javascript src="bootstrap.min.js"></g:javascript>
</body>

</html>