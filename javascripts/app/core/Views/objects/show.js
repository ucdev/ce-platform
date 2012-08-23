#! ce._core.views.objects.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objects", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "objects/show")

