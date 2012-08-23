#! ce._core.views.processmanagers.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.processmanagers", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "processmanagers/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".processmanagers").append itemView.el

    newRecord: ->
  )

