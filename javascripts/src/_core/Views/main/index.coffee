#! ce._core.views.main.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.main", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "main/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".main").append itemView.el

    newRecord: ->
  )

