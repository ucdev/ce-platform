#! ce._core.views.sys_countries.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_countries", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_countries/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_countries").append itemView.el

    newRecord: ->
  )

