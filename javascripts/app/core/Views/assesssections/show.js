#! ce._core.views.assesssections.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assesssections", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "assesssections/show")

