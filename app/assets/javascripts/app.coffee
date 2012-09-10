window.ce = window.ce or {}

ce = new Backbone.Marionette.Application()
test = true
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
Backbone.Paginator.clientPager.prototype.getFilteredCount = ->
	return @sortedAndFilteredModels.length
Backbone.Paginator.clientPager.prototype.getTotalCount = ->
	return @information.totalUnfilteredRecords
Backbone.Paginator.clientPager.prototype.getSelected = ->
    return @whereExpanded(ISSELECTED: true)
Backbone.Paginator.clientPager.prototype.getSelectedCount = ->
    return @whereExpanded(ISSELECTED: true).length

Backbone.emulateJSON = true

ce.on("loaded", ->
    ce.log.info("app: started")
)