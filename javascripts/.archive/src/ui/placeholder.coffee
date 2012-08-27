ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
    unless Modernizr.input.placeholder
      $("input[placeholder]").each ->
        placeholder = $(this).attr("placeholder")
        $(this).val(placeholder).focus(->
          $(this).val ""  if $(this).val() is placeholder
        ).blur ->
          $(this).val placeholder  if $(this).val() is ""
