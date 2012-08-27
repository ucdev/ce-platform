#! ce._core.models.Page.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Page.coffee = Backbone.Model.extend
      url: ->
                base = "/api/page.coffee/"
                if @isNew()
                    base
                else
                    base + @id

