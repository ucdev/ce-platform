#! ce._core.models.Sys_assesstype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_assesstype = Backbone.Model.extend
      url: ->
                base = "/api/sys_assesstypes/"
                if @isNew()
                    base
                else
                    base + @id

