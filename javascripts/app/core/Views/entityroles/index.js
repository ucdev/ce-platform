#! ce._core.views.entityroles.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entityroles/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entityroles").append itemView.el

    newRecord: ->
  )

