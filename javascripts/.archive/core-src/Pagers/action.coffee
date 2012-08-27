#! ce._core.pagers.Action.coffee extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.clientAction.coffee = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/action.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Action.coffee
	self.requestAction.coffee = Backbone.Paginator.requestPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/action.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Action.coffee
,ce._core.models
