#! ce._core.pagers.Main extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Main = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'post'
			dataType: 'json'
			url:'/main/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Main
,ce._core.models
