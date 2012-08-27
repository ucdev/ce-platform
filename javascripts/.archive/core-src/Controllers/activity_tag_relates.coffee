#! ce._core.controllers.Activity_tag_relates.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Activity_tag_relates.coffee = (->
    activity_tag_relates.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("activity_tag_relates.coffee")
      window.col = @collection
      main.removeData "activity_tag_relates.coffee"
    activity_tag_relates.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    activity_tag_relates.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    activity_tag_relates.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    activity_tag_relates.coffee
  )()

