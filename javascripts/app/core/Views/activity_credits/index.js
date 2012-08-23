#! ce._core.views.activity_credits.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_credits/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_credits").append itemView.el

    newRecord: ->
  )

