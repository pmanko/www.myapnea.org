@consentReady = () ->
  $("#consent .scroll").slimscroll(
    height: '385px';
  )

  $("a#print-link").click ->
    $("div#print-area").printArea()
    false
