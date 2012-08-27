#! ce._core.models.Pagelayoutmenu_page.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Pagelayoutmenu_page.coffee = Backbone.Model.extend
      url: ->
                base = "/api/pagelayoutmenu_page.coffee/"
                if @isNew()
                    base
                else
                    base + @id

