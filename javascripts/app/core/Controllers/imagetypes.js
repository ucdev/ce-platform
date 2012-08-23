#! ce._core.controllers.Imagetypes extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Imagetypes = (->
    imagetypes = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("imagetypes")
      window.col = @collection
      main.removeData "imagetypes"
    imagetypes::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    imagetypes::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    imagetypes::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    imagetypes
  )()

