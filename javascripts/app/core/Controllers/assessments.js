#! ce._core.controllers.Assessments extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Assessments = (->
    assessments = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("assessments")
      window.col = @collection
      main.removeData "assessments"
    assessments::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    assessments::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    assessments::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    assessments
  )()

