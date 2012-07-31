/*! ce.Collections.Participants extends Backbone.Collection */
ce.pkg("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Participants = Backbone.Collection.extend({
		url: '/api/participants',
		model: ce.Models.Participant
	});
});
