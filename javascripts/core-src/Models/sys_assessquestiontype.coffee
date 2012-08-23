#! ce._core.models.Sys_assessquestiontype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_assessquestiontype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_assessquestiontype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

