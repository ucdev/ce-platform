#! ce._core.models.Group.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Group.coffee = Backbone.Model.extend
      url: ->
                base = "/api/group.coffee/"
                if @isNew()
                    base
                else
                    base + @id

