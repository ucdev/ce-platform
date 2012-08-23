#! ce._core.views.stat_entries.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.stat_entries", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "stat_entries/show")

