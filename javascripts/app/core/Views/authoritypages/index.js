#! ce._core.views.authoritypages.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.authoritypages", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "authoritypages/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".authoritypages").append itemView.el

    newRecord: ->
  )

