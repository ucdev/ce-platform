#! ce._core.routers.Pagelayoutmenu_pages extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Pagelayoutmenu_pages = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "pagelayoutmenu_pages/:id/show": "show"
    "pagelayoutmenu_pages/:id/edit": "edit"
  )

