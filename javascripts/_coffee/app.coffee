define "app",["require","backbone","jquery","bootstrap"],(require,Backbone,$,bootstrap) ->
    class App extends Backbone.View
        constructor:->
            @$win = window
            @$doc = @$win.document
            @$body = @$doc.body
            @el = $("#app")

            @Model = require("app/model")
            @Collection = require("app/collection")
            @User = require("app/user")
            @log.info("app: started")

    #app = new App()

    # Backbone.Paginator.clientPager.prototype.whereExpanded = (attrs) ->
    #     return _.filter @origModels, (model) ->
    #         for key of attrs
    #             return false unless attrs[key] is model.get(key)
    #         true

    #Backbone.emulateJSON = true

    # # app.on("loaded", ->
    # #     ce.log.info("app: started")
    # # )
    # return
    module.setExports(App)