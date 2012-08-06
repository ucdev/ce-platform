/*! ce.Routers.Activity_credits extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Activity_credits = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'activity_credits/:id': 'show',
			'activity_credits/:id': 'edit'
		}
	});
});
