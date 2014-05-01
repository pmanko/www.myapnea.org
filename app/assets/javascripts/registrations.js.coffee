@registrationsReady = () ->
  $('#registration input#user_date_of_birth').attr('type', 'text')

$(document).on 'focus', '#registration input#user_date_of_birth', () ->
  $(this).attr('type', 'date')

$(document).on 'blur', '#registration input#user_date_of_birth', () ->
   if $(this).val() == ''
     $(this).attr('type', 'text')
     alert("hooo")
