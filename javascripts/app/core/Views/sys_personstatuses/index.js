#! ce._core.views.sys_personstatuses.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_personstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_personstatuses/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_personstatuses").append itemView.el

    newRecord: ->
  )

