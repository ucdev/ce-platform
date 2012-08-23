#! ce._core.views.filegroups.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.filegroups", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "filegroups/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".filegroups").append itemView.el

    newRecord: ->
  )

