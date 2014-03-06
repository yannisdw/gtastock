<html>
<head>
<link rel="stylesheet" type="text/css" href="<g:resource dir='css' file='gtaStock.css'/>">
</head>

<body>

	<div ng-app="stockApp" ng-controller="StockController">

		<div id="companies">

			<span data-ng-repeat="company in companies"
				style="margin-left: 10px; margin-right: 10px"> <span
				ng-click="getStockForCompany(company)">{{company}}</span><br>
			</span>

		</div>

		<div id="maincontent">
			<div id="container"></div>
			<div>Geselecteerd bedrijf: {{selected}}</div>
		</div>


		<div id="portefeuille">
		<div style="margin-left: 20px">
			<div class="nav">
				<div data-ng-repeat="player in playerNames" >
				
					<span class="menuItem" ng:class="{true:'selected', false:''}[player==selectedPlayer]" ng-click="toonSpelerStock(player)">{{player}}</span>			
				
				</div>
			
			</div>
			<div style="width:100%; position:relative">
			<div id="spelersportefeuille"> {{portefeuilleVanGeselecteerdeSpeler}}</div>
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