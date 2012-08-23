#! ce._core.views.sys_occclasses.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_occclasses", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_occclasses/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_occclasses").append itemView.el

    newRecord: ->
  )

