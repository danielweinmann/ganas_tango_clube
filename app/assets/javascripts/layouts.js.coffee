$(document).ready ->
  _.mixin(_.str.exports())
  $("form").on "submit", (event) ->
    event.preventDefault()
    event.stopPropagation()
    $(@).find("#TITLE").val(_.clean($('#lead_title').html()))
    $(@).find("#TEXT").val(_.clean(_.stripTags($('#lead_text').html())))
    $(@).find("#TEXTMD5").val(CryptoJS.MD5($('#lead_text').html()))
    $(@).find("#CALLTOACT").val(_.clean($('#lead_call_to_action').html()))
    $(@).find("#INSTRUCT").val(_.clean($('#lead_instructions').html()))
    $(@).find("#BUTTON").val(_.clean($('#lead_button').val()))
    @.submit()
