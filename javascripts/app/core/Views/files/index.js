#! ce._core.views.files.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.files", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "files/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".files").append itemView.el

    newRecord: ->
  )

