#! ce._core.routers.Pages extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Pages = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "pages/:id/show": "show"
    "pages/:id/edit": "edit"
  )

