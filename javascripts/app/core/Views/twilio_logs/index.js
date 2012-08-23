#! ce._core.views.twilio_logs.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.twilio_logs", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "twilio_logs/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".twilio_logs").append itemView.el

    newRecord: ->
  )

