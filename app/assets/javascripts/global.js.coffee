## Initializers - Need to run when page is loaded
@loaders = () ->
  splashReady()
  consentReady()
  faqsReady()

$(document).ready(loaders)
$(document).on('page:load', loaders)