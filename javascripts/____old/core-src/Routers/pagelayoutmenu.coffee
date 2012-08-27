#! ce._core.routers.Pagelayoutmenu.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Pagelayoutmenu.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "pagelayoutmenu.coffee/:id/show": "show"
    "pagelayoutmenu.coffee/:id/edit": "edit"
  )

