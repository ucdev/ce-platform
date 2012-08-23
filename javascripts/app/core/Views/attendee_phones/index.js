#! ce._core.views.attendee_phones.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.attendee_phones", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "attendee_phones/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".attendee_phones").append itemView.el

    newRecord: ->
  )

