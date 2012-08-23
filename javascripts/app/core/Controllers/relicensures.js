#! ce._core.controllers.Relicensures extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Relicensures = (->
    relicensures = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("relicensures")
      window.col = @collection
      main.removeData "relicensures"
    relicensures::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    relicensures::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    relicensures::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    relicensures
  )()

