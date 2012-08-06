/*! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView */
ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.Topbar = Backbone.View.extend({
		template: ce.templates.get('activity_participants-topbar'),
		
		render: function() {
			// RENDER TEMPLATE AND USE AS PAGE HTML
			this.$el.html(_.template(this.template));
		}
	});
});