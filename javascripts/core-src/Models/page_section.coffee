#! ce._core.models.Page_section.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Page_section.coffee = Backbone.Model.extend
      url: ->
                base = "/api/page_section.coffee/"
                if @isNew()
                    base
                else
                    base + @id

