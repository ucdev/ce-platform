/*! ce.Routers.Sessions extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Sessions = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'sessions/:id': 'show',
			'sessions/:id': 'edit'
		}
	});
});
