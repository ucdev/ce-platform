#! ce._core.controllers.Processmanagers extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Processmanagers = (->
    processmanagers = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("processmanagers")
      window.col = @collection
      main.removeData "processmanagers"
    processmanagers::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    processmanagers::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    processmanagers::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    processmanagers
  )()

