#! ce._core.views.activity_participants.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_participants", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_participants/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_participants").append itemView.el

    newRecord: ->
  )

