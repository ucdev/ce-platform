define "app",["require","backbone","jquery","bootstrap"],(require,Backbone,$,bootstrap) ->
    console.info("app: starting")
    Component = require "foundry/component"
    Widget = require "foundry/widget"

    class App extends Component
        constructor:->
            @$win = window
            @$doc = @$win.document
            @$body = @$doc.body
            @el = $("#app")
            
            @Model = require("app/model")
            @Collection = require("app/collection")
            @Collection_paged = require("app/collection_paged")
            @User = require("app/user")
            @log = require("logger")
            @log.info("app: started")

    #app = new App()

    

    #Backbone.emulateJSON = true

    # # app.on("loaded", ->
    # #     ce.log.info("app: started")
    # # )
    # return
    console.log("Inject should be good...")
    module.setExports(App)