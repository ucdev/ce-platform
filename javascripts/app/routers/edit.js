/*! ce.Routers.Edit extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Edit = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'edit/:id': 'show',
			'edit/:id': 'edit'
		}
	});
});
