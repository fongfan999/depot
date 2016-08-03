$(document).on "turbolinks:load", ->
  console.log("page loaded")
  $(".store .entry > img").on "click", ->
    $(this).parent().find(":submit").click()