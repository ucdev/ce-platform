/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activity_credits
 * @def: views.indexView
 */
 
ce.module("activity_credits",function(self,ce,Backbone,Marionette,$,_
	//dependencies (jquery plugins, etc.)
	
	) {
	this.views = this.views || {};
	this.views.indexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: this.views.rowView,
		template: 'activity_credits/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.activity_credits').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
