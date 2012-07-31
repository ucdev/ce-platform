/*! ce.Routers.People extends Backbone.Marionette.AppRouter */
ce.pkg("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.People = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'people/:id': 'show',
			'people/:id': 'edit'
		}
	});
});
