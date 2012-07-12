/*! ce.Views.Credit_requests.ShowView extends Backbone.Marionette.ItemView */
ce.module("Views.Credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'credit_requests/show',
	});
});
