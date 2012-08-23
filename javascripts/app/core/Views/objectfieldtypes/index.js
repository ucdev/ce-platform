#! ce._core.views.objectfieldtypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.objectfieldtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "objectfieldtypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".objectfieldtypes").append itemView.el

    newRecord: ->
  )

