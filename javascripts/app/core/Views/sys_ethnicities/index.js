#! ce._core.views.sys_ethnicities.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_ethnicities", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_ethnicities/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_ethnicities").append itemView.el

    newRecord: ->
  )

