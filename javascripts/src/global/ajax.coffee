ce.module "global.ajax", (self, ce, Backbone, Marionette, $, _) ->
  $ ->
    $(document).on "click", ".projectBar .nav-list a", ->
      ce.log.info "subnav clicked"

    $(document).on "click", ".pjaxLinks a", (ev) ->
      ce.log.info "topnav clicked"
      ev.preventDefault()

    $(".navbar .nav li a").pjax container: "#page"
    $(".projectBar .nav-list a").pjax container: ".contentBar"
    $(document).on("ajax:success", ->
      ce.log.info "ajax:success"
    ).on "pjax:success", ->
      ce.log.info "pjax:success"

    $(".contentBar").live "pjax:start", (ev) ->

    $(".contentBar").on "pjax:end", (ev) ->
      $el = $(ev.relatedTarget.parentElement)
      $parent = $el.parent()
      $grandparent = $parent.parent()
      $(".projectBar .nav-list li").removeClass("active").removeClass "open"
      $el.addClass "active"
      $grandparent.addClass "open"  if $parent.hasClass("subnav")
      $el.addClass "open"
      $parent.addClass "open"  if $el.has(".subnav")

    $.bind "ajax:success", (xhr, data, status) ->
      ce.log.dir data

