#! ce._core.controllers.Locationtypes extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Locationtypes = (->
    locationtypes = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("locationtypes")
      window.col = @collection
      main.removeData "locationtypes"
    locationtypes::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    locationtypes::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    locationtypes::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    locationtypes
  )()

