/*! ce.Views.Credit_requests.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.Credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'credit_requests/edit',
	});
});
