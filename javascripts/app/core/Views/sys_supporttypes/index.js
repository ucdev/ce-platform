#! ce._core.views.sys_supporttypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_supporttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_supporttypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_supporttypes").append itemView.el

    newRecord: ->
  )

