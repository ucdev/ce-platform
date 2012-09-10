ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
  self.on "loader_loaded", ->
    ce.log.info "loader: loaded"
    return

  self.on "loader_started", ->
    ce.log.info "loader: started"
    return

  self.on "loader_stopped", ->
    ce.log.info "loader: stopped"
    return
  return