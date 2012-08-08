#! ce._core.pagers.Assets extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.clientAssets = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'post'
			dataType: 'json'
			url:'/assets/loadData'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Asset
	self.requestAssets = Backbone.Paginator.requestPager.extend
		initialize: ->
		paginator_core:
			type: 'post'
			dataType: 'json'
			url:'/assets/loadData'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Asset
,ce._core.models
