#! ce._core.models.Authority extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Authority = Backbone.Model.extend
      url: ->
                base = "/api/authorities/"
                if @isNew()
                    base
                else
                    base + @id

