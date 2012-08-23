#! ce._core.views.occupations.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.occupations", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "occupations/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".occupations").append itemView.el

    newRecord: ->
  )

