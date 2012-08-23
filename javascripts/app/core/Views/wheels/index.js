#! ce._core.views.wheels.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.wheels", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "wheels/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".wheels").append itemView.el

    newRecord: ->
  )

