@setFocus = () ->
  $('input, textarea, select').not(':input[type=button], :input[type=hidden], :input[type=submit], :input[type=reset], .no-focus').first().focus()
  #$('#answer-session :input:enabled:visible:first').focus()

@loadShapeWrapper = () ->
  $('[data-object~="shape-wrapper"]').each( () ->
    output = shapeWrapper($(this).data('line-height'), $(this).data('xs'))
    $(this).prepend(output)
  )

## Initializers - Need to run when page is loaded
@loaders = () ->
  splashReady()
  consentReady()
  faqsReady()
  affixSidebarReady()
  registrationsReady()
  reviewReady()
  votesReady()
  setFocus()
  dashboardReady()
  loadShapeWrapper()




$(document).ready(loaders)
$(document).on('page:load', loaders)