#! ce._core.controllers.Actions extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Actions = (->
    actions = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("actions")
      window.col = @collection
      main.removeData "actions"
    actions::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    actions::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    actions::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    actions
  )()

