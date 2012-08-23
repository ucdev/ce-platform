#! ce._core.views.models.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.models", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "models/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".models").append itemView.el

    newRecord: ->
  )

