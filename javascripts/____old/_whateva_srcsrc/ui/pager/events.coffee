ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
  self.on "pager_loaded", ->
    ce.log.info "pager: loaded"
    return

  self.on "pager_next", ->
    ce.log.info "pager: next page loaded"
    return

  self.on "pager_prev", ->
    ce.log.info "pager: previous page loaded"
    return

  self.on "pager_page_selected", ->
    ce.log.info "pager: selected page loaded"
    return
  return