#! ce._core.controllers.Agendas extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Agendas = (->
    agendas = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("agendas")
      window.col = @collection
      main.removeData "agendas"
    agendas::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    agendas::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    agendas::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    agendas
  )()

