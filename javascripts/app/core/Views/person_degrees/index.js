#! ce._core.views.person_degrees.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.person_degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "person_degrees/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".person_degrees").append itemView.el

    newRecord: ->
  )

