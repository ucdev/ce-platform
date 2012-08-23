#! ce._core.views.sys_assesstypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_assesstypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_assesstypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_assesstypes").append itemView.el

    newRecord: ->
  )

