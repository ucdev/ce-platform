#! ce._core.views.sys_states.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_states", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_states/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_states").append itemView.el

    newRecord: ->
  )

