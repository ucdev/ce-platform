#! ce._core.views.relicensures.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.relicensures", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "relicensures/show")

