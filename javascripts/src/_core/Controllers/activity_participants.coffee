#! ce.Controllers.Activity_participants extends Backbone.Controller 
ce.module "Controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Activity_participants = (->
    activity_participants = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("activity_participants")
      window.col = @collection
      main.removeData "activity_participants"
    activity_participants::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    activity_participants::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    activity_participants::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    activity_participants
  )()

