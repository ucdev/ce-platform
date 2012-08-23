#! ce._core.views.sys_credits.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_credits/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_credits").append itemView.el

    newRecord: ->
  )

