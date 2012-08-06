ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
  self.on "filter_loaded", ->
    ce.log.info "participants: filter loaded"

  self.on "participants_loaded", ->
    ce.log.info "participants: loaded"

  self.on "page_loaded", ->
    ce.log.info "participants: page ready"