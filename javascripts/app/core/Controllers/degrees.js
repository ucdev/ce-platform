#! ce._core.controllers.Degrees extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Degrees = (->
    degrees = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("degrees")
      window.col = @collection
      main.removeData "degrees"
    degrees::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    degrees::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    degrees::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    degrees
  )()

