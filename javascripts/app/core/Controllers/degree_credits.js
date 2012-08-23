#! ce._core.controllers.Degree_credits extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Degree_credits = (->
    degree_credits = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("degree_credits")
      window.col = @collection
      main.removeData "degree_credits"
    degree_credits::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    degree_credits::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    degree_credits::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    degree_credits
  )()

