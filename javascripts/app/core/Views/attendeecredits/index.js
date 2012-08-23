#! ce._core.views.attendeecredits.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.attendeecredits", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "attendeecredits/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".attendeecredits").append itemView.el

    newRecord: ->
  )

