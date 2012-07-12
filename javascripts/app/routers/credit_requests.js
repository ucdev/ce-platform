/*! ce.Routers.Credit_requests extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Credit_requests = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'credit_requests/:id': 'show',
			'credit_requests/:id': 'edit'
		}
	});
});
