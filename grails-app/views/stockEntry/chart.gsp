<html>
<head>
<link rel="stylesheet" type="text/css" href="<g:resource dir='css' file='gtaStock.css'/>">
</head>

<body>

<!-- start app -->
	<div ng-app="stockApp" ng-controller="StockController">
	<!-- companies -->
	<div id="companies">

		<span data-ng-repeat="company in companies"
			style="margin-left: 10px; margin-right: 10px"> <span
			ng-click="getStockForCompany(company)">{{company}}</span><br>
		</span>

	</div>
	<!-- end companies -->

<!-- chart -->
	<div id="maincontent">
		<div id="container"></div>
		<div>Geselecteerd bedrijf: {{selected}}</div>
	</div>
<!-- end chart -->

<!-- portefeuille -->
	<div id="portefeuille">
	<div style="margin-left: 20px">
		<div class="nav">
			<div data-ng-repeat="player in playerNames" >
				<span class="menuItem" ng:class="{true:'selected', false:''}[player==selectedPlayer]" ng-click="toonSpelerStock(player)">{{player}}</span>			
			</div>
			<div ng-click="showVoegStockToe()">add</div>
		</div>

		<div style="width:100%; position:relative">
		
		<!-- portefeuille -->
		<div id="spelersportefeuille"> 
		
		<div ng-switch on="inputOfDisplay">
		<div id="inputform" ng-switch-when="input" class="animate-switch">
			input form for {{selectedPlayer}} <br>
			Bedrijf: <input type="text" ng-model="company"/><br>
			Aantal: <input type="text" ng-model="amount"/><br>
			Prijs per share: <input type="text" ng-model="pricePerShare"/><br>
			
			<input type="button" value="OK" ng-click="voegStockToe(company, amount, pricePerShare)"/>
			<input type="button" value="Cancel" ng-click="cancelVoegStockToe()"/>
		</div>

		<div ng-switch-when="display" class="animate-switch">
			<div data-ng-repeat="v in portefeuilleVanGeselecteerdeSpeler">
				<b>{{v.symbol}}</b><br>
				aankoopprijs: {{v.buyingprice | cutoffDouble}}<br>
				huidige prijs: {{v.currentprice | cutoffDouble}}<br>
				aantal gekocht: {{v.amountbought | cutoffDouble}}<br>
				<br>
				aankoop totaal: {{(v.buyingprice * v.amountbought) | cutoffDouble}}<br>
				huidige totaal: {{(v.amountbought * v.currentprice) | cutoffDouble}}<br>
				<br>
				winst/verlies: {{ (v.amountbought * v.currentprice) - (v.buyingprice * v.amountbought) | cutoffDouble}}
				
				<hr>
			</div>
		</div>
		</div>
		
		</div>
		<!-- end portefeuille -->
		
		</div>
		</div>
	</div>
<!-- end portefeuille -->	
	
	</div>
<!-- end app -->
	<g:javascript src="angular.min.js"></g:javascript>
	<g:javascript src="jquery-1.8.3.min.js"></g:javascript>
	<g:javascript src="highstock.js"></g:javascript>
	<g:javascript src="gtastock.js"></g:javascript>
	
</body>

</html>