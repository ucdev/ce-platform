#! ce._core.controllers.Sys_attendeestatus.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Sys_attendeestatus.coffee = (->
    sys_attendeestatus.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("sys_attendeestatus.coffee")
      window.col = @collection
      main.removeData "sys_attendeestatus.coffee"
    sys_attendeestatus.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    sys_attendeestatus.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    sys_attendeestatus.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    sys_attendeestatus.coffee
  )()

