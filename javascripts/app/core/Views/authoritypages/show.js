#! ce._core.views.authoritypages.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.authoritypages", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "authoritypages/show")

