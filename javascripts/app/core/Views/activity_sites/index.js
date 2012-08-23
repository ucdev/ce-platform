#! ce._core.views.activity_sites.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_sites", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_sites/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_sites").append itemView.el

    newRecord: ->
  )

