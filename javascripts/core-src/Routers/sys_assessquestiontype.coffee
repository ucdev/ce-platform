#! ce._core.routers.Sys_assessquestiontype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_assessquestiontype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_assessquestiontype.coffee/:id/show": "show"
    "sys_assessquestiontype.coffee/:id/edit": "edit"
  )

