/*! ce.Routers.Activities extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Activities = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'activities/:id': 'show',
			'activities/:id': 'edit'
		}
	});
});
