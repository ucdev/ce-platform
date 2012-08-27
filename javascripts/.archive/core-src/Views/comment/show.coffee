#! ce._core.views.show.coffee.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.show.coffee", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "show.coffee/show")

