#! ce._core.views.attendee_components.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.attendee_components", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "attendee_components/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".attendee_components").append itemView.el

    newRecord: ->
  )

