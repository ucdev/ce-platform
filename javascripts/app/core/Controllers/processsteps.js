#! ce._core.controllers.Processsteps extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Processsteps = (->
    processsteps = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("processsteps")
      window.col = @collection
      main.removeData "processsteps"
    processsteps::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    processsteps::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    processsteps::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    processsteps
  )()

