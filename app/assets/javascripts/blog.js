$(document).ready(function() {
  $(".clippy").live({
    'clippycopy': function(e, data) {
      data.text = $(this).children(".clippy_code").text();
    },
    'clippyover': function() {
      $(this).children(".clippy_label").text("copiar");
    },
    'clippyout': function() {
      $(this).children(".clippy_label").text("");
    },
    'clippycopied': function() {
      $(this).children(".clippy_label").text("texto copiado");
    }
  });
});
