#! ce._core.controllers.Processstep_activities extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Processstep_activities = (->
    processstep_activities = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("processstep_activities")
      window.col = @collection
      main.removeData "processstep_activities"
    processstep_activities::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    processstep_activities::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    processstep_activities::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    processstep_activities
  )()

