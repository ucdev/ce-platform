#! ce._core.controllers.Assessanswers extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Assessanswers = (->
    assessanswers = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("assessanswers")
      window.col = @collection
      main.removeData "assessanswers"
    assessanswers::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    assessanswers::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    assessanswers::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    assessanswers
  )()

