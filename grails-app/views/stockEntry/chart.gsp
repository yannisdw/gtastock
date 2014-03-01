<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/stock/highstock.js"></script>
<g:javascript src="angular.min.js"></g:javascript>
</head>

<body>

<div style="float:left">
<a href='#AMU' onclick="javascript:haalDataOp('AMU')">'AMU'</a>
<a href='#BDG' onclick="javascript:haalDataOp('BDG')">'BDG'</a>
<a href='#BET' onclick="javascript:haalDataOp('BET')">'BET'</a>
<a href='#BFA' onclick="javascript:haalDataOp('BFA')">'BFA'</a>
<a href='#BIN' onclick="javascript:haalDataOp('BIN')">'BIN'</a>
<a href='#BLE' onclick="javascript:haalDataOp('BLE')">'BLE'</a>
<a href='#BRU' onclick="javascript:haalDataOp('BRU')">'BRU'</a>
<a href='#BTR' onclick="javascript:haalDataOp('BTR')">'BTR'</a>
<a href='#CNT' onclick="javascript:haalDataOp('CNT')">'CNT'</a>
<a href='#CRE' onclick="javascript:haalDataOp('CRE')">'CRE'</a>
<a href='#DGP' onclick="javascript:haalDataOp('DGP')">'DGP'</a>
<a href='#EYE' onclick="javascript:haalDataOp('EYE')">'EYE'</a>
<a href='#FAC' onclick="javascript:haalDataOp('FAC')">'FAC'</a>
<a href='#FRT' onclick="javascript:haalDataOp('FRT')">'FRT'</a>
<a href='#GOT' onclick="javascript:haalDataOp('GOT')">'GOT'</a>
<a href='#HAL' onclick="javascript:haalDataOp('HAL')">'HAL'</a>
<a href='#HVY' onclick="javascript:haalDataOp('HVY')">'HVY'</a>
<a href='#LSC' onclick="javascript:haalDataOp('LSC')">'LSC'</a>
<a href='#LST' onclick="javascript:haalDataOp('LST')">'LST'</a>
<a href='#LTD' onclick="javascript:haalDataOp('LTD')">'LTD'</a>
<a href='#MAI' onclick="javascript:haalDataOp('MAI')">'MAI'</a>
<a href='#PIS' onclick="javascript:haalDataOp('PIS')">'PIS'</a>
<a href='#PMP' onclick="javascript:haalDataOp('PMP')">'PMP'</a>
<a href='#PON' onclick="javascript:haalDataOp('PON')">'PON'</a>
<a href='#RON' onclick="javascript:haalDataOp('RON')">'RON'</a>
<a href='#SHK' onclick="javascript:haalDataOp('SHK')">'SHK'</a>
<a href='#SHR' onclick="javascript:haalDataOp('SHR')">'SHR'</a>
<a href='#SHT' onclick="javascript:haalDataOp('SHT')">'SHT'</a>
<a href='#SPU' onclick="javascript:haalDataOp('SPU')">'SPU'</a>
<a href='#SUB' onclick="javascript:haalDataOp('SUB')">'SUB'</a>
<a href='#TNK' onclick="javascript:haalDataOp('TNK')">'TNK'</a>
<a href='#UMA' onclick="javascript:haalDataOp('UMA')">'UMA'</a>
<a href='#VAP' onclick="javascript:haalDataOp('VAP')">'VAP'</a>
<a href='#VOM' onclick="javascript:haalDataOp('VOM')">'VOM'</a>
<a href='#WAP' onclick="javascript:haalDataOp('WAP')">'WAP'</a>
<a href='#WIW' onclick="javascript:haalDataOp('WIW')">'WIW'</a>
<a href='#WIZ' onclick="javascript:haalDataOp('WIZ')">'WIZ'</a>
<a href='#WZL' onclick="javascript:haalDataOp('WZL')">'WZL'</a>
<a href='#ZIT' onclick="javascript:haalDataOp('ZIT')">'ZIT'</a>



</div>

<div id="container" style="width:90%; height:600px; float:left"></div>

<div data-ng-app="" data-ng-init="companies=['AMU',
	'BDG',
	'BET',
	'BFA',
	'BIN',
	'BLE',
	'BRU',
	'BTR',
	'CNT',
	'CRE',
	'DGP',
	'EYE',
	'FAC',
	'FRT',
	'GOT',
	'HAL',
	'HVY',
	'LSC',
	'LST',
	'LTD',
	'MAI',
	'PIS',
	'PMP',
	'PON',
	'RON',
	'SHK',
	'SHR',
	'SHT',
	'SPU',
	'SUB',
	'TNK',
	'UMA',
	'VAP',
	'VOM',
	'WAP',
	'WIW',
	'WIZ',
	'WZL',
	'ZIT']" style="float:left; margin-left:20px; margin-right:20px">
<span data-ng-repeat="company in companies">

<span ng-click="toonAlert()">{{ company }}</span><br />
</span>
</div>

<script>



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

function haalDataOp(comp) {
$.getJSON("${createLinkTo( dir:'/') }stockEntry?company="+comp, function(data) {
		
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
				text : comp + ' Stock Price'
			},
			
			series : [{
				name : comp,
				data : convertToRightFormat(data),
				tooltip: {
					valueDecimals: 2
				}
			}]
		});
	});
}

$(function() {

	
	haalDataOp('WIZ')
	

});

function toonAlert() {
	alert("geklikt op " )
}

$(document).ready(function() {
	console.log("ready")
})



</script>

</body>

</html>