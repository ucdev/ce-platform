#! ce._core.views.attendeecredits.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendeecredits", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "attendeecredits/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

