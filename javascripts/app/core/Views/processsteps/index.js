#! ce._core.views.processsteps.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.processsteps", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "processsteps/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".processsteps").append itemView.el

    newRecord: ->
  )

