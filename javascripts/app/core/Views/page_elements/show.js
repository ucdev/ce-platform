#! ce._core.views.page_elements.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.page_elements", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "page_elements/show")

