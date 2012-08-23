#! ce._core.models.Activity_tag_relate extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_tag_relate = Backbone.Model.extend
      url: ->
                base = "/api/activity_tag_relates/"
                if @isNew()
                    base
                else
                    base + @id

