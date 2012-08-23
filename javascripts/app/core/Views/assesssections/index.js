#! ce._core.views.assesssections.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.assesssections", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "assesssections/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".assesssections").append itemView.el

    newRecord: ->
  )

