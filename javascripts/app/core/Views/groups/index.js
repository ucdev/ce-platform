#! ce._core.views.groups.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.groups", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "groups/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".groups").append itemView.el

    newRecord: ->
  )

