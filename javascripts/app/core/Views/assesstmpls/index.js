#! ce._core.views.assesstmpls.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.assesstmpls", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "assesstmpls/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".assesstmpls").append itemView.el

    newRecord: ->
  )

