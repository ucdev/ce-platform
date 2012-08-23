#! ce._core.views.agendas.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.agendas", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "agendas/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".agendas").append itemView.el

    newRecord: ->
  )

