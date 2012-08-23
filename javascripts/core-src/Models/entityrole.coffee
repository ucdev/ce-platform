#! ce._core.models.Entityrole.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entityrole.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entityrole.coffee/"
                if @isNew()
                    base
                else
                    base + @id

