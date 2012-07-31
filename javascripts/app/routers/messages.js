/*! ce.Routers.Messages extends Backbone.Marionette.AppRouter */
ce.pkg("Routers",function(self,ce,Backbone,Marionette,$,_) {
	this.Messages = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'messages/:id': 'show',
			'messages/:id': 'edit'
		}
	});
});
