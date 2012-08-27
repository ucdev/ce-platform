#! ce._core.models.Pagelayoutmenu.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Pagelayoutmenu.coffee = Backbone.Model.extend
      url: ->
                base = "/api/pagelayoutmenu.coffee/"
                if @isNew()
                    base
                else
                    base + @id

