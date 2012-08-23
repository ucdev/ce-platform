#! ce._core.views.pagelayoutmenu_pages.RowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayoutmenu_pages", (self, ce, Backbone, Marionette, $, _) ->
  self.RowView = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "pagelayoutmenu_pages/row"
    events:
      "click .destroy": "destroy"
      "click .edit": "edit"

    
    # delete: activity
    destroy: ->

    
    # edit: activity
    edit: ->
  )

