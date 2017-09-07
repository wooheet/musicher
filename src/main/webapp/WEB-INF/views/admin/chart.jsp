<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
   <script src="http://code.highcharts.com/highcharts.js"></script>
<!-- 
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
	Highcharts.chart('container', {
	    chart: {
	        type: 'bar'
	    },
	    title: {
	        text: 'Stacked bar chart'
	    },
	    xAxis: {
	        categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Total fruit consumption'
	        }
	    },
	    legend: {
	        reversed: true
	    },
	    plotOptions: {
	        series: {
	            stacking: 'normal'
	        }
	    },
	    series: [{
	        name: 'John',
	        data: [5, 3, 4, 7, 2]
	    }, {
	        name: 'Jane',
	        data: [2, 2, 3, 2, 1]
	    }, {
	        name: 'Joe',
	        data: [3, 4, 4, 2, 5]
	    }]
	});
});
</script>
</head>
<body>

<h1>샘플페이지</h1>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>