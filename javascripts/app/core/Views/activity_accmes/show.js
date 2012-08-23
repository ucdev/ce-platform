#! ce._core.views.activity_accmes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_accmes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_accmes/show")

