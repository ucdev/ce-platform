#! ce._core.models.Pagelayoutmenu extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Pagelayoutmenu = Backbone.Model.extend
      url: ->
                base = "/api/pagelayoutmenus/"
                if @isNew()
                    base
                else
                    base + @id

