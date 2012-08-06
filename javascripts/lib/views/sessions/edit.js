/*! ce.Views.Sessions.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.Sessions",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'sessions/edit',
	});
});
