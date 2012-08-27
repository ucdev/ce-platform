$ = require("jquery")
Backbone = require("backbone")
require.ensure ["libs/backbone/backbone.paginator"],->
    require.run("libs/backbone/backbone.paginator")

require("bootstrap")
console.log(Backbone)
class App extends Backbone.View
    constructor:->
        @$win = window
        @$doc = @$win.document
        @$body = @$doc.body
        @el = $("#app")

        @Model = require("app/model")
        @Collection = require("app/collection")

app = new App()

# Backbone.Paginator.clientPager.prototype.whereExpanded = (attrs) ->
#     return _.filter @origModels, (model) ->
#         for key of attrs
#             return false unless attrs[key] is model.get(key)
#         true

Backbone.emulateJSON = true

# # app.on("loaded", ->
# #     ce.log.info("app: started")
# # )
# return
module.setExports(app)