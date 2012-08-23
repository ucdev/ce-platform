#! ce._core.views.authorities.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.authorities", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "authorities/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".authorities").append itemView.el

    newRecord: ->
  )

