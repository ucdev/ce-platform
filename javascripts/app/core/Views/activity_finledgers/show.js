#! ce._core.views.activity_finledgers.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_finledgers", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_finledgers/show")

