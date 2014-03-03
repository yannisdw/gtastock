<html>
<head>
	<g:javascript src="angular.min.js" ></g:javascript>
	<g:javascript src="jquery-1.8.3.min.js"></g:javascript>
	<g:javascript src="highstock.js"></g:javascript>
	<g:javascript src="gtastock.js"></g:javascript>
</head>

<body>

<div ng-app="stockApp"  ng-controller="StockController">

<div style="float: left" >

<span data-ng-repeat = "company in companies" style="margin-left: 10px; margin-right:10px">
	<span ng-click="getStockForCompany(company)">{{company}}</span><br>
</span>


</div>

<div style="float: left; width:80%">
<div id="container" style="width: 80%; height:600px; "></div>
<div >Geselecteerd bedrijf: {{selected}}</div>
</div>

</div>

<script>

var stockApp = angular.module('stockApp', []);

stockApp.factory('stockFactory', function($http, $q) {
	
	var factory = {};
	
	factory.getCompanies = function() {
		var deferred = $q.defer();
		$http.get('allCompanies').success(function(data){ //relatief tov stockEntry/
			deferred.resolve(data); 
		});
		return deferred.promise;
	};

	factory.haalDataOp = function(company) {
		var deferred = $q.defer();
		$http.get('company?name=' + company).success(function(data){ //relatief tov stockEntry/
			deferred.resolve(data); 
		});
		return deferred.promise;

	};
	
	return factory;
});

stockApp.controller('StockController',function ($scope, stockFactory) {
	$scope.selected = undefined;
	$scope.data = undefined;

	$scope.getStockForCompany = function(company) {
		getStock(company);
	};
	
	var prom = stockFactory.getCompanies();
	prom.then(function(data){  
		$scope.companies = data;
		getStock(data[0]);
	});

	function getStock(company) {
		var prom2 = stockFactory.haalDataOp(company);
		prom2.then(function(data){ 
			$scope.data = data ;
			toonData(data, company);
		});
	}
	
	function toonData(data, comp) {
		$('#container').highcharts('StockChart', {
			

			rangeSelector : {
				selected : 4,
				buttons: [{
					type: 'minute',
					count: 60,
					text: '1h'
				}, {
					type: 'minute',
					count: 300,
					text: '5h'
				}, {
					type: 'minute',
					count: 720,
					text: '12h'
				}, {
					type: 'minute',
					count: 1440,
					text: '24h'
				}, {
					type: 'week',
					count: 1,
					text: '1w'
				}, {
					type: 'month',
					count: 1,
					text: '1m'
				}, {
					type: 'month',
					count: 3,
					text: '3m'
				}, {
					type: 'month',
					count: 6,
					text: '6m'
				}, {
					type: 'ytd',
					text: 'YTD'
				}, {
					type: 'year',
					count: 1,
					text: '1y'
				}, {
					type: 'all',
					text: 'ALL'

				}
					
				]
				
			},

			title : {
				text : comp +' Stock Price'
			},
			
			series : [{
				name : comp,
				data : convertToRightFormat(data),
				tooltip: {
					valueDecimals: 2
				}
			}]
		});
	};

	var convertToRightFormat = function(data) {
		var objarr = new Array();

		var oldTime
		for(var i=0; i<data.length; i++) {
			var smallArr = new Array();
			
			var time = new Date(data[i].timestamp).getTime()
			var value = parseFloat(data[i].value)
			if(!oldTime || (time != oldTime && time > oldTime ) && value > 0.00){
				oldTime = time
				smallArr.push(time)
				smallArr.push(value)
				objarr.push(smallArr)
			}
			   
		};

		return objarr
		
	};
	
});



</script>

</body>

</html>