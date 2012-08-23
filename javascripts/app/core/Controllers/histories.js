#! ce._core.controllers.Histories extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Histories = (->
    histories = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("histories")
      window.col = @collection
      main.removeData "histories"
    histories::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    histories::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    histories::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    histories
  )()

