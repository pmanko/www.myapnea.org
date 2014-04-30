@faqsReady = () ->
  $(".collapse").on "show.bs.collapse", ->
    id = $(this).attr("id")
    $("a[href=\"#" + id + "\"]").closest(".panel-heading").addClass "active-faq"
    $("a[href=\"#" + id + "\"] .panel-title span").html "<i class=\"glyphicon glyphicon-minus\"></i>"
    return

  $(".collapse").on "hide.bs.collapse", ->
    id = $(this).attr("id")
    $("a[href=\"#" + id + "\"]").closest(".panel-heading").removeClass "active-faq"
    $("a[href=\"#" + id + "\"] .panel-title span").html "<i class=\"glyphicon glyphicon-plus\"></i>"
    return