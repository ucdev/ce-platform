/*! ce.Routers.Activity_cdc extends Backbone.Marionette.AppRouter */
ce.pkg("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Activity_cdc = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'activity_cdc/:id': 'show',
			'activity_cdc/:id': 'edit'
		}
	});
});
