ce.module "global.ajax", (self, ce, Backbone, Marionette, $, _) ->
  $ ->
    $(document).on "click", ".projectBar .nav-list a", ->
      ce.log.info "subnav clicked"
      return

    $(document).on "click", ".pjaxLinks a", (ev) ->
      ce.log.info "topnav clicked"
      #ev.preventDefault()
      return

    $(".pjaxLinks a").pjax container: "#page"
    $(".projectBar .nav-list a").pjax container: ".contentBar"
    
    $(document).on("ajax:success", ->
      ce.log.info "ajax:success"
      return
    ).on "pjax:success", ->
      ce.log.info "pjax:success"
      return

    $(".contentBar").live "pjax:start", (ev) ->
      return

    $(".contentBar").on "pjax:end", (ev) ->
      $el = $(ev.relatedTarget.parentElement)
      $parent = $el.parent()
      $grandparent = $parent.parent()
      $(".projectBar .nav-list li").removeClass("active").removeClass "open"
      $el.addClass "active"
      $grandparent.addClass "open"  if $parent.hasClass("subnav")
      $el.addClass "open"
      $parent.addClass "open"  if $el.has(".subnav")
      return

    $.bind "ajax:success", (xhr, data, status) ->
      ce.log.dir data
      return

    return
  return