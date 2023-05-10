<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let dashboard = {
        init: function () {
            this.getdata1();
            this.getdata2();
            this.getdata3();
        },
        getdata1: function () {
            $.ajax({
                url: '/dashboard01',
                success: function (result) {
                    dashboard.display1(result);
                }
            });
        },
        getdata2: function () {
            $.ajax({
                url: '/dashboard02',
                success: function (result) {
                    dashboard.display2(result);
                }
            });
        },
        getdata3: function () {
            $.ajax({
                url: '/dashboard03',
                success: function (result) {
                    dashboard.display3(result);
                }
            });
        },

        display1: function (result) {
            //차트1 그리는부분
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    // data: [  // 배열안에 배열
                    //     ['Norway', 16],
                    //     ['Germany', 12],
                    //     ['USA', 8],
                    //     ['Sweden', 8],
                    //     ['Netherlands', 8],
                    //     ['ROC', 6],
                    //     ['Austria', 7],
                    //     ['Canada', 4],
                    //     ['Japan', 3]
                    //
                    // ]
                    data: result
                }]
            });
            //차트1 끝
        },
        display2: function () {
            Highcharts.chart('c2', {
                title: {
                    text: 'Sales of petroleum products March, Norway',
                    align: 'left'
                },
                xAxis: {
                    categories: ['Jet fuel', 'Duty-free diesel', 'Petrol', 'Diesel', 'Gas oil']
                },
                yAxis: {
                    title: {
                        text: 'Million liters'
                    }
                },
                tooltip: {
                    valueSuffix: ' million liters'
                },
                plotOptions: {
                    series: {
                        borderRadius: '25%'
                    }
                },
                series: [{
                    type: 'column',
                    name: '2020',
                    data: [59, 83, 65, 228, 184]
                }, {
                    type: 'column',
                    name: '2021',
                    data: [24, 79, 72, 240, 167]
                }, {
                    type: 'column',
                    name: '2022',
                    data: [58, 88, 75, 250, 176]
                }, {
                    type: 'spline',
                    name: 'Average',
                    data: [47, 83.33, 70.66, 239.33, 175.66],
                    marker: {
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[3],
                        fillColor: 'white'
                    }
                }, {
                    type: 'pie',
                    name: 'Total',
                    data: [{
                        name: '2020',
                        y: 619,
                        color: Highcharts.getOptions().colors[0], // 2020 color
                        dataLabels: {
                            enabled: true,
                            distance: -50,
                            format: '{point.total} M',
                            style: {
                                fontSize: '15px'
                            }
                        }
                    }, {
                        name: '2021',
                        y: 586,
                        color: Highcharts.getOptions().colors[1] // 2021 color
                    }, {
                        name: '2022',
                        y: 647,
                        color: Highcharts.getOptions().colors[2] // 2022 color
                    }],
                    center: [75, 65],
                    size: 100,
                    innerSize: '70%',
                    showInLegend: false,
                    dataLabels: {
                        enabled: false
                    }
                }]
            });

        },
        display3: function (result) {
            Highcharts.chart('c3', {
                chart: {
                    type: 'area',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 30,
                        depth: 200
                    }
                },
                title: {
                    text: 'Visual comparison of Mountains Panorama'
                },
                accessibility: {
                    description: 'The chart is showing the shapes of three mountain ranges as three area line series laid out in 3D behind each other.',
                    keyboardNavigation: {
                        seriesNavigation: {
                            mode: 'serialize'
                        }
                    }
                },
                lang: {
                    accessibility: {
                        axis: {
                            xAxisDescriptionPlural: 'The chart has 3 unlabelled X axes, one for each series.'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'Height Above Sea Level',
                        x: -40
                    },
                    labels: {
                        format: '{value:,.0f} MAMSL'
                    },
                    gridLineDashStyle: 'Dash'
                },
                xAxis: [{
                    visible: false
                }, {
                    visible: false
                }, {
                    visible: false
                }],
                plotOptions: {
                    area: {
                        depth: 100,
                        marker: {
                            enabled: false
                        },
                        states: {
                            inactive: {
                                enabled: false
                            }
                        }
                    }
                },
                tooltip: {
                    valueSuffix: ' MAMSL'
                },
                series: [{
                    name: 'Tatra Mountains visible from Rusinowa polana',
                    lineColor: 'rgb(180,90,50)',
                    color: 'rgb(200,110,50)',
                    fillColor: 'rgb(200,110,50)',
                    data: result
                    //     [
                    //     ['Mura?', 1890],
                    //     ['Nowy Wierch', 2009],
                    //     ['Hawra?', 2152],
                    //     ['Płaczliwa Skała', 2142],
                    //     ['Szalony Wierch', 2061],
                    //     ['Karczmarski Wierch', 1438],
                    //     ['Jagni?cy Szczyt', 2230],
                    //     ['Czerwona Turnia', 2284],
                    //     ['Kołowy Szczyt', 2418],
                    //     ['Czarny Szczyt', 2429],
                    //     ['Baranie Rogi', 2526],
                    //     ['?nie?ny Szczyt', 2465],
                    //     ['Lodowy Szczyt', 2627],
                    //     ['Lodowa Kopa', 2602],
                    //     ['Szeroka Jaworzy?ska', 2210],
                    //     ['Horwacki Wierch', 1902],
                    //     ['Spismichałowa Czuba', 2012],
                    //     ['Zielona Czuba', 2130],
                    //     ['Wielicki Szczyt', 2318],
                    //     ['Gerlach', 2655],
                    //     ['Baty?owiecki Szczyt', 2448],
                    //     ['Kaczy Szczyt', 2395],
                    //     ['Zmarzły Szczyt', 2390],
                    //     ['Ko?czysta', 2538],
                    //     ['Młynarz', 2170],
                    //     ['Ganek', 2462],
                    //     ['Wysoka', 2547],
                    //     ['Ci??ki Szczyt', 2520],
                    //     ['Rysy', 2503],
                    //     ['?abi Mnich', 2146],
                    //     ['?abi Ko?', 2291],
                    //     ['?abia Turnia Mi?guszowiecka', 2335],
                    //     ['Wołowa Turnia', 2373]
                    // ]
                }, {
                    xAxis: 1,
                    lineColor: 'rgb(120,160,180)',
                    color: 'rgb(140,180,200)',
                    fillColor: 'rgb(140,180,200)',
                    name: 'Dachstein panorama seen from Krippenstein',
                    data: result
                    //     [
                    //     ['Kufstein', 2049],
                    //     ['Hohe Wildstelle', 2746],
                    //     ['Kleiner Miesberg', 2173],
                    //     ['Großer Miesberg', 2202],
                    //     ['Hochstein', 2543],
                    //     ['Lackner Miesberg', 2232],
                    //     ['Wasenspitze', 2257],
                    //     ['Sinabell', 2349],
                    //     ['Feister Scharte', 2198],
                    //     ['Eselstein', 2556],
                    //     ['Landfriedstein', 2536],
                    //     ['Scheichenspitz', 2667],
                    //     ['Schmiedstock', 2634],
                    //     ['Gamsfeldspitze', 2611],
                    //     ['Edelgriess', 2305],
                    //     ['Koppenkarstein', 2863],
                    //     ['Niederer Gjaidstein', 2483],
                    //     ['Hoher Gjaidstein', 2794],
                    //     ['Hoher Dachstein', 2995],
                    //     ['Niederer Dachstein', 2934],
                    //     ['Hohes Kreuz', 2837],
                    //     ['Hoher Ochsenkogel', 2513]
                    // ]
                }, {
                    xAxis: 2,
                    lineColor: 'rgb(200, 190, 140)',
                    color: 'rgb(200, 190, 140)',
                    fillColor: 'rgb(230, 220, 180)',
                    name: 'Panorama from Col Des Mines',
                    data: result
                    //     [
                    //     ['Combin de la Tsessette', 4141],
                    //     ['Grand Combin de Grafeneire', 4314],
                    //     ['Combin de Corbassi?re', 3716],
                    //     ['Petit Combin', 3672],
                    //     ['Pointe de Boveire', 3212],
                    //     ['Grand Aget', 3133],
                    //     ['Mont Rogneux', 3084],
                    //     ['Dents du Grand L?', 2884],
                    //     ['Monts Telliers', 2951],
                    //     ['Grand Golliat', 3238],
                    //     ['Mont Grande Roch?re', 3326],
                    //     ['Mont de la Fouly', 2871],
                    //     ['T?te de la Payanne', 2452],
                    //     ['Pointe Allobrogia', 3172],
                    //     ['Six Blanc', 2334],
                    //     ['Mont Dolent', 3820],
                    //     ['Aiguille de Triolet', 3870],
                    //     ['Le Tour Noir', 3836],
                    //     ['Aiguille de l\'A Neuve', 3753],
                    //     ['Aiguille d\'Argenti?re', 3900],
                    //     ['Aiguille du Chardonnet', 3824],
                    //     ['Aiguille du Tour', 3540],
                    //     ['Aiguille du Pissoir', 3440],
                    //     ['Le Catogne', 2598],
                    //     ['Pointe de Prosom', 2762],
                    //     ['Pointe Ronde', 2700],
                    //     ['Mont Buet', 3096],
                    //     ['Le Cheval Blanc', 2831],
                    //     ['Pointe de la Finive', 2838],
                    //     ['Pic de Tenneverge', 2985],
                    //     ['Pointe d\'Aboillon', 2819],
                    //     ['Tour Salli?re', 3220],
                    //     ['Le D?me', 3138],
                    //     ['Haute Cime', 3257],
                    //     ['Pierre Avoi', 2473],
                    //     ['Cime de l\'Est', 3178]
                    // ]
                }]
            });
        }
    }
    $(function(){
        dashboard.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Dashboard</h1>

        <div class="col-xl-8 col-lg-7">

            <!-- Chart01 -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Chart01</h6>
                </div>
                <div class="card-body">
                    <div id="c1"></div>
                </div>
            </div>

            <!-- Chart02 -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Chart02</h6>
                </div>
                <div class="card-body">
                    <div id="c2"></div>
                </div>
            </div>

            <!-- Chart03 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Chart03</h6>
                    </div>
                    <div class="card-body">
                        <div id="c3"></div>
                    </div>
                </div>
            </div>
        </div>

</div>
<!-- /.container-fluid -->


