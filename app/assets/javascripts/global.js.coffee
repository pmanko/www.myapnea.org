@setFocus = () ->
  $('input, textarea, select').not(':input[type=button], :input[type=hidden], :input[type=submit], :input[type=reset], .no-focus').first().focus()
  #$('#answer-session :input:enabled:visible:first').focus()

@launchShapeWrapper = () ->
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
  launchShapeWrapper()




$(document).ready(loaders)
$(document).on('page:load', loaders)
  .on('scroll', (e) ->
    distanceY = window.pageYOffset || document.documentElement.scrollTop
    shrinkOn = 195
    if distanceY > shrinkOn
      $("header").addClass('smaller')
    else
      if $("header").hasClass('smaller')
        $("header").removeClass('smaller')
  )
