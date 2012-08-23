#! ce._core.controllers.Attendees extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Attendees = (->
    attendees = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("attendees")
      window.col = @collection
      main.removeData "attendees"
    attendees::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    attendees::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    attendees::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    attendees
  )()

