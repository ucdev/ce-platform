#! ce._core.views.sys_attendeestatuses.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_attendeestatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_attendeestatuses/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_attendeestatuses").append itemView.el

    newRecord: ->
  )

