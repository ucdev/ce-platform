#! ce._core.views.grouptypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.grouptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "grouptypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".grouptypes").append itemView.el

    newRecord: ->
  )

