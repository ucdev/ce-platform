/*! ce.Views.Sessions.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Sessions",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'sessions/show',
	});
});
