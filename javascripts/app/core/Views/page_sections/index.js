#! ce._core.views.page_sections.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.page_sections", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "page_sections/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".page_sections").append itemView.el

    newRecord: ->
  )

