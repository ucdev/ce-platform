/*! ce.Models.Activity_cdc extends Backbone.Model */
ce.pkg("Models",function(self,ce,Backbone,Marionette,$,_) {
	this.Activity_cdc =  Backbone.Model.extend({
		url:'/activity_cdc/:id'
	});
});
