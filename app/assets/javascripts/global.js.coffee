## Initializers - Need to run when page is loaded
@loaders = () ->
  patientReady()

$(document).ready(loaders)
$(document).on('page:load', loaders)