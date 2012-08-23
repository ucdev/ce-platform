#! ce._core.views.entity_entitytypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entity_entitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entity_entitytypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entity_entitytypes").append itemView.el

    newRecord: ->
  )

