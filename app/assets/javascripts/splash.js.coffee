@splashReady = () ->
  if $("#splash").length
    $("#goal-chart").highcharts
      title:
        text: "Our Goal: 50,000 Signups"
      legend:
        enabled: false
      xAxis:
        categories: [
          "May 14"
          "Jun 14"
          "Jul 14"
          "Aug 14"
          "Sep 14"
          "Oct 14"
          "Nov 14"
          "Dec 14"
          "Jan 15"
          "Feb 15"
          "Mar 15"
          "Apr 15"
          "May 15"
          "Jun 15"
          "Jul 15"
        ]
        labels:
          step: 3
          maxStaggerLines: 1
          overflow: false

      yAxis:
        min: 0
        title:
          text: "Patients Enrolled"

        plotLines: [
          value: 0
          width: 1
          color: "#808080"
        ]

      series: [
        name: "Enrollment"
        data: [
          0
          100
          200
          300
          400
          500
          1000
          2000
          3000
          4000
          8000
          16000
          32000
          50000
        ]
      ]