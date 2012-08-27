#! ce._core.pagers.Sys_stat_log_type.coffee extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.clientSys_stat_log_type.coffee = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/sys_stat_log_type.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Sys_stat_log_type.coffee
	self.requestSys_stat_log_type.coffee = Backbone.Paginator.requestPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/sys_stat_log_type.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Sys_stat_log_type.coffee
,ce._core.models
