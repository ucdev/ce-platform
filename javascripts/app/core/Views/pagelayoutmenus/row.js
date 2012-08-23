#! ce._core.views.pagelayoutmenus.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayoutmenus", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "pagelayoutmenus/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

