## Initializers - Need to run when page is loaded
@loaders = () ->
  splashReady()
  consentReady()

$(document).ready(loaders)
$(document).on('page:load', loaders)