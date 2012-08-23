#! ce._core.routers.Page_section.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Page_section.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "page_section.coffee/:id/show": "show"
    "page_section.coffee/:id/edit": "edit"
  )

