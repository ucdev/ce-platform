#! ce._core.pagers.Cert.coffee extends Backbone.Collection */
ce.module "_core.pagers", (self, ce, Backbone, Marionette, $, _, models) ->
	self.clientCert.coffee = Backbone.Paginator.clientPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/cert.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Cert.coffee
	self.requestCert.coffee = Backbone.Paginator.requestPager.extend
		initialize: ->
		paginator_core:
			type: 'get'
			dataType: 'json'
			url:'/api/cert.coffee/'
		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 15
		parse: (response) ->
			@totalPages = Math.ceil(response.length / @perPage)
			return response
		model: models.Cert.coffee
,ce._core.models
