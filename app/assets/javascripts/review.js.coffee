@reviewReady = () ->
  if $(".send-request").length > 0
    $.ajax(
      url: document.URL
      dataType: "script"
    )