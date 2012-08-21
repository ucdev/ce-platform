window.ce = window.ce or {}

ce = new Backbone.Marionette.Application()

ce.module "_core"
ce.module "activity"
ce.module "person"

ce.addRegions
  page: "#page"
  subpage: ".contentBar div.content-container"

ce.addInitializer (options) ->
  ce.trigger("loaded")

Backbone.Paginator.clientPager.prototype.whereExpanded = (attrs) ->
	return _.filter @origModels, (model) ->
		for key of attrs
			return false unless attrs[key] is model.get(key)
		true

Backbone.emulateJSON = true

ce.on("loaded", ->
    ce.log.info("app: started")
)