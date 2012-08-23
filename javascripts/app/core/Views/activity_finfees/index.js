#! ce._core.views.activity_finfees.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_finfees", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_finfees/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_finfees").append itemView.el

    newRecord: ->
  )

