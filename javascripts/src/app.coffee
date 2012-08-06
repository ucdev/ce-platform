window.ce = window.ce or {}
ce = new Backbone.Marionette.Application()
ce.module "_core"
ce.module "activity"
ce.module "person"
ce.bind "initialize:before", (options) ->

ce.addRegions
  page: "#page"
  subpage: ".contentBar div.content-container"

ce.bind "initialize:after", (options) ->

ce.addInitializer (options) ->
  debug.info "init: app"

$(document).ready ->


#ce.start();