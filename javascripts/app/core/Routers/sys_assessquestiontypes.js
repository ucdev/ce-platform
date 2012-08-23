#! ce._core.routers.Sys_assessquestiontypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_assessquestiontypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_assessquestiontypes/:id/show": "show"
    "sys_assessquestiontypes/:id/edit": "edit"
  )

