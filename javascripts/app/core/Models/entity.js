#! ce._core.models.Entity extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity = Backbone.Model.extend
      url: ->
                base = "/api/entities/"
                if @isNew()
                    base
                else
                    base + @id

