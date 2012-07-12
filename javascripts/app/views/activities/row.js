/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activities
 * @def: views.rowView
 */
 
ce.module("activities",function(self,ce,Backbone,Marionette,$,_
	//dependencies (jquery plugins, etc.)
	
	) {
	this.views = this.views || {};
	this.views.rowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'activities/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: activity
		destroy:function() {
			
		},
		
		// edit: activity
		edit:function() {
			
		}
	});
});
