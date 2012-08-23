#! ce._core.controllers.Assesssections extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Assesssections = (->
    assesssections = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("assesssections")
      window.col = @collection
      main.removeData "assesssections"
    assesssections::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    assesssections::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    assesssections::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    assesssections
  )()

