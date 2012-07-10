/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activities
 * @def: views.editView
 */
 
CE.module("activities",function(self,CE,Backbone,Marionette,$,_
	//dependencies (jquery plugins, etc.)
	
	) {
	this.views = this.views || {};
	this.views.editView = Backbone.Marionette.ItemView.extend({
		template: 'activities/edit',
	});
});
