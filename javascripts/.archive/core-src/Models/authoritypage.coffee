#! ce._core.models.Authoritypage.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Authoritypage.coffee = Backbone.Model.extend
      url: ->
                base = "/api/authoritypage.coffee/"
                if @isNew()
                    base
                else
                    base + @id

