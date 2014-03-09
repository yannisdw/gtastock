<!DOCTYPE html>
<html lang="en">
<head>
<title>AngularJS Routing example</title>
<link rel="stylesheet" type="text/css"
	href="<g:resource dir='css' file='bootstrap.min.css'/>">

</head>


<body ng-app="myBeta">

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul class="nav">
					<li><a href="#general"> Add New Order </a></li>
					<li><a href="#player"> Show Order </a></li>
				</ul>
			</div>
			
			<div class="col-md-9">
				<div ng-view></div>
			</div>
		</div>
	</div>
<g:javascript src="angular.js"></g:javascript>
<g:javascript src="angular-route.js"></g:javascript>
<g:javascript src="myBeta/myBeta.js"></g:javascript>

</body>
</html>