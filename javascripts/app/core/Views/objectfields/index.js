#! ce._core.views.objectfields.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.objectfields", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "objectfields/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".objectfields").append itemView.el

    newRecord: ->
  )

