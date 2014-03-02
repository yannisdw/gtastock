<html>
<head>
	<g:javascript src="angular.min.js" ></g:javascript>
	<g:javascript src="jquery-1.8.3.min.js"></g:javascript>
	<g:javascript src="highstock.js"></g:javascript>
</head>

<body>

<div ng-app="stockApp"  ng-controller="StockController">
<div ng-click = "getcompanies()">do ajax call</div>

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
var stockApp = angular.module('stockApp', [])
stockApp.factory('stockFactory', function($q) {
	
	var factory = {};
	factory.getCompanies = function() {
		var deferred = $q.defer();
		deferred.resolve(['ABC', 'def', 'ghi', 'jklm', 'nopqrst', 'uv', 'wx', 'yz']);
		return deferred.promise;
		
	};

	return factory;
});
stockApp.controller('StockController',function ($scope, stockFactory) {
	stockFactory.getCompanies().then(function(companies){
		console.log("getCompanies")
		$scope.companies = companies;
	}); 
	
	$scope.selected = undefined;
	/*
	$scope.getcompanies = function() {
		console.log("call getcompanies")
		return stockFactory.getCompanies();
		
	}*/

	$scope.getStockForCompany = function(company) {
		$scope.selected = company
	}
});

function TextController($scope) {
	$scope.someText = "Start de reis..."
}

<!-- javascript voor chart-->

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
	
}

function haalDataOp(alldata) {
		
		$('#container').highcharts('StockChart', {
			

			rangeSelector : {
				selected : 3,
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
				text : 'WIZ Stock Price'
			},
			
			series : [{
				name : 'WIZ',
				data : convertToRightFormat(alldata),
				tooltip: {
					valueDecimals: 2
				}
			}]
		});
}

$(function() {
	haalDataOp(alldata)
});

var alldata = JSON.parse('[{"share":"WIZ","timestamp":"2013-09-26T19:45:01Z","value":60.28},{"share":"WIZ","timestamp":"2013-09-26T20:00:01Z","value":59.46},{"share":"WIZ","timestamp":"2013-09-26T22:00:03Z","value":59.96},{"share":"WIZ","timestamp":"2013-09-27T00:00:00Z","value":60.16},{"share":"WIZ","timestamp":"2013-09-27T02:00:00Z","value":60.07},{"share":"WIZ","timestamp":"2013-09-27T04:00:00Z","value":59.89},{"share":"WIZ","timestamp":"2013-09-27T06:15:03Z","value":59.86},{"share":"WIZ","timestamp":"2013-09-27T08:15:02Z","value":59.79},{"share":"WIZ","timestamp":"2013-09-27T10:00:01Z","value":59.15},{"share":"WIZ","timestamp":"2013-09-27T11:45:02Z","value":58.85},{"share":"WIZ","timestamp":"2013-09-27T13:45:01Z","value":58.74},{"share":"WIZ","timestamp":"2013-09-27T16:00:03Z","value":58.5},{"share":"WIZ","timestamp":"2013-09-27T18:00:02Z","value":58.83},{"share":"WIZ","timestamp":"2013-09-27T19:45:04Z","value":58.57},{"share":"WIZ","timestamp":"2013-09-27T22:00:02Z","value":58.46},{"share":"WIZ","timestamp":"2013-09-28T00:00:01Z","value":58.71},{"share":"WIZ","timestamp":"2013-09-28T02:00:02Z","value":58.75},{"share":"WIZ","timestamp":"2013-09-28T04:00:03Z","value":58.96},{"share":"WIZ","timestamp":"2013-09-28T06:00:02Z","value":58.94},{"share":"WIZ","timestamp":"2013-09-28T08:00:03Z","value":59.21},{"share":"WIZ","timestamp":"2013-09-28T08:45:04Z","value":58.99},{"share":"WIZ","timestamp":"2013-09-28T11:00:20Z","value":58.9},{"share":"WIZ","timestamp":"2013-09-28T13:00:01Z","value":58.81},{"share":"WIZ","timestamp":"2013-09-28T15:00:01Z","value":58.55},{"share":"WIZ","timestamp":"2013-09-28T17:00:01Z","value":58.66},{"share":"WIZ","timestamp":"2013-09-28T19:00:01Z","value":58.6},{"share":"WIZ","timestamp":"2013-09-28T21:00:01Z","value":58.21},{"share":"WIZ","timestamp":"2013-09-28T23:00:01Z","value":58.45},{"share":"WIZ","timestamp":"2013-09-29T01:00:01Z","value":58.26},{"share":"WIZ","timestamp":"2013-09-29T03:00:01Z","value":58.49},{"share":"WIZ","timestamp":"2013-09-29T05:00:02Z","value":58.3},{"share":"WIZ","timestamp":"2013-09-29T06:00:01Z","value":57.98},{"share":"WIZ","timestamp":"2013-09-29T07:15:01Z","value":57.72},{"share":"WIZ","timestamp":"2013-09-29T08:30:01Z","value":57.31},{"share":"WIZ","timestamp":"2013-09-29T10:30:01Z","value":57.31},{"share":"WIZ","timestamp":"2013-09-29T11:00:07Z","value":57.51},{"share":"WIZ","timestamp":"2013-09-29T13:45:01Z","value":57.4},{"share":"WIZ","timestamp":"2013-09-29T15:45:01Z","value":57.21}]');

</script>

</body>

</html>