$(document).on "turbolinks:load", ->
  $(".store .entry > img").on "click", ->
    $(this).parent().find(":submit").click()