#! ce._core.views.projects.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.projects", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "projects/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".projects").append itemView.el

    newRecord: ->
  )

