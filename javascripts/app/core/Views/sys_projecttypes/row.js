#! ce._core.views.sys_projecttypes.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_projecttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_projecttypes/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

