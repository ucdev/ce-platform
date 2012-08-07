#! ce.user.events @description: logs when user events 
ce.module "activity.credit_requests", (self, ce, Backbone, Marionette, $, _) ->
  self.on "loaded", ->
    ce.log.info "credit_requests: loaded"

