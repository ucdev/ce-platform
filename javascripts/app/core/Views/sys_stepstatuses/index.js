#! ce._core.views.sys_stepstatuses.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_stepstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_stepstatuses/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_stepstatuses").append itemView.el

    newRecord: ->
  )

