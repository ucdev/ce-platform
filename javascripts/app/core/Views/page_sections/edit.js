#! ce._core.views.page_sections.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.page_sections", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "page_sections/edit")

