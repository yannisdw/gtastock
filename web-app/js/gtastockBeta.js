
var stockApp = angular.module('stockApp', ['ngRoute']);

stockApp.config(["$routeProvider", function($routeProvider) {
	$routeProvider
		.when('/general',
				{
					controller: 'StockController',
					templateUrl: '../partials/generalView.html'
				})
		.when('/player', 
				{
					controller: 'StockController',
					templateUrl: '../partials/playerView.html'
				})
		.when('/beta', 
				{
			controller: 'BetaController',
			templateUrl: '../partials/beta.html'
				})
		.otherwise({redirectTo: '/'});
}]);

stockApp.filter('cutoffDouble', function() {
	return function(value) {
		var s = parseFloat(value).toFixed(2);
		
		var array = s.split('.');
		
		var dottedFirst = array[0].split('').reverse().join('').match(/.{1,3}/g).join('.').split('').reverse().join('')
		
		
		return dottedFirst + "," + array[1];
	}
});

stockApp.factory('stockFactory', function($http, $q) {
	
	var factory = {};
	
	factory.getCompanies = function() {
		var deferred = $q.defer();
		$http.get('allCompanyNames').success(function(data){ //relatief tov stockEntry/
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
	
	factory.haalStockOpVoorSpeler = function(playerName) {
		var deferred = $q.defer();
		$http.get('stockDataForPlayer?playerName=' + playerName).success(function(data) {
			deferred.resolve(data)
		});
		return deferred.promise
	}
	
	factory.haalSpelersOp = function() {
		var deferred = $q.defer();
		$http.get('allPlayerNames').success(function(data) {
			deferred.resolve(data);
		});
		return deferred.promise;
	};
	
	factory.addToPortefeuille = function(playerName, company, amount, price) {
		$http.post('createStockForPlayer', {'playerName': playerName, 'company':company, 'amount':amount, 'price':price});
	}
	
	return factory;
});
stockApp.controller('BetaController', function($scope) {
	
});

stockApp.controller('StockController',function ($scope, stockFactory) {
	$scope.selected = undefined;
	$scope.data = undefined;
	$scope.playerNames = undefined;
	$scope.selectedPlayer = 'Trevor';
	$scope.portefeuilleVanGeselecteerdeSpeler = undefined;
	$scope.inputOfDisplayItems = ['display', 'input'];
	$scope.inputOfDisplay = 	$scope.inputOfDisplayItems[0];
	
	
	/*form*/
	$scope.company = 'comp';
	$scope.amount = 1000;
	$scope.pricePerShare = 3.5;
	
	$scope.getStockForCompany = function(company) {
		getStock(company);
		$scope.selected = company;
	};
	
	var prom = stockFactory.getCompanies();
	prom.then(function(data){  
		console.log("initialize all companies on the scope.")
		$scope.companies = data;
		getStock(data[0]);
		$scope.selected = data[0];
	});

	var spelersProm = stockFactory.haalSpelersOp();
	spelersProm.then(function(data) {
		$scope.playerNames = data;
	});
	
	var currentSpeler = stockFactory.haalStockOpVoorSpeler('Trevor');
	currentSpeler.then(function(data){
		$scope.portefeuilleVanGeselecteerdeSpeler = data;
	}) ;
	
	$scope.toonSpelerStock = function(spelersnaam) {
		$scope.selectedPlayer = spelersnaam;

		var prom = stockFactory.haalStockOpVoorSpeler(spelersnaam);
		prom.then(function(data) {
			$scope.portefeuilleVanGeselecteerdeSpeler = data;
		});
		
	};
	
	$scope.showVoegStockToe = function() {
		$scope.inputOfDisplay = 'input';
		
	}
	
	$scope.voegStockToe = function(company, amount, price) {
		
		console.log("player:" + $scope.selectedPlayer+" - company: " + company + " - amount bought: "+amount + " - price per share:" +price)
		stockFactory.addToPortefeuille($scope.selectedPlayer, company, amount,price);
		$scope.inputOfDisplay = 'display';
		toonSpelerStock($scope.selectedPlayer)
	}
	
	$scope.cancelVoegStockToe = function() {
		$scope.inputOfDisplay = 'display';
	}
	
	function getStock(company) {
		var prom2 = stockFactory.haalDataOp(company);
		prom2.then(function(data){ 
			
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

				}]
				
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
