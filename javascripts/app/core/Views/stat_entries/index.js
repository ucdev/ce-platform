#! ce._core.views.stat_entries.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.stat_entries", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "stat_entries/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".stat_entries").append itemView.el

    newRecord: ->
  )

