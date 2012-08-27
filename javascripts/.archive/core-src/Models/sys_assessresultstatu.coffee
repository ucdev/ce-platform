#! ce._core.models.Sys_assessresultstatu.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_assessresultstatu.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_assessresultstatu.coffee/"
                if @isNew()
                    base
                else
                    base + @id

