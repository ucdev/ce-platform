#! ce._core.views.objecttypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.objecttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "objecttypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".objecttypes").append itemView.el

    newRecord: ->
  )

