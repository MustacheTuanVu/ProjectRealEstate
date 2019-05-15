/*Dashboard Init*/

"use strict";

/*****Ready function start*****/
$(document).ready(function () {
    $('#statement').DataTable({
        "bFilter": false,
        "bLengthChange": false,
        "bPaginate": false,
        "bInfo": false,
    });
    if ($('#chart_2').length > 0) {
        var ctx2 = document.getElementById("chart_2").getContext("2d");

        var getJanRealEstate24hIncome = document.getElementById("getJanRealEstate24hIncome");
        if (getJanRealEstate24hIncome) {
            var getJanRealEstate24hIncome = getJanRealEstate24hIncome.innerHTML;
        }

        var getFebRealEstate24hIncome = document.getElementById("getFebRealEstate24hIncome");
        if (getFebRealEstate24hIncome) {
            var getFebRealEstate24hIncome = getFebRealEstate24hIncome.innerHTML;
        }

        var getMarRealEstate24hIncome = document.getElementById("getMarRealEstate24hIncome");
        if (getMarRealEstate24hIncome) {
            var getMarRealEstate24hIncome = getMarRealEstate24hIncome.innerHTML;
        }

        var getAprilRealEstate24hIncome = document.getElementById("getAprilRealEstate24hIncome");
        if (getAprilRealEstate24hIncome) {
            var getAprilRealEstate24hIncome = getAprilRealEstate24hIncome.innerHTML;
        }

        var getMayRealEstate24hIncome = document.getElementById("getMayRealEstate24hIncome");
        if (getMayRealEstate24hIncome) {
            var getMayRealEstate24hIncome = getMayRealEstate24hIncome.innerHTML;
        }

        var data2 = {
            labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5"],
            datasets: [
                {
                    label: "Lợi nhuận",
                    backgroundColor: "rgba(230,154,42,1)",
                    borderColor: "rgba(230,154,42,1)",
                    data: [getJanRealEstate24hIncome, getFebRealEstate24hIncome, getMarRealEstate24hIncome, getAprilRealEstate24hIncome, getMayRealEstate24hIncome]
                }
            ]
        };

        var hBar = new Chart(ctx2, {
            type: "horizontalBar",
            data: data2,

            options: {
                tooltips: {
                    mode: "label"
                },
                scales: {
                    yAxes: [{
                            stacked: true,
                            gridLines: {
                                color: "#878787",
                            },
                            ticks: {
                                fontFamily: "Roboto",
                                fontColor: "#878787"
                            }
                        }],
                    xAxes: [{
                            stacked: true,
                            gridLines: {
                                color: "#878787",
                            },
                            ticks: {
                                fontFamily: "Roboto",
                                fontColor: "#878787"
                            }
                        }],

                },
                elements: {
                    point: {
                        hitRadius: 40
                    }
                },
                animation: {
                    duration: 3000
                },
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    display: false,
                },

                tooltip: {
                    backgroundColor: 'rgba(33,33,33,1)',
                    cornerRadius: 0,
                    footerFontFamily: "'Roboto'"
                }

            }
        });
    }
    if ($('#chart_6').length > 0) {
        var ctx6 = document.getElementById("chart_6").getContext("2d");

        var estateTypeName0 = document.getElementById("estateTypeName0");
        if (estateTypeName0) {
            var estateTypeName0 = estateTypeName0.innerHTML;
        }
        
        var estateTypeName1 = document.getElementById("estateTypeName1");
        if (estateTypeName1) {
            var estateTypeName1 = estateTypeName1.innerHTML;
        }
        
        var estateTypeName2 = document.getElementById("estateTypeName2");
        if (estateTypeName2) {
            var estateTypeName2 = estateTypeName2.innerHTML;
        }
        
        var estateTypePrice0 = document.getElementById("estateTypePrice0");
        if (estateTypePrice0) {
            var estateTypePrice0 = Number(estateTypePrice0.innerHTML);
        }
        
        var estateTypePrice1 = document.getElementById("estateTypePrice1");
        if (estateTypePrice1) {
            var estateTypePrice1 = Number(estateTypePrice1.innerHTML);
        }
        
        var estateTypePrice2 = document.getElementById("estateTypePrice2");
        if (estateTypePrice2) {
            var estateTypePrice2 = Number(estateTypePrice2.innerHTML);
        }

        var data6 = {
            labels: [
                estateTypeName0,
                estateTypeName1,
                estateTypeName2
            ],
            datasets: [
                {
                    data: [estateTypePrice0, estateTypePrice1, estateTypePrice2],
                    backgroundColor: [
                        "#177ec1",
                        "#469408",
                        "#e69a2a",
                    ],
                    hoverBackgroundColor: [
                        "#177ec1",
                        "#469408",
                        "#e69a2a",
                    ]
                }]
        };
        
        console.log(data6);

        var pieChart = new Chart(ctx6, {
            type: 'pie',
            data: data6,
            options: {
                animation: {
                    duration: 3000
                },
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                tooltip: {
                    backgroundColor: 'rgba(33,33,33,1)',
                    cornerRadius: 0,
                    footerFontFamily: "'Roboto'"
                },
                elements: {
                    arc: {
                        borderWidth: 0
                    }
                }
            }
        });
    }
    if ($('#morris_extra_line_chart').length > 0) {
        var data = [{
                period: 'Son',
                iphone: 50,
                ipad: 80,
                itouch: 20
            }, {
                period: 'Mon',
                iphone: 130,
                ipad: 100,
                itouch: 80
            }, {
                period: 'Tue',
                iphone: 80,
                ipad: 60,
                itouch: 70
            }, {
                period: 'Wed',
                iphone: 70,
                ipad: 200,
                itouch: 140
            }, {
                period: 'Thu',
                iphone: 180,
                ipad: 150,
                itouch: 140
            }, {
                period: 'Fri',
                iphone: 105,
                ipad: 100,
                itouch: 80
            },
            {
                period: 'Sat',
                iphone: 250,
                ipad: 150,
                itouch: 200
            }];
        var dataNew = [{
                period: 'Jan',
                iphone: 10,
                ipad: 60,
                itouch: 20
            },
            {
                period: 'Feb',
                iphone: 110,
                ipad: 100,
                itouch: 80
            },
            {
                period: 'March',
                iphone: 120,
                ipad: 100,
                itouch: 80
            },
            {
                period: 'April',
                iphone: 110,
                ipad: 100,
                itouch: 80
            },
            {
                period: 'May',
                iphone: 170,
                ipad: 100,
                itouch: 80
            },
            {
                period: 'June',
                iphone: 120,
                ipad: 150,
                itouch: 80
            },
            {
                period: 'July',
                iphone: 120,
                ipad: 150,
                itouch: 80
            },
            {
                period: 'Aug',
                iphone: 190,
                ipad: 120,
                itouch: 80
            },
            {
                period: 'Sep',
                iphone: 110,
                ipad: 120,
                itouch: 80
            },
            {
                period: 'Oct',
                iphone: 10,
                ipad: 170,
                itouch: 10
            },
            {
                period: 'Nov',
                iphone: 10,
                ipad: 470,
                itouch: 10
            },
            {
                period: 'Dec',
                iphone: 30,
                ipad: 170,
                itouch: 10
            }
        ];
        var lineChart = Morris.Line({
            element: 'morris_extra_line_chart',
            data: data,
            xkey: 'period',
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['iphone', 'ipad', 'itouch'],
            pointSize: 2,
            fillOpacity: 0,
            lineWidth: 2,
            pointStrokeColors: ['#e69a2a', '#dc4666', '#177ec1'],
            behaveLikeLine: true,
            gridLineColor: '#878787',
            hideHover: 'auto',
            lineColors: ['#e69a2a', '#dc4666', '#177ec1'],
            resize: true,
            redraw: true,
            gridTextColor: '#878787',
            gridTextFamily: "Roboto",
            parseTime: false
        });

    }
    /* Switchery Init*/
    var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
    $('#morris_switch').each(function () {
        new Switchery($(this)[0], $(this).data());
    });
    var swichMorris = function () {
        if ($("#morris_switch").is(":checked")) {
            lineChart.setData(data);
            lineChart.redraw();
        } else {
            /* lineChart.setData(dataNew);*/
            /* lineChart.redraw();*/
        }
    }
    swichMorris();
    $(document).on('change', '#morris_switch', function () {
        swichMorris();
    });

});
/*****Ready function end*****/

