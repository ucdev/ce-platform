#! ce.creditinator
ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log) ->
  self.load = (params) ->
    self.trigger "loaded"

  self.on "loaded", ->
    log.info "activity: loaded"
,ce._core.models,ce.log