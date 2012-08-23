#! ce._core.views.sys_apiclients.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_apiclients", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_apiclients/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_apiclients").append itemView.el

    newRecord: ->
  )

