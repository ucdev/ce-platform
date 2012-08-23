#! ce._core.controllers.Objecttypes extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Objecttypes = (->
    objecttypes = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("objecttypes")
      window.col = @collection
      main.removeData "objecttypes"
    objecttypes::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    objecttypes::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    objecttypes::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    objecttypes
  )()

