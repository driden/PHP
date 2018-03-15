$(document).ready(function () {
    const datos = prepararDatos();
    console.log(datos);

    google.charts.load('current', {'packages': ['bar']});
    google.charts.setOnLoadCallback(drawCharts);

    function drawCharts() {
        let arrayData = datosExito(datos);
        const barData = google.visualization.arrayToDataTable(arrayData);
        const barOptions = {
            chart: {
                title: 'Casos cerrados con éxito vs sin éxito'
            },
            legend: 'center',
            bars: 'vertical',
            hAxis: {format: 'decimal'},
            height: 400,
            width: 700,
            isStacked: true,
            series: {
                0: {color: '#ff8080'},
                1: {color: '#66ff66'}

            }
        };

        let barChart = new google.charts.Bar(document.getElementById('exitoVsNoExito'));
        barChart.draw(barData, google.charts.Bar.convertOptions(barOptions));

        const dataAbiertosCerrados = datosAbiertosYCerrados(datos);
        const barDataAyC = google.visualization.arrayToDataTable(dataAbiertosCerrados);
        const barOptionsAyC = {
            chart: {
                title: 'Casos abiertos y cerrados por especie'
            },
            legend: 'center',
            bars: 'vertical',
            hAxis: {format: 'decimal'},
            height: 400,
            width: 700,
            isStacked: true,
            series: {
                0: {color: '#ff8080'},
                1: {color: '#66ff66'}

            }
        };

        let chartAyC = new google.charts.Bar(document.getElementById('abiertosVsCerrados'));
        chartAyC.draw(barDataAyC, google.charts.Bar.convertOptions(barOptionsAyC));
    }
});

function prepararDatos() {
    let datos = [];
    $("div.dato").each(function () {
        let obj = {};

        obj.nombre = $(this).find('input[data=nombre]').val();
        obj.total = parseInt($(this).find('input[data=total]').val());
        obj.abiertos = parseInt($(this).find('input[data=abiertos]').val());
        obj.cerrados = parseInt($(this).find('input[data=cerrados]').val());
        obj.positivos = parseInt($(this).find('input[data=positivos]').val());
        datos.push(obj);
    });
    return datos;
}

function datosExito(datos) {
    let arrayData = [['Especie', 'No exitoso', {role: 'annotation'}, 'Exitoso', {role: 'annotation'}]];
    //[ Nombre, exitoso, 0, no exitoso, 1]

    $.each(datos, (i, dato) => {
        let arrayEspecie = [];
        arrayEspecie.push(dato.nombre);
        arrayEspecie.push(dato.cerrados - dato.positivos);
        arrayEspecie.push(0);
        arrayEspecie.push(dato.positivos);
        arrayEspecie.push(1);

        arrayData.push(arrayEspecie);
    });

    return arrayData;
}

const datosAbiertosYCerrados = (datos) => {
    let arrayData = [['Especie', 'Cerrado', {role: 'annotation'}, 'Abierto', {role: 'annotation'}]];

    $.each(datos, (i, dato) => {
        let array = [];
        array.push(dato.nombre);
        array.push(dato.cerrados);
        array.push(0);
        array.push(dato.abiertos);
        array.push(1);

        arrayData.push(array);
    });

    return arrayData;
};