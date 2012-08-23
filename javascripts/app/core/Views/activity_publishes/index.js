#! ce._core.views.activity_publishes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_publishes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_publishes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_publishes").append itemView.el

    newRecord: ->
  )

