#! ce._core.views.authorities.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.authorities", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "authorities/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

