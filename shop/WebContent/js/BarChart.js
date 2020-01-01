function drawChart() {
   // Define the chart to be drawn.
   var data = google.visualization.arrayToDataTable([
      ['Year', 'NLU fast food'],
	  ['2012',  900],
      ['2013',  1000],
      ['2014',  1170],
      ['2015',  1250],
      ['2016',  1530]
      ]);

   var options = {
      title: 'Biểu đồ thể hiện số lượng khách hàng là thành viên của NLU fast food'	  
   }; 

   // Instantiate and draw the chart.
   var chart = new google.visualization.BarChart(document.getElementById('container'));
   chart.draw(data, options);
}
google.charts.setOnLoadCallback(drawChart);