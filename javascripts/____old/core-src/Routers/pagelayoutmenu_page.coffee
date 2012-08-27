#! ce._core.routers.Pagelayoutmenu_page.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Pagelayoutmenu_page.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "pagelayoutmenu_page.coffee/:id/show": "show"
    "pagelayoutmenu_page.coffee/:id/edit": "edit"
  )

