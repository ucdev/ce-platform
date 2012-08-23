#! ce._core.views.activity_comments.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_comments", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_comments/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_comments").append itemView.el

    newRecord: ->
  )

