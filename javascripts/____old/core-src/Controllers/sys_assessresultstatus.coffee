#! ce._core.controllers.Sys_assessresultstatus.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Sys_assessresultstatus.coffee = (->
    sys_assessresultstatus.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("sys_assessresultstatus.coffee")
      window.col = @collection
      main.removeData "sys_assessresultstatus.coffee"
    sys_assessresultstatus.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    sys_assessresultstatus.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    sys_assessresultstatus.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    sys_assessresultstatus.coffee
  )()

