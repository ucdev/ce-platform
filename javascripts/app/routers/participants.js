/*! ce.Routers.Participants extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Participants = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'participants/:id': 'show',
			'participants/:id': 'edit'
		}
	});
});
