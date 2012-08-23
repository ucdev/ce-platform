#! ce._core.views.pagelayouts.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.pagelayouts", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "pagelayouts/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".pagelayouts").append itemView.el

    newRecord: ->
  )

