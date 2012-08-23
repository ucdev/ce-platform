#! ce._core.views.entity_entityroles.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entity_entityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entity_entityroles/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entity_entityroles").append itemView.el

    newRecord: ->
  )

