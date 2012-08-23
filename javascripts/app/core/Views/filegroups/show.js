#! ce._core.views.filegroups.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.filegroups", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "filegroups/show")

