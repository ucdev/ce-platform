#! ce._core.controllers.Sys_historystyle.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Sys_historystyle.coffee = (->
    sys_historystyle.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("sys_historystyle.coffee")
      window.col = @collection
      main.removeData "sys_historystyle.coffee"
    sys_historystyle.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    sys_historystyle.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    sys_historystyle.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    sys_historystyle.coffee
  )()

