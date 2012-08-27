#! ce._core.routers.Page.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Page.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "page.coffee/:id/show": "show"
    "page.coffee/:id/edit": "edit"
  )

