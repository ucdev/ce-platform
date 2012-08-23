#! ce._core.views.process_persons.IndexView extends Backbone.Marionette.CompositeView 
ce.module "_core.views.process_persons", (self, ce, Backbone, Marionette, $, _) ->
  self.IndexView = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.RowView
    template: "process_persons/index"
    events:
      "click .new": "newRecord"

    appendHtml: (collectionView, itemView) ->
      collectionView.$(".process_persons").append itemView.el

    newRecord: ->
  )

