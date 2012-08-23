#! ce._core.models.Sys_ethnicity extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_ethnicity = Backbone.Model.extend
      url: ->
                base = "/api/sys_ethnicities/"
                if @isNew()
                    base
                else
                    base + @id

