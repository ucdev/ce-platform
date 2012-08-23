#! ce._core.models.Sys_assessresultstatu extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_assessresultstatu = Backbone.Model.extend
      url: ->
                base = "/api/sys_assessresultstatuses/"
                if @isNew()
                    base
                else
                    base + @id

