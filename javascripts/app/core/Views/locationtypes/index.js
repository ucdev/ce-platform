#! ce._core.views.locationtypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.locationtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "locationtypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".locationtypes").append itemView.el

    newRecord: ->
  )

