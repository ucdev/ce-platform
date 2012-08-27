#! ce.user.events @description: logs when user events 
define "app/user/events",["require","backbone","jquery"],(require,Backbone,$) ->
  self = {}
  self.on "loggedIn", ->
    ce.log.info "user: logged in"
    return

  self.on "loggedOut", ->
    ce.log.warn "user: logged out"
    return

  self.on "loaded", ->
    ce.log.info "user: init"
    return

  module.setExports(self)