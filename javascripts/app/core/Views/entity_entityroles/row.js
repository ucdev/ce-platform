#! ce._core.views.entity_entityroles.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_entityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "entity_entityroles/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

