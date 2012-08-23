#! ce._core.views.imagetypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.imagetypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "imagetypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".imagetypes").append itemView.el

    newRecord: ->
  )

