@splashReady = () ->
  null

$(document).on "click", "#submit-rq", () ->
  question_text = $("#rq-text").val()
  submit_path = $(this).data("submit-path")

  #alert(question_text)
  #$.post(submit_path+".js", {question_text: question_text}, null, "script")

  $.ajax({
    type: "POST"
    url: submit_path+".js"
    data: {question_text: question_text}
    dataType: "script"
  })
