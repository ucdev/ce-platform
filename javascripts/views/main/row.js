/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: main
 * @def: views.rowView
 */
 
CE.module("main",function(self,CE,Backbone,Marionette,$,_
	//dependencies (jquery plugins, etc.)
	
	) {
	this.views = this.views || {};
	this.views.rowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'main/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: main
		destroy:function() {
			
		},
		
		// edit: main
		edit:function() {
			
		}
	});
});
