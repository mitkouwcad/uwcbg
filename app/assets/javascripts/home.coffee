# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).load( ->
  $('form#new_user')
    .form({
      on: 'blur',
      fields: {
        email: {
          identifier  : 'user[email]',
          rules: [
            {
              type   : 'email',
              prompt : 'Моля въведете валиден имейл адрес!'
            }
          ]
        }
      }
    })
)