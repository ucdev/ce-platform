#! ce._core.models.Sys_testtype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_testtype = Backbone.Model.extend
      url: ->
                base = "/api/sys_testtypes/"
                if @isNew()
                    base
                else
                    base + @id

