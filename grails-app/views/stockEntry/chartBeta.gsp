<html>
<head>
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
			<select data-ng-options="o.name for o in spelers" data-ng-model="selectedOption"></select>
			<div style="margin-top: 20px">
			
			<div data-ng-repeat="share in activeshares" >
			<div class = "share" style="margin-top: 25px">
				<div>Eigenaar: {{share}}:</div>
				<div data-ng-repeat="sharevalue in share.shares" style="margin-top: 25px">
					<div>
					<div><b>symbool: </b>{{sharevalue.symbol}}</div> 
					<div><b>aantal gekocht: </b>{{sharevalue.amountbought}}</div> 
					<div><b>aankoopprijs: </b>{{sharevalue.buyingprice}}</div>
					<div><b>huidige prijs: </b>{{sharevalue.currentprice}}</div>
					</div>
				</div>
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