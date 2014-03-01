<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/stock/highstock.js"></script>
</head>

<body>


<div id="container" style="width:100%; height:600px;"></div>

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

$(function() {

	
	
	$.getJSON('http://localhost:8080/GTAStock/stockEntry?company=AMU', function(data) {
		
		$('#container').highcharts('StockChart', {
			

			rangeSelector : {
				selected : 1,
				buttons: [{
					type: 'minute',
					count: 60,
					text: '1h'
				}, {
					type: 'minute',
					count: 720,
					text: '12h'
				}, {
					type: 'minute',
					count: 1440,
					text: '24h'
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
				data : convertToRightFormat(data),
				tooltip: {
					valueDecimals: 2
				}
			}]
		});
	});

});

</script>

</body>

</html>