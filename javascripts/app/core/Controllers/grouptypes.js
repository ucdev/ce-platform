#! ce._core.controllers.Grouptypes extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Grouptypes = (->
    grouptypes = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("grouptypes")
      window.col = @collection
      main.removeData "grouptypes"
    grouptypes::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    grouptypes::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    grouptypes::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    grouptypes
  )()

