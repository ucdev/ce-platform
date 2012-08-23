#! ce._core.controllers.Attendeecredits extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Attendeecredits = (->
    attendeecredits = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("attendeecredits")
      window.col = @collection
      main.removeData "attendeecredits"
    attendeecredits::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    attendeecredits::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    attendeecredits::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    attendeecredits
  )()

