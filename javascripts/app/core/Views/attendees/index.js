#! ce._core.views.attendees.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.attendees", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "attendees/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".attendees").append itemView.el

    newRecord: ->
  )

