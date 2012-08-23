#! ce._core.views.professionareas.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.professionareas", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "professionareas/show")

