#! ce._core.models.Filegroup extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Filegroup = Backbone.Model.extend
      url: ->
                base = "/api/filegroups/"
                if @isNew()
                    base
                else
                    base + @id

