#! ce._core.models.Pagelayoutmenu_page extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Pagelayoutmenu_page = Backbone.Model.extend
      url: ->
                base = "/api/pagelayoutmenu_pages/"
                if @isNew()
                    base
                else
                    base + @id

