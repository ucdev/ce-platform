#! ce._core.views.entitytypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entitytypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entitytypes").append itemView.el

    newRecord: ->
  )

