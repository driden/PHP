google.charts.load('current', { 'packages': ['bar'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Especie', 'Desfavorable', { role: 'annotation' }, 'Favorable', { role: 'annotation' }],
        ['Perro', 1000, 0, 400, 1],
        ['Gato', 1170, 0, 460, 1],
        ['Loro', 660, 0, 1120, 1]

    ]);

    var options = {
        chart: {
            title: 'Estadísticas por especie'
        },
       legend : 'center',
        
        bars: 'vertical', // Required for Material Bar Charts.
        hAxis: { format: 'decimal' },
        height: 400,
        width: 700,
        isStacked: true,
        series: {
            0: { color: '#ff8080' },
            1: { color: '#66ff66' }

        }
        
    };

    var chart = new google.charts.Bar(document.getElementById('chart_div'));

    chart.draw(data, google.charts.Bar.convertOptions(options));


}