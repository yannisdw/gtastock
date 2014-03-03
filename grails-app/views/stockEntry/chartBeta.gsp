<html>
<head>
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

	<g:javascript src="angular.min.js" ></g:javascript>
	<g:javascript src="jquery-1.8.3.min.js"></g:javascript>
	<g:javascript src="highstock.js"></g:javascript>
	<g:javascript src="gtastock.js"></g:javascript>

</body>

</html>