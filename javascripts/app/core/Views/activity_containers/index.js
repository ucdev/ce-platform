#! ce._core.views.activity_containers.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_containers", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_containers/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_containers").append itemView.el

    newRecord: ->
  )

