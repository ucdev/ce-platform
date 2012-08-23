#! ce._core.views.person_addresses.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_addresses", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_addresses/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_addresses").append itemView.el

    newRecord: ->
  )

