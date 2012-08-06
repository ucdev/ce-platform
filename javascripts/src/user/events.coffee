#! ce.user.events @description: logs when user events 
ce.module "user", (self, ce, Backbone, Marionette, $, _) ->
  self.on "loggedIn", ->
    ce.log.info "user: logged in"

  self.on "loggedOut", ->
    ce.log.warn "user: logged out"

  self.on "loaded", ->
    ce.log.info "user: loaded"

