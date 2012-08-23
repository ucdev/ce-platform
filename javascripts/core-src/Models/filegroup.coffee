#! ce._core.models.Filegroup.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Filegroup.coffee = Backbone.Model.extend
      url: ->
                base = "/api/filegroup.coffee/"
                if @isNew()
                    base
                else
                    base + @id

