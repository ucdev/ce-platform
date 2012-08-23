#! ce._core.controllers.Authoritypages extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Authoritypages = (->
    authoritypages = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("authoritypages")
      window.col = @collection
      main.removeData "authoritypages"
    authoritypages::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    authoritypages::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    authoritypages::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    authoritypages
  )()

