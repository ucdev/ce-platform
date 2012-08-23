#! ce._core.views.sys_assessquestiontypes.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.sys_assessquestiontypes", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "sys_assessquestiontypes/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".sys_assessquestiontypes").append itemView.el

    newRecord: ->
  )

