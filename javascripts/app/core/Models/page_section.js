#! ce._core.models.Page_section extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Page_section = Backbone.Model.extend
      url: ->
                base = "/api/page_sections/"
                if @isNew()
                    base
                else
                    base + @id

