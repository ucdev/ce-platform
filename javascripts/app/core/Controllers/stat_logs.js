#! ce._core.controllers.Stat_logs extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Stat_logs = (->
    stat_logs = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("stat_logs")
      window.col = @collection
      main.removeData "stat_logs"
    stat_logs::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    stat_logs::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    stat_logs::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    stat_logs
  )()

