#! ce._core.pagers.Sys_ethnicity.coffee extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.clientSys_ethnicity.coffee = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/sys_ethnicity.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Sys_ethnicity.coffee
	self.requestSys_ethnicity.coffee = Backbone.Paginator.requestPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/sys_ethnicity.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Sys_ethnicity.coffee
,ce._core.models
