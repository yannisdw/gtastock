var myBeta = angular.module('myBeta', ['ngRoute']);
myBeta.config(["$routeProvider", function($routeProvider) {
	$routeProvider
		.when('/general',
				{
					controller: 'BetaController',
					templateUrl: '../partials/generalView.html'
				})
		.when('/player', 
				{
					controller: 'BetaController',
					templateUrl: '../partials/playerView.html'
				})
		.otherwise({redirectTo: '/general'});
}]);
myBeta.controller('BetaController',function () {
	
}
);