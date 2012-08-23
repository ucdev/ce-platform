#! ce._core.views.activity_committees.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_committees", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_committees/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_committees").append itemView.el

    newRecord: ->
  )

