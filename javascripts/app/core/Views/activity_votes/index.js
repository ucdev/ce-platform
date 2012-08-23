#! ce._core.views.activity_votes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_votes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_votes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_votes").append itemView.el

    newRecord: ->
  )

