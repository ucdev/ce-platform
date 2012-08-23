#! ce._core.routers.Pagelayoutmenus extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Pagelayoutmenus = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "pagelayoutmenus/:id/show": "show"
    "pagelayoutmenus/:id/edit": "edit"
  )

