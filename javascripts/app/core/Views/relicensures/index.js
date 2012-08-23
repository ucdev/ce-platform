#! ce._core.views.relicensures.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.relicensures", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "relicensures/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".relicensures").append itemView.el

    newRecord: ->
  )

