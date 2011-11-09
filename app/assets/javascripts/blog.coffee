jQuery.ajaxSetup(
  'beforeSend': (xhr) ->
    xhr.setRequestHeader("Accept", "text/javascript")
)
jQuery ->
  $('#header a, .post h2 a, .content-sidebar a, .site_map a').pjax('[data-pjax-container]')

  # clippy
  $(".clippy").live 
    clippycopy: (e, data) ->
      data.text = $(this).children(".clippy_code").text()
    clippyover: ->
      $(this).children(".clippy_label").text "copiar"
    clippyout: ->
      $(this).children(".clippy_label").text ""
    clippycopied: ->
      $(this).children(".clippy_label").text "texto copiado"

  # posts tabs
  $(".post .tabs").click ->
    $("#tabsContainer .tabs, #tabsContainer .tab-content").removeClass "selected"
    $(this).addClass "selected"
    $("#tabsContainer .tab-content").eq($(this).index()).addClass "selected"

  # fix template error whit empty attribute
  $("#searchform #s, #searchform #go").val("")
  