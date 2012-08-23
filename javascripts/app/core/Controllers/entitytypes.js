#! ce._core.controllers.Entitytypes extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Entitytypes = (->
    entitytypes = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("entitytypes")
      window.col = @collection
      main.removeData "entitytypes"
    entitytypes::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    entitytypes::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    entitytypes::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    entitytypes
  )()

