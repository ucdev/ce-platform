#! ce._core.views.sys_activitysteptypes.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_activitysteptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_activitysteptypes/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

