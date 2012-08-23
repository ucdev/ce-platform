#! ce._core.controllers.Occupations extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Occupations = (->
    occupations = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("occupations")
      window.col = @collection
      main.removeData "occupations"
    occupations::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    occupations::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    occupations::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    occupations
  )()

