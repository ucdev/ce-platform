#! ce._core.models.Authority.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Authority.coffee = Backbone.Model.extend
      url: ->
                base = "/api/authority.coffee/"
                if @isNew()
                    base
                else
                    base + @id

