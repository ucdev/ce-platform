#! ce._core.views.entity_credits.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.entity_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "entity_credits/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".entity_credits").append itemView.el

    newRecord: ->
  )

