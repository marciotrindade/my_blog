jQuery.ajaxSetup(
    'beforeSend': (xhr) ->
      xhr.setRequestHeader("Accept", "text/javascript")
)
$(document).ready ->
  $(".clippy").live 
    clippycopy: (e, data) ->
      data.text = $(this).children(".clippy_code").text()
    
    clippyover: ->
      $(this).children(".clippy_label").text "copiar"
    
    clippyout: ->
      $(this).children(".clippy_label").text ""
    
    clippycopied: ->
      $(this).children(".clippy_label").text "texto copiado"
  
  $(".post .tabs").click ->
    $("#tabsContainer .tabs, #tabsContainer .tab-content").removeClass "selected"
    $(this).addClass "selected"
    $("#tabsContainer .tab-content").eq($(this).index()).addClass "selected"
