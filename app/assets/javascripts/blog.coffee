jQuery.ajaxSetup(
  'beforeSend': (xhr) ->
    xhr.setRequestHeader("Accept", "text/javascript")
)
jQuery ->
  $('header a, menu a, .pjax, .site_map a').pjax('[data-pjax-container]')

  $('#wrapper').bind 'pjax:end', ->
    window.scroll(0,0)

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
  $(".post .tabs").live 'click', ->
    $("#tabsContainer .tabs, #tabsContainer .tab-content").removeClass "selected"
    $(this).addClass "selected"
    $("#tabsContainer .tab-content").eq($(this).index()).addClass "selected"

  # fix template error whit empty attribute
  $("#searchform #s, #searchform #go").val("")

