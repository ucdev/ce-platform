class Foundry.App extends Foundry.Component
    constructor:->
        @$win = window
        @$doc = @$win.document
        @$body = @$doc.body
        @el = $("#app")
        
        # @Model = require("app/model")
        # @Collection = require("app/collection")
        # @Collection_paged = require("app/collection_paged")
        # @User = require("app/user")
        # @log = require("logger")
        # @log.info("app: started")