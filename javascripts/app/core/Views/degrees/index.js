#! ce._core.views.degrees.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "degrees/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".degrees").append itemView.el

    newRecord: ->
  )

