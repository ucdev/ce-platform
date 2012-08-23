#! ce._core.controllers.Wheels extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Wheels = (->
    wheels = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("wheels")
      window.col = @collection
      main.removeData "wheels"
    wheels::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    wheels::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    wheels::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    wheels
  )()

