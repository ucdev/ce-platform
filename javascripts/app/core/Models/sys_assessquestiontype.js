#! ce._core.models.Sys_assessquestiontype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_assessquestiontype = Backbone.Model.extend
      url: ->
                base = "/api/sys_assessquestiontypes/"
                if @isNew()
                    base
                else
                    base + @id

