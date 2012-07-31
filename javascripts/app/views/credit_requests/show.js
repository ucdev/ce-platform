/*! ce.Views.Credit_requests.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'credit_requests/show',
	});
});
