#! ce._core.views.attendeecdcs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.attendeecdcs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "attendeecdcs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".attendeecdcs").append itemView.el

    newRecord: ->
  )

