#! ce._core.views.activity_cdcs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_cdcs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_cdcs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_cdcs").append itemView.el

    newRecord: ->
  )

