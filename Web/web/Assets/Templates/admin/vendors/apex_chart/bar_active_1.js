// var options = {
//   colors : ['#A66DD4'],
//     series: [{
//     name: 'Monthly',
//     type: 'column',
//     data: [440, 505, 414, 671, 227, 413, 201, 352, 752, 320, 257, 160],
//   }, {
//     name: 'Yearly',
//     type: 'line',
//     data: [23, 42, 35, 27, 43, 22, 17, 31, 22, 22, 12, 16]
//   }],
//     chart: {
//     height: 265,
//     type: 'line',
//     toolbar: {
//         show: false
//       }
//   },

//   stroke: {
//     width: [0, 4]
//   },
//   dataLabels: {
//     enabled: false,
//     enabledOnSeries: [1]
//   },
//   legend: {
//     show: false
//   },
//   labels: ['01 Jan 2001', '02 Jan 2001', '03 Jan 2001', '04 Jan 2001', '05 Jan 2001', '06 Jan 2001', '07 Jan 2001', '08 Jan 2001', '09 Jan 2001', '10 Jan 2001', '11 Jan 2001', '12 Jan 2001'],
//   xaxis: {
//     type: 'datetime'
//   },
//   yaxis: [{
//     title: {
//     //   text: 'Monthly',
//     },
  
//   }, {
//     opposite: true,
//     title: {
//     //   text: 'Yearly'
//     }
//   }]
//   };

//   var chart = new ApexCharts(document.querySelector("#bar_active"), options);
//   chart.render();

  var options = {
    series: [{
    name: 'Cash Flow',
    data: [1.45, 5.42, 5.9, -0.42, -12.6, -18.1, -18.2, -14.16, -11.1, -6.09, 0.34, 3.88, 13.07,
      5.8, 2, 7.37, 8.1, 13.57, 15.75, 17.1, 19.8, -27.03, -54.4, -47.2, -43.3, -18.6, -
      48.6, -41.1, -39.6, -37.6, -29.4, -21.4, -2.4
    ]
  }],
    chart: {
    type: 'bar',
    height: 350
  },
  plotOptions: {
    bar: {
      colors: {
        ranges: [{
          from: -100,
          to: -46,
          color: '#e64141'
        }, {
          from: -45,
          to: 0,
          color: '#089bab'
        }, {
          from: 0,
          to: 20,
          color: '#FC9F5B'
        }]
      },
      columnWidth: '80%',
    }
  },
  dataLabels: {
    enabled: false,
  },
  yaxis: {
    title: {
      text: 'Growth',
    },
    labels: {
      formatter: function (y) {
        return y.toFixed(0) + "%";
      }
    }
  },
  xaxis: {
    type: 'datetime',
    categories: [
      '2011-01-01', '2011-02-01', '2011-03-01', '2011-04-01', '2011-05-01', '2011-06-01',
      '2011-07-01', '2011-08-01', '2011-09-01', '2011-10-01', '2011-11-01', '2011-12-01',
      '2012-01-01', '2012-02-01', '2012-03-01', '2012-04-01', '2012-05-01', '2012-06-01',
      '2012-07-01', '2012-08-01', '2012-09-01', '2012-10-01', '2012-11-01', '2012-12-01',
      '2013-01-01', '2013-02-01', '2013-03-01', '2013-04-01', '2013-05-01', '2013-06-01',
      '2013-07-01', '2013-08-01', '2013-09-01'
    ],
    labels: {
      rotate: -90
    }
  }
  };

  var chart = new ApexCharts(document.querySelector("#bar_wev"), options);
  chart.render();



  