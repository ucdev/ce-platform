#! ce._core.models.Activity_tag_relate.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_tag_relate.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_tag_relate.coffee/"
                if @isNew()
                    base
                else
                    base + @id

