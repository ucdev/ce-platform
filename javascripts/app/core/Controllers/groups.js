#! ce._core.controllers.Groups extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Groups = (->
    groups = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("groups")
      window.col = @collection
      main.removeData "groups"
    groups::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    groups::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    groups::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    groups
  )()

