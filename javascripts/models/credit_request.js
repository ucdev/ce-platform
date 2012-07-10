CE.Collections.credit_requests = Backbone.Collection.extend({
	url: '/api/credit_requests',
	model: CE.Models.credit_request
});