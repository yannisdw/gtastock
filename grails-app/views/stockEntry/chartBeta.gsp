<html>
<head>
<link rel="stylesheet" type="text/css" href="<g:resource dir='css' file='gtaStock.css'/>">
<link rel="stylesheet" type="text/css" href="<g:resource dir='css' file='bootstrap.min.css'/>">
<link rel="stylesheet" type="text/css" href="<g:resource dir='css' file='starter-template.css'/>">
</head>

<body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

<div class="container">
<div class="starter-template">
<div class="row">

<!-- start app -->
	<div ng-app="stockApp" ng-controller="StockController">
	<!-- companies -->
	<div class="col-md-2">
	<div id="companies">
		<ul class="list-unstyled">
			<li data-ng-repeat="company in companies"
				style="height: 20px"> <span class="clickable"
				ng-click="getStockForCompany(company)">
				<div>{{company}}</div></span><br>
			</li>
		</ul>
	</div>
	</div>
	<!-- end companies -->

<!-- chart -->
	<div class="col-md-10">
	<div id="maincontent">
		<div id="container"></div>
		<div>Geselecteerd bedrijf: {{selected}}</div>
	</div>
	</div>
<!-- end chart -->


		
		</div>
		</div>
	</div>
<!-- end portefeuille -->	
	
	</div>
<!-- end app -->
</div>
</div>
</div>

	<g:javascript src="angular.min.js"></g:javascript>
	<g:javascript src="jquery-1.8.3.min.js"></g:javascript>
	<g:javascript src="highstock.js"></g:javascript>
	<g:javascript src="gtastock.js"></g:javascript>
	<g:javascript src="js/bootstrap.min.js"></g:javascript>
	
</body>

</html>