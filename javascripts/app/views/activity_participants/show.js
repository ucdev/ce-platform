/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activity_participants
 * @def: views.showView
 */
 
ce.module("activity_participants",function(self,ce,Backbone,Marionette,$,_
	//dependencies (jquery plugins, etc.)
	
	) {
	this.views = this.views || {};
	this.views.showView = Backbone.Marionette.ItemView.extend({
		template: 'activity_participants/show',
	});
});
