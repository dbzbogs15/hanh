function drawChart() {
   // Define the chart to be drawn.
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Browser');
   data.addColumn('number', 'Percentage');
   data.addRows([
      ['Đồ ăn', 45.0],
      ['Thức uống', 26.8],
      ['Combo', 13.2],
	  ['Tráng miệng', 15.0],
      ]);
   
   
   // Set chart options
   var options = {'title':'Số lượng sản phẩm trong kho  hiện có, 2017',
      'width':550,
      'height':400};

   // Instantiate and draw the chart.
   var chart = new google.visualization.PieChart(document.getElementById('container2'));
   chart.draw(data, options);
}
google.charts.setOnLoadCallback(drawChart);