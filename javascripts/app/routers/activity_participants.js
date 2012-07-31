/*! ce.Routers.Activity_participants extends Backbone.Marionette.AppRouter */
ce.pkg("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Activity_participants = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'activity_participants/:id': 'show',
			'activity_participants/:id': 'edit'
		}
	});
});
