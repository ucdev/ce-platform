#! ce._core.views.person_prefs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_prefs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_prefs/show")

