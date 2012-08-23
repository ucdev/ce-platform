#! ce._core.controllers.Assessquestions extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Assessquestions = (->
    assessquestions = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("assessquestions")
      window.col = @collection
      main.removeData "assessquestions"
    assessquestions::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    assessquestions::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    assessquestions::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    assessquestions
  )()

