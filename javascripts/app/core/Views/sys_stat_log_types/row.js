#! ce._core.views.sys_stat_log_types.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_stat_log_types", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_stat_log_types/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

