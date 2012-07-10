/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: views.indexView
 */
 
CE.module("credit_requests",function(self,CE,Backbone,Marionette,$,_
	//dependencies (jquery plugins, etc.)
	
	) {
	this.views = this.views || {};
	this.views.indexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: this.views.rowView,
		template: 'credit_requests/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.credit_requests').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
