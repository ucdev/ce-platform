#! ce._core.controllers.Objectdatas extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Objectdatas = (->
    objectdatas = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("objectdatas")
      window.col = @collection
      main.removeData "objectdatas"
    objectdatas::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    objectdatas::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    objectdatas::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    objectdatas
  )()

