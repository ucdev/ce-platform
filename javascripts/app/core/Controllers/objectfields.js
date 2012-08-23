#! ce._core.controllers.Objectfields extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Objectfields = (->
    objectfields = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("objectfields")
      window.col = @collection
      main.removeData "objectfields"
    objectfields::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    objectfields::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    objectfields::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    objectfields
  )()

