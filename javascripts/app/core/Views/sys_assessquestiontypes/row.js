#! ce._core.views.sys_assessquestiontypes.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_assessquestiontypes", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "sys_assessquestiontypes/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

