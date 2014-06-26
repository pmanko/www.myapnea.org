@setFocus = () ->
  $('input, textarea, select').not(':input[type=button], :input[type=hidden], :input[type=submit], :input[type=reset]').first().focus()
  #$('#answer-session :input:enabled:visible:first').focus()


## Initializers - Need to run when page is loaded
@loaders = () ->
  splashReady()
  consentReady()
  faqsReady()
  affixSidebarReady()
  registrationsReady()
  reviewReady()
  setFocus()



$(document).ready(loaders)
$(document).on('page:load', loaders)