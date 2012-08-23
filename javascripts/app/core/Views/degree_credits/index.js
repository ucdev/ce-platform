#! ce._core.views.degree_credits.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.degree_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "degree_credits/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".degree_credits").append itemView.el

    newRecord: ->
  )

