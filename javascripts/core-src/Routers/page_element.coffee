#! ce._core.routers.Page_element.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Page_element.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "page_element.coffee/:id/show": "show"
    "page_element.coffee/:id/edit": "edit"
  )

