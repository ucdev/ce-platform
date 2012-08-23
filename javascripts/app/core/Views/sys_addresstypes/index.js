#! ce._core.views.sys_addresstypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_addresstypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_addresstypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_addresstypes").append itemView.el

    newRecord: ->
  )

