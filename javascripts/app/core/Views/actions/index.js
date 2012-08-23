#! ce._core.views.actions.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.actions", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "actions/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".actions").append itemView.el

    newRecord: ->
  )

