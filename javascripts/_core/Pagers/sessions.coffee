#! ce._core.pagers.Sessions extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.clientSessions = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'post'
			dataType: 'json'
			url:'/sessions/loadData'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Session
	self.requestSessions = Backbone.Paginator.requestPager.extend
		initialize: ->
		paginator_core:
			type: 'post'
			dataType: 'json'
			url:'/sessions/loadData'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Session
,ce._core.models
