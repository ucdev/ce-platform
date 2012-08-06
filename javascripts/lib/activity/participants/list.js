/*! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView */
ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.List = Backbone.View.extend({
		template: ce.templates.get('activity_participants-table'),
		className: 'activity_participants-page',
		
		initialize: function() {
			var coll = this.collection;
			
			coll.on('add', this.addOne, this);
			coll.on('all', this.render, this);
			coll.on('reset', this.addAll, this);
		},
		
		render: function() {
			// RENDER TEMPLATE AND USE AS PAGE HTML
			this.$el.html(_.template(this.template));
		}
	});
});