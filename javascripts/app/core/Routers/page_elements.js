#! ce._core.routers.Page_elements extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Page_elements = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "page_elements/:id/show": "show"
    "page_elements/:id/edit": "edit"
  )

