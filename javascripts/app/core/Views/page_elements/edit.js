#! ce._core.views.page_elements.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.page_elements", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "page_elements/edit")

