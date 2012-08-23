#! ce._core.routers.Page_sections extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Page_sections = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "page_sections/:id/show": "show"
    "page_sections/:id/edit": "edit"
  )

