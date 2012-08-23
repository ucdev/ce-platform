#! ce._core.controllers.Objectforms extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Objectforms = (->
    objectforms = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("objectforms")
      window.col = @collection
      main.removeData "objectforms"
    objectforms::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    objectforms::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    objectforms::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    objectforms
  )()

