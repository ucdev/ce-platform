/*! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView */
ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.List = Backbone.Marionette.CompositeView.extend({
		tagName: 'div',
		className: 'activity_participants-page',
		itemView: self.Row,
		template: 'activity_participants-table',
		appendHtml: function(collectionView, itemView) {
			/*var row = itemView.el;
			*/
			/*$(row).attr({ 
				 'id': 'attendeeRow-' + itemView.model.get('ATTENDEEID'),
				 'rel': '#PersonOptions' + itemView.model.get('PERSONID')
			});
			
			// DETERMINE IF THE PERSON RECORD IS DELETED (BEING PASSED AS A STRING, NOT A BOOL)
			if(itemView.model.get('PERSONDELETED') == 'true') {
				$(row).addClass('personDeleted');
			}*/
			collectionView.$('tbody').append(itemView.el);
		}
	});
});
// JavaScript Document