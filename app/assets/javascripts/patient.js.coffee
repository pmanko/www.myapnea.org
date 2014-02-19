# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@PatientReady ->
  $('body').scrollspy({ target: '#profile-nav', offset: 0 })

  # Fix for anchor offset problems caused by the fixed main navbar
  $("#profile-nav .nav a[href!=#]").each ->
    $($(this).attr("href")).css("padding-top", "50px").prev().css "margin-bottom", "-50px"

  # Highcharts
  if $("#chart").length > 0
    $("#chart").highcharts
      chart:
        type: "spline"

      title:
        text: "Sleep Diary"

      xAxis:
        type: "datetime"
  #      dateTimeLabelFormats: # don't display the dummy year
  #        month: "%e. %b"
  #        year: "%b"

      yAxis:
        type: "datetime"
        title:
          text: "Time"
        dateTimeLabelFormats:
          second: '%H:%M:%S'
          minute: '%H:%M:%S'
          hour: '%H:%M:%S'
          day: '%H:%M:%S'
          week: '%H:%M:%S'
          month: '%H:%M:%S'
          year: '%H:%M:%S'
        min: Date.UTC(1,1,1,0,0)
        max: Date.UTC(1,1,2,0,0)
      tooltip:
        formatter: ->
          "<b>" + @series.name + "</b><br/>" + Highcharts.dateFormat("%e. %b", @x) + ": " + @y + " m"

      series: [
        name: "Wake Time"

      # Define the data points. All series have a dummy year
      # of 1970/71 in order to be compared on the same x axis. Note
      # that in JavaScript, months start at 0 for January, 1 for February etc.
        data: [[Date.UTC(2013, 8, 11), Date.UTC(1, 1, 1, 10, 0)], [Date.UTC(2013, 8, 12), Date.UTC(1, 1, 1, 11, 0)], [Date.UTC(2013, 8, 13), Date.UTC(1, 1, 1, 10, 30)], [Date.UTC(2013, 8, 14), Date.UTC(1, 1, 1, 9, 0)], [Date.UTC(2013, 8, 15), Date.UTC(1, 1, 1, 10, 0)], [Date.UTC(2013, 8, 16), Date.UTC(1, 1, 1, 12, 0)], [Date.UTC(2013, 8, 17), Date.UTC(1, 1, 1, 8, 30)], [Date.UTC(2013, 8, 18), Date.UTC(1, 1, 1, 10, 10)], [Date.UTC(2013, 8, 19), Date.UTC(1, 1, 1, 10, 0)], [Date.UTC(2013, 8, 20), Date.UTC(1, 1, 1, 9, 0)]]
      ,
        name: "Sleep Time"
        data: [[Date.UTC(2013, 8, 11), Date.UTC(1, 1, 1, 22, 0)], [Date.UTC(2013, 8, 12), Date.UTC(1, 1, 1, 23, 0)], [Date.UTC(2013, 8, 13), Date.UTC(1, 1, 1, 22, 30)], [Date.UTC(2013, 8, 14), Date.UTC(1, 1, 1, 22, 0)], [Date.UTC(2013, 8, 15), Date.UTC(1, 1, 1, 23, 45)], [Date.UTC(2013, 8, 16), Date.UTC(1, 1, 1, 22, 0)], [Date.UTC(2013, 8, 17), Date.UTC(1, 1, 1, 21, 30)], [Date.UTC(2013, 8, 18), Date.UTC(1, 1, 1, 22, 10)], [Date.UTC(2013, 8, 19), Date.UTC(1, 1, 1, 23, 0)], [Date.UTC(2013, 8, 20), Date.UTC(1, 1, 1, 22, 15)]]
  #    ,
  #      name: "Sleep Duration"
  #      data: [[Date.UTC(2013, 8, 11), ], [Date.UTC(2013, 8, 12), Date.UTC(1, 1, 1, 23, 0)], [Date.UTC(2013, 8, 13), Date.UTC(1, 1, 1, 10, 30)], [Date.UTC(2013, 8, 14), Date.UTC(1, 1, 1, 22, 0)], [Date.UTC(2013, 8, 15), Date.UTC(1, 1, 1, 23, 45)], [Date.UTC(2013, 8, 16), Date.UTC(1, 1, 1, 22, 0)], [Date.UTC(2013, 8, 17), Date.UTC(1, 1, 1, 21, 30)], [Date.UTC(2013, 8, 18), Date.UTC(1, 1, 1, 22, 10)], [Date.UTC(2013, 8, 19), Date.UTC(1, 1, 1, 23, 0)], [Date.UTC(2013, 8, 20), Date.UTC(1, 1, 1, 22, 15)]]
      ]

