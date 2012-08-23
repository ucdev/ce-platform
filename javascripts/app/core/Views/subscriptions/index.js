#! ce._core.views.subscriptions.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.subscriptions", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "subscriptions/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".subscriptions").append itemView.el

    newRecord: ->
  )

