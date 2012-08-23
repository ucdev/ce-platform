#! ce._core.controllers.Twilio_logs extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Twilio_logs = (->
    twilio_logs = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("twilio_logs")
      window.col = @collection
      main.removeData "twilio_logs"
    twilio_logs::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    twilio_logs::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    twilio_logs::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    twilio_logs
  )()

