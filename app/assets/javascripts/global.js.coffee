## Initializers - Need to run when page is loaded
@loaders = () ->
  splashReady()
$(document).ready(loaders)
$(document).on('page:load', loaders)