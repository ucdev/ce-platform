/*! ce.Routers.Assets extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Assets = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'assets/:id': 'show',
			'assets/:id': 'edit'
		}
	});
});
