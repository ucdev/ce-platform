#! ce._core.views.professionareas.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.professionareas", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "professionareas/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".professionareas").append itemView.el

    newRecord: ->
  )

