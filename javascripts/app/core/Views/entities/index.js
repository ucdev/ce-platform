#! ce._core.views.entities.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entities", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entities/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entities").append itemView.el

    newRecord: ->
  )

