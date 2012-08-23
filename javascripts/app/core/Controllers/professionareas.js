#! ce._core.controllers.Professionareas extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Professionareas = (->
    professionareas = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("professionareas")
      window.col = @collection
      main.removeData "professionareas"
    professionareas::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    professionareas::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    professionareas::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    professionareas
  )()

