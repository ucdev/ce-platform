#! ce._core.views.objects.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.objects", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "objects/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".objects").append itemView.el

    newRecord: ->
  )

