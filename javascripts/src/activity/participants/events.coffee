ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
  self.on "filter_loaded", ->
    ce.log.info "participants: filter loaded"
    return

  self.on "participants_loaded", ->
    ce.log.info "participants: loaded"
    return

  self.on "page_loaded", ->
    ce.log.info "participants: page ready"
    return