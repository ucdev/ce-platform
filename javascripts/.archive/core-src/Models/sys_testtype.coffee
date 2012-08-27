#! ce._core.models.Sys_testtype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_testtype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_testtype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

