#! ce._core.views.person_clients.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_clients", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_clients/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_clients").append itemView.el

    newRecord: ->
  )