/*****Load function start*****/
$(window).load(function () {
    window.setTimeout(function () {
        var name = document.getElementById("wellcomename").innerHTML;
        var page = document.getElementById("wellcomepage").innerHTML;
        $.toast({
            heading: 'Xin chào ' + name,
            text: page,
            position: 'top-right',
            loaderBg: '#e69a2a',
            icon: 'success',
            hideAfter: 3500,
            stack: 6
        });
    }, 3000);
});
/*****Load function* end*****/

var sparklineLogin = function () {
    if ($('#sparkline_1').length > 0) {
        $("#sparkline_1").sparkline([2, 4, 4, 6, 8, 5, 6, 4, 8, 6, 6, 2], {
            type: 'line',
            width: '100%',
            height: '35',
            lineColor: '#177ec1',
            fillColor: 'rgba(23,126,193,.2)',
            maxSpotColor: '#177ec1',
            highlightLineColor: 'rgba(0, 0, 0, 0.2)',
            highlightSpotColor: '#177ec1'
        });
    }
    if ($('#sparkline_2').length > 0) {
        $("#sparkline_2").sparkline([0, 2, 8, 6, 8], {
            type: 'line',
            width: '100%',
            height: '35',
            lineColor: '#177ec1',
            fillColor: 'rgba(23,126,193,.2)',
            maxSpotColor: '#177ec1',
            highlightLineColor: 'rgba(0, 0, 0, 0.2)',
            highlightSpotColor: '#177ec1'
        });
    }
    if ($('#sparkline_3').length > 0) {
        $("#sparkline_3").sparkline([0, 23, 43, 35, 44, 45, 56, 37, 40, 45, 56, 7, 10], {
            type: 'line',
            width: '100%',
            height: '35',
            lineColor: '#177ec1',
            fillColor: 'rgba(23,126,193,.2)',
            maxSpotColor: '#177ec1',
            highlightLineColor: 'rgba(0, 0, 0, 0.2)',
            highlightSpotColor: '#177ec1'
        });
    }
    if ($('#sparkline_4').length > 0) {
        $("#sparkline_4").sparkline([0, 2, 8, 6, 8, 5, 6, 4, 8, 6, 6, 2], {
            type: 'bar',
            width: '100%',
            height: '50',
            barWidth: '5',
            resize: true,
            barSpacing: '5',
            barColor: '#e69a2a',
            highlightSpotColor: '#e69a2a'
        });
    }
}
var sparkResize;
$(window).resize(function (e) {
    clearTimeout(sparkResize);
    sparkResize = setTimeout(sparklineLogin, 200);
});
sparklineLogin();