#! ce._core.pagers.Activity_participants extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_participants = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'post'
			dataType: 'json'
			url:'/activity_participants/loadData'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage) 
			return response
		model: models.Activity_participant
,ce._core.models
