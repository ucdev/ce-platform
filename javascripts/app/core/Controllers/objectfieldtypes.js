#! ce._core.controllers.Objectfieldtypes extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Objectfieldtypes = (->
    objectfieldtypes = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("objectfieldtypes")
      window.col = @collection
      main.removeData "objectfieldtypes"
    objectfieldtypes::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    objectfieldtypes::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    objectfieldtypes::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    objectfieldtypes
  )()

