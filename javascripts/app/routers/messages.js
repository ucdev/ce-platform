/*! ce.Routers.Messages extends Backbone.Marionette.AppRouter */
ce.module("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Messages = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'messages/:id': 'show',
			'messages/:id': 'edit'
		}
	});
});
