#! ce._core.views.sys_roles.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_roles", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_roles/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_roles").append itemView.el

    newRecord: ->
  )

