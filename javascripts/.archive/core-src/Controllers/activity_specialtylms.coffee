#! ce._core.controllers.Activity_specialtylms.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Activity_specialtylms.coffee = (->
    activity_specialtylms.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("activity_specialtylms.coffee")
      window.col = @collection
      main.removeData "activity_specialtylms.coffee"
    activity_specialtylms.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    activity_specialtylms.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    activity_specialtylms.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    activity_specialtylms.coffee
  )()

