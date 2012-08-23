#! ce._core.controllers.Process_persons extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Process_persons = (->
    process_persons = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("process_persons")
      window.col = @collection
      main.removeData "process_persons"
    process_persons::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    process_persons::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    process_persons::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    process_persons
  )()

