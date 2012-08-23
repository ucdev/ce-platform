#! ce._core.views.attendee_steps.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.attendee_steps", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "attendee_steps/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".attendee_steps").append itemView.el

    newRecord: ->
  )

