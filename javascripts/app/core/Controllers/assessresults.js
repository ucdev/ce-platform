#! ce._core.controllers.Assessresults extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Assessresults = (->
    assessresults = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("assessresults")
      window.col = @collection
      main.removeData "assessresults"
    assessresults::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    assessresults::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    assessresults::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    assessresults
  )()

