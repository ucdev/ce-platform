#! ce._core.views.comments.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.comments", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "comments/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".comments").append itemView.el

    newRecord: ->
  )

