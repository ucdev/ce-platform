#! ce._core.views.stat_entries.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.stat_entries", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "stat_entries/edit")

