$.fn.toggleErrors = (e) ->
  $(e.target).prev("h4").find("i.indicator").toggleClass "glyphicon-plus glyphicon-minus"

$(document).on('hidden.bs.collapse', '#errorList', $.fn.toggleErrors)
$(document).on('shown.bs.collapse', '#errorList', $.fn.toggleErrors)
