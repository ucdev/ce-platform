#! ce._core.views.activity_faculties.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.activity_faculties", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "activity_faculties/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".activity_faculties").append itemView.el

    newRecord: ->
  )

