#! ce._core.views.objectdatas.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.objectdatas", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "objectdatas/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".objectdatas").append itemView.el

    newRecord: ->
  )

