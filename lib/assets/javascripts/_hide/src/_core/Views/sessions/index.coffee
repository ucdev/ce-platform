#! ce._core.views.sessions.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sessions", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sessions/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sessions").append itemView.el

    newRecord: ->
  )

