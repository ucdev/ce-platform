
console.log("app")
Backbone = require("backbone");

class App extends Backbone.View
    constructor:->
        @_core={}
        @models = require("app/models")
        @collections = require("app/collections")
        @activity=require("app/activity")
        @person=require("app/person")
        @user=require("app/user")

app = new App()
Backbone.Paginator.clientPager.prototype.whereExpanded = (attrs) ->
	return _.filter @origModels, (model) ->
		for key of attrs
			return false unless attrs[key] is model.get(key)
		true

Backbone.emulateJSON = true

app.on("loaded", ->
    ce.log.info("app: started")
)

module.setExports(app);