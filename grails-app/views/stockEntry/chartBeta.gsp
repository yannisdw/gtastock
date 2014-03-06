<html>
<head>
<link rel="stylesheet" type="text/css" href="<g:resource dir='css' file='gtaStock.css'/>">
</head>

<body>

	<div ng-app="stockApp" ng-controller="StockController">

		<div style="float: left; width: 5%">

			<span data-ng-repeat="company in companies"
				style="margin-left: 10px; margin-right: 10px"> <span
				ng-click="getStockForCompany(company)">{{company}}</span><br>
			</span>

		</div>

		<div style="float: left; width: 75%">
			<div id="container" style="height: 600px;"></div>
			<div>Geselecteerd bedrijf: {{selected}}</div>
		</div>


		<div style="float: left; width: 20%">
			<div style="margin-top: 20px">
			
			<div class="nav">
			<div data-ng-repeat="player in playerNames" >
			
				<div class="menuItem">{{player}}</div>			
			
			</div>
			</div>
			
			
			</div>
		</div>
	</div>

	<g:javascript src="angular.min.js"></g:javascript>
	<g:javascript src="jquery-1.8.3.min.js"></g:javascript>
	<g:javascript src="highstock.js"></g:javascript>
	<g:javascript src="gtastock.js"></g:javascript>
	
</body>

</html>