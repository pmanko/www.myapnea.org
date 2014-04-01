@splashReady = () ->
  $("#goal-chart").highcharts
    title:
      text: "MyApnea Enrollment"

    xAxis:
      categories: [
        "Jan"
        "Feb"
        "Mar"
        "Apr"
        "May"
        "Jun"
        "Jul"
        "Aug"
        "Sep"
        "Oct"
        "Nov"
        "Dec"
      ]

    yAxis:
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
        50
        100
        200
        400
        800
        2000
        5000
        10000
        20000
        30000
        40000
      ]
    ]