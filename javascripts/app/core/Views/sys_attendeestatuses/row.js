#! ce._core.views.sys_attendeestatuses.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_attendeestatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_attendeestatuses/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

