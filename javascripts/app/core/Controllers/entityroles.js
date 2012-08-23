#! ce._core.controllers.Entityroles extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Entityroles = (->
    entityroles = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("entityroles")
      window.col = @collection
      main.removeData "entityroles"
    entityroles::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    entityroles::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    entityroles::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    entityroles
  )()

