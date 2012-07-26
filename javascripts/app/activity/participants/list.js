/*! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView */
ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.List = Backbone.Marionette.CompositeView.extend({
		tagName: 'div',
		className: 'activity_participants-page',
		itemView: self.Row,
		template: 'activity_participants-table',
		
		initialize: function() {
			var coll = this.collection;
			
			coll.on('add', this.addOne, this);
			coll.on('all', this.render, this);
			coll.on('reset', this.addAll, this);
			
			coll.fetch({
				data: { testing: ce.activity.Model.get('id') },
				success: function() {
					coll.pager();
				}
			});
		},
		
		addAll: function() {
			this.$el.empty();
			this.collection.each(this.addOne);
		},
		
		addOne: function(item) {
			var view = new self.Row({
				model: ce.Models.Activity_participant
			});
			$('.content-container').append(view.render().el);
		},
		
		render: function() {}
		/*appendHtml: function(collectionView, itemView) {
			var row = itemView.el;
			
			$(row).attr({ 
				 'id': 'attendeeRow-' + itemView.model.get('ATTENDEEID'),
				 'rel': '#PersonOptions' + itemView.model.get('PERSONID')
			});
			
			// DETERMINE IF THE PERSON RECORD IS DELETED (BEING PASSED AS A STRING, NOT A BOOL)
			if(itemView.model.get('PERSONDELETED') == 'true') {
				$(row).addClass('personDeleted');
			}
			collectionView.$('tbody').append(row);
		}*/
	});
});
// JavaScript Document