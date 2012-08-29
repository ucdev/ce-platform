#! ce._core.views.activity_cdc.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_cdc", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_cdc/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_cdc").append itemView.el

    newRecord: ->
  )

