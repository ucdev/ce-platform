/*! ce.Collections.Messages extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Messages = Backbone.Collection.extend({
		url: '/api/messages',
		model: ce.Models.Message
	});
});
