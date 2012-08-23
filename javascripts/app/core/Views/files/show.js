#! ce._core.views.files.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.files", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "files/show")

