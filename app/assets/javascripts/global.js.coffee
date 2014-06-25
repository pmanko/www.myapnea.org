@setFocus = () ->
  $(':input:enabled:visible:first').focus()


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